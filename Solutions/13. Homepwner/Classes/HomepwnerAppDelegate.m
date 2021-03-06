//
//  HomepwnerAppDelegate.m
//  Homepwner
//
//  Created by bhardy on 7/30/09.
//  Copyright Big Nerd Ranch 2009. All rights reserved.
//

#import "HomepwnerAppDelegate.h"
#import "ItemsViewController.h"

@implementation HomepwnerAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application 
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Create an instance of ItemsViewController with a Grouped table view
	itemsViewController = [[ItemsViewController alloc] init]; 
	
	// Create an instance of a UINavigationController
	// its stack contains only itemsViewController
    UINavigationController *navController = [[UINavigationController alloc] 
            initWithRootViewController:itemsViewController];

    // Place navigation controller's view into window hierarchy
	if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
	{
		[window setRootViewController:navController];
		[navController release];
	}
	else
	{
		[window addSubview:[navController view]];
	}
	[window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
