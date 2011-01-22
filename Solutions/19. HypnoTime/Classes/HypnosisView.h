//
//  HypnosisView.h
//  Hypnosister
//
//  Created by Alex Silverman on 7/28/09.
//  Copyright 2009 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 
@interface HypnosisView : UIView <UIAccelerometerDelegate> { 
    CALayer *boxLayer; 
    UIColor *stripeColor; 
    float xShift, yShift; 
} 

@end
