//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by Mike Pattee on 1/21/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate, MKReverseGeocoderDelegate> {
    UIWindow *window;
	
	CLLocationManager *locationManager;
	
	IBOutlet MKMapView *_mapView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	IBOutlet UITextField *locationTitleField;
	IBOutlet UISegmentedControl *mapTypeSegmentedControl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)findLocation;
- (void)foundLocation;

- (IBAction)mapTypeChanged;

@end

