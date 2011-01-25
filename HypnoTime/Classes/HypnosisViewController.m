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


@end
