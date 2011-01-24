//
//  MapPoint.m
//  Whereami
//
//  Created by Mike Pattee on 1/21/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "MapPoint.h"


@implementation MapPoint

@synthesize title;
@synthesize coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)inCoordinate title:(NSString *)inTitle
	{
	[super init];
	coordinate = inCoordinate;
	[self setTitle:inTitle];
	return self;
	}
	
- (void)dealloc
	{
	[title release];
	[super dealloc];
	}
	

@end
