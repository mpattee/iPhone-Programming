//
//  HomepwnerAppDelegate.m
//  Homepwner
//
//  Created by Mike Pattee on 1/25/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "HomepwnerAppDelegate.h"
#import "ItemsViewController.h"

@implementation HomepwnerAppDelegate

@synthesize window;

- (NSString *)possessionArrayPath
	{
	return pathInDocumentDirectory(@"Posessions.data");
	}
	
- (void)archivePossessions
	{
	// Get full path of possession archive
	NSString *possessionPath = [self possessionArrayPath];
	
	// Get the possession list
	NSMutableArray *possessionArray = [itemsViewController possessions];
	
	// Archive possessions list to file
	[NSKeyedArchiver archiveRootObject:possessionArray toFile:possessionPath];
	}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
	{
	// Get the full path of our possession archive file
	NSString *possessionPath = [self possessionArrayPath];
	
	// Unarchive it into an array
	NSMutableArray *possesionsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:possessionPath];
	
	// if the file did not exist our possesion arrawy will not either
	
	// create on in its absence
	if (!possesionsArray) 
		{
		possesionsArray = [NSMutableArray array];
		}
    // Create a ItemsViewController
	itemsViewController = [[ItemsViewController alloc] init];
	
	[itemsViewController setPossessions:possesionsArray];
	
	// Create an instance of UInavigationController
	// its stack contains only items viewcontroller
	
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:itemsViewController];
	
	// Place ItemsViewController's table view in the window hierarchy
	[window setRootViewController:navController];
	[navController release];
	
	// we won't release itemsViewController here, as we have an instance variable that points to it as well, and therefore, truly has two owners
	
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
	 
	 [self archivePossessions];
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
	 [self archivePossessions];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
