//
//  WhereamiAppDelegate.m
//  Whereami
//
//  Created by Mike Pattee on 1/21/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "WhereamiAppDelegate.h"
#import "MapPoint.h"

@implementation WhereamiAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
	// Create lcoation manager object
	locationManager = [[CLLocationManager alloc] init];
	
	// Make this instance of WhereamiAppDelegate the delegate it will send its messages to our WhereamiAppDelegate
	[locationManager setDelegate:self];
	
	// We want all results from the location manager
	[locationManager setDistanceFilter:kCLDistanceFilterNone];
	
	// And we want it to be as accurate as possible
	// regardless of how much time/power it takes
	
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	
	// Tell our manager to start looking for its location immediately
//	[locationManager startUpdatingHeading];
//	[locationManager startUpdatingLocation];
//	[mapView setShowsUserLocation:YES];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)findLocation
	{
	NSLog(@"findLocation");
	[locationManager startUpdatingLocation];
	[activityIndicator startAnimating];
	[locationTitleField setHidden:YES];
	}
	
- (void)foundLocation
	{
	NSLog(@"foundLocation");
	[locationTitleField setText:@""];
	[activityIndicator stopAnimating];
	[locationTitleField setHidden:NO];
	[locationManager stopUpdatingLocation];
	}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
	{
	NSLog(@"%@", newLocation);
	NSTimeInterval time = [[newLocation timestamp] timeIntervalSinceNow];
	// CLLocationManagers will return the last found location of the device first, you don't want that data in this case. If this location was made more than 3 minutes ago, ignore it.
	if (time < -180)
		{
		// this is cached data, you don't want it, keep looking
		return;
		}
	MapPoint *mp = [[MapPoint alloc] initWithCoordinate:[newLocation coordinate] title:[locationTitleField text]];
	[_mapView addAnnotation:mp];
	[mp release];
	
	[self foundLocation];
	}
	
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
	{
	NSLog(@"Could not find location: %@", error);
	}
	
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
	{
	NSLog(@"Heading: %@", newHeading);
	}
	
- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
	{
	NSLog(@"Could not find location: %@", error);
	}
	
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
	{
	NSLog(@"User Location: %@", userLocation);
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250);
	[mapView setRegion:region animated:YES];
	}
	


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
	{
	NSLog(@"did add annotation");
	MKAnnotationView *annotationView = [[views objectAtIndex:0] annotation];
	id <MKAnnotation> mp = [annotationView annotation];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 250, 250);
	[mapView setRegion:region animated:YES];
	}

- (void)dealloc {
	[locationManager setDelegate:nil];
	[locationManager release];
    [window release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)inTextField
	{
	[self findLocation];
	[inTextField resignFirstResponder];
	return YES;
	}


@end
