//
//  HypnosisView.h
//  Hypnosister
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HypnosisView : UIView 
	{
	float xShift;
	float yShift;
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	UIColor *stripeColor;
	}

@property (readwrite, nonatomic, assign) float xShift;
@property (readwrite, nonatomic, assign) float yShift;
@property (readwrite, nonatomic, assign) CGFloat red;
@property (readwrite, nonatomic, assign) CGFloat green;
@property (readwrite, nonatomic, assign) CGFloat blue;
@end
