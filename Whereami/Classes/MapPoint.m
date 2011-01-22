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
	if (!(self = [super init]))
		{
		[self setCoordinate:inCoordinate];
		[self setTitle:inTitle];
		}
	return self;
	}

@end
