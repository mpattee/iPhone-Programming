    //
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (id)init
	{
	// Call the superclass's designated initializer
	[super initWithNibName:nil bundle:nil];
	
	// Get the tab bar item
	UITabBarItem *tbi = [self tabBarItem];
	
	// Give it a label
	[tbi setTitle:@"Hypnosis"];
	[tbi setImage:[UIImage imageNamed:@"Hypno.png"]];
	
	return self;
	}
	

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
	{
    return [self init];
	}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView 
	{
	HypnosisView *hv = [[HypnosisView alloc] initWithFrame:CGRectZero];
	[hv setBackgroundColor:[UIColor whiteColor]];
	[self setView:hv];
	[hv release];
	}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
	{
    [super viewDidLoad];
	
	// Set the background color of the view so we can see it
//	[[self view] setBackgroundColor:[UIColor orangeColor]];
	}

- (void)viewWillAppear:(BOOL)animated
	{
	[super viewWillAppear:animated];
	
	NSLog(@"Monitoring accelerometer");
	UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
	// Recieve updates ever 1/10th of a second
	[a setUpdateInterval:0.1];
	[a setDelegate:self];
	
	[[self view] becomeFirstResponder];
	}
	
- (void)viewWillDisappear:(BOOL)animated
	{
	[super viewWillDisappear:animated];
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
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

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
	{
//	NSLog(@"%f %f %f", [acceleration x], [acceleration y] ,[acceleration z]);
	HypnosisView *hv = (HypnosisView *)[self view];
	float xShift = [hv xShift] * 0.8 + [acceleration x] * 2.0;
	float yShift = [hv yShift] * 0.8 + [acceleration y] * 2.0;
	[hv setXShift:xShift];
	[hv setYShift:yShift];
	[hv setRed:([acceleration x] + 1) / 2];
	[hv setGreen:([acceleration y] + 1) / 2];
	[hv setBlue:([acceleration z] + 1) / 2];
	
	// Redraw the view
	[hv setNeedsDisplay];
	}

@end
