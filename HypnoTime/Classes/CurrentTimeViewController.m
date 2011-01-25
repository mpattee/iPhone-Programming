//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "CurrentTimeViewController.h"


@implementation CurrentTimeViewController

- (id)init
	{
	// Call the superclass's designated initializer
	[super initWithNibName:@"CurrentTimeViewController" bundle:nil];
	
	// Get the tab bar item
	UITabBarItem *tbi = [self tabBarItem];
	
	// Give it a label
	[tbi setTitle:@"Time"];
	[tbi setImage:[UIImage imageNamed:@"Time.png"]];
	
	return self;
	}
	

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
	{
    return [self init];
	}
	
- (IBAction)showCurrentTime:(id)sender
	{
	NSDate *now = [NSDate date];
	
	// Static here means "only once" the variable formatter is created when the program is first loaded into memory. The first time this method is invoked, formatter will be nil and the if-block will execute., creating an nsdateformatter object that formatter will point to. Subsequent entry into this method will reuse the same NSDateFormatter object.
	static NSDateFormatter *formatter = nil;
	if (!formatter)
		{
		formatter = [[NSDateFormatter alloc] init];
		[formatter setTimeStyle:NSDateFormatterShortStyle];
		}
	[timeLabel setText:[formatter stringFromDate:now]];
	}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
	{
    [super viewDidLoad];
	
	// Set the background color of the view so we can see it
//	[[self view] setBackgroundColor:[UIColor greenColor]];
	}

- (void)viewWillAppear:(BOOL)animated
	{
	[super viewWillAppear:animated];
	[self showCurrentTime:nil];
	}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload 
	{
	NSLog(@"Must have received a low memory warning. Releasing timeLabel");
    [super viewDidUnload];
	[timeLabel release];
	timeLabel = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	}


- (void)dealloc {
	[timeLabel release];
    [super dealloc];
}


@end
