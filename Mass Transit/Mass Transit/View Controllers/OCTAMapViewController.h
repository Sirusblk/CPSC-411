//
//  OCTAMapViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "StopLocation.h"
#import "GTF_SQLiteDB.h"

@interface OCTAMapViewController : UIViewController <CLLocationManagerDelegate>

@property CLLocationManager *locationManager;
@property GTF_SQLiteDB* OCTA_database;
@property NSArray* OCTA_stops;

@property (weak, nonatomic) IBOutlet MKMapView *OCTAmap;

@end
