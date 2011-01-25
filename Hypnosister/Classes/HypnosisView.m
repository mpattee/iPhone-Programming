//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Mike Pattee on 1/24/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect 
	{
    // Drawing code.
	// What rectangle am I filling
	CGRect bounds = [self bounds];
	// Where is its center
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;
	
	// From the center how far out to the corner?
	float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
	
	// Get the context being drawn upon
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// All lines will be drawn 10 points wide
	CGContextSetLineWidth(context, 10.0);
	
	// Set the stroke color to light gray
//	[[UIColor lightGrayColor] setStroke];
	
	// Draw concentric circles from the outside in
	for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
		{
		CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
		
		[[UIColor colorWithRed:.5 green:.5 blue:currentRadius/maxRadius alpha:1.0] setStroke];
		CGContextStrokePath(context);
		}
	
	// Create a string
	NSString *text = @"You are getting sleepy.";
	// Get a font to draw it in
	UIFont *font = [UIFont boldSystemFontOfSize:28];
	
	// Where am I going to draw it?
	CGRect textRect;
	textRect.size = [text sizeWithFont:font];
	textRect.origin.x = center.x - textRect.size.width / 2.0;
	textRect.origin.y = center.y - textRect.size.height / 2.0;
	
	// Set the fill color
	[[UIColor blackColor] setFill];
	
	// Set the shadow
	CGSize offset = CGSizeMake(4, 3);
	CGColorRef color = [[UIColor darkGrayColor] CGColor];
	CGContextSetShadowWithColor(context, offset, 2.0, color);
	
	// Draw the string
	[text drawInRect:textRect withFont:font];
	}


- (void)dealloc {
    [super dealloc];
}


@end
