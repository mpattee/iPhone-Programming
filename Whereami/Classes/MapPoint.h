//
//  MapPoint.h
//  Whereami
//
//  Created by Mike Pattee on 1/21/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation> 
	{
//	NSString *title;
//	CLLocationCoordinate2D coordinate;
	}
	
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)inCoordinate title:(NSString *)inTitle;

@end
