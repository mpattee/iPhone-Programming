//
//  NayberzAppDelegate.h
//  Nayberz
//
//  Created by Joe Conway on 7/27/09.
//  Copyright Big Nerd Ranch 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableController; 
@interface NayberzAppDelegate : NSObject <UIApplicationDelegate, NSNetServiceDelegate> { 
    UIWindow *window; 
    NSNetService *netService; 
} 
@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)setMessage:(NSString *)str forNetService:(NSNetService *)service;

@end
