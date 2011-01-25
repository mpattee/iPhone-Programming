//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CurrentTimeViewController : UIViewController 
	{
	IBOutlet UILabel *timeLabel;
	}
	
- (IBAction)showCurrentTime:(id)sender;

@end
