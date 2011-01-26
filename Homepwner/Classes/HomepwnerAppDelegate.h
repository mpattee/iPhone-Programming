//
//  HomepwnerAppDelegate.h
//  Homepwner
//
//  Created by Mike Pattee on 1/25/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemsViewController;

@interface HomepwnerAppDelegate : NSObject <UIApplicationDelegate> 
	{
    UIWindow *window;
	ItemsViewController *itemsViewController;
	}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

