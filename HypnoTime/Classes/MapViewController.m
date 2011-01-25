    //
//  MapViewController.m
//  HypnoTime
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)init
	{
	self = [super initWithNibName:nil bundle:nil];
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:@"Map"];
	return self;
	}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
	{
	return [self init];
	}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView 
	{
	_mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
	[self setView:_mapView];
	}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)viewWillAppear:(BOOL)animated
	{
	[super viewWillAppear:animated];
	[_mapView setShowsUserLocation:YES];
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
	[_mapView release];
    [super dealloc];
}


@end
