//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;

@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate, UIScrollViewDelegate> {
    UIWindow *window;
	HypnosisView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

