//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by Mike Pattee on 1/26/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ImageCache.h"
#import "Possession.h"

@implementation ItemDetailViewController

@synthesize editingPossession;

- (id)init
	{
	[super initWithNibName:@"ItemDetailViewController" bundle:nil];
	
	// Create a UIBarButtonItem with a camera icon, will send takePicture: to our ItemDetailViewController when tapped
	UIBarButtonItem *cameraBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePicture:)];
	
	// Place this image on our navigation bar when this viewcontroller is on top of the navigation stack
	[[self navigationItem] setRightBarButtonItem:cameraBarButtonItem];
	[cameraBarButtonItem release];
	return self;
	}
	
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
	{
	return [self init];
	}
	
- (void)takePicture:(id)sender
	{
	[[self view] endEditing:YES];
	
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	
	// If our device has a camera, we want to take a picture, otherwise we just pick from photo library
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) 
		{
		[imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
		}
	else
		{
		[imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
		}
	[imagePicker setDelegate:self];
	
	// Place image picker onthe screen
	[self presentModalViewController:imagePicker animated:YES];
	
	// the image picker will be retained by ItemDetailsViewController until it has been dismissed
	[imagePicker release];
	}
	
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
	{
	NSString *oldKey = [editingPossession imageKey];
	
	// Did the possession already have an image?
	if (oldKey)
		{
		// Delete the old image
		[[ImageCache sharedImageCache] deleteImageForKey:oldKey];
		}
		
	// Get picked image from info dictionary
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	
	// Create a CFUUID object - it knows how to create unique identifiers
	CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
	
	// Create a string from the unique identifier
	CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
	[editingPossession setImageKey:(NSString *)newUniqueIDString];
	
	// We used "create" in the functions to make objects, we need to release them 
	CFRelease(newUniqueIDString);
	CFRelease(newUniqueID);
	
	// Store image in the ImageCache with this key
	[[ImageCache sharedImageCache] setImage:image forKey:[editingPossession imageKey]];
	
	// Put that image onto the screen in our image view
	[imageView setImage:image];
	
	// Take image picker off the screen - you must call this dismiss method
	[self dismissModalViewControllerAnimated:YES];
	}
	
- (BOOL)textFieldShouldReturn:(UITextField *)textField
	{
	[textField resignFirstResponder];
	return YES;
	}

- (void)viewDidLoad
	{
	[super viewDidLoad];
	[[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	}

- (void)viewWillAppear:(BOOL)animated
	{
	[super viewWillAppear:animated];
	[nameField setText:[editingPossession possessionName]];
	[serialNumberField setText:[editingPossession serialNumber]];
	[valueField setText:[NSString stringWithFormat:@"%d", [editingPossession valueInDollars]]];
	
	// Create a NSDate formatter that will turn a date into a simple date string
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	// use filtered NSDate object to set dateLabel contents
	[dateLabel setText:[dateFormatter stringFromDate:[editingPossession dateCreated]]];
	
	// Change the navigation item to dispaly name of possession
	[[self navigationItem] setTitle:[editingPossession possessionName]];
	
	NSString *imageKey = [editingPossession imageKey];
	
	if (imageKey) 
		{
		// Get image for image key from image cache
		UIImage *imageToDisplay = [[ImageCache sharedImageCache] imageForKey:imageKey];
		// Use that image to put on the screen in imageView
		[imageView setImage:imageToDisplay];
		}
	else 
		{
		// clear the imageview
		[imageView setImage:nil];
		}

	}
	
- (void)viewWillDisappear:(BOOL)animated
	{
	[super viewWillDisappear:animated];
	
	// Clear first responder
	[[self view] endEditing:YES];
	
	// "Save" changes to editingPossession
	[editingPossession setPossessionName:[nameField text]];
	[editingPossession setSerialNumber:[serialNumberField text]];
	[editingPossession setValueInDollars:[[valueField text] intValue]];
	}

- (void)didReceiveMemoryWarning 
	{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
	}

- (void)viewDidUnload 
	{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
	[imageView release];
	imageView = nil;

	[nameField release];
	nameField = nil;
	
	[serialNumberField release];
	serialNumberField = nil;
	
	[valueField release];
	valueField = nil;
	
	[dateLabel release];
	dateLabel = nil;
	}


- (void)dealloc 
	{
	[imageView release];
	[nameField release];
	[serialNumberField release];
	[valueField release];
	[dateLabel release];
    [super dealloc];
	}


@end
