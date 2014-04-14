//
//  OCTAMapViewController.m
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "OCTAMapViewController.h"

#define METERS_PER_MILE 1609.344

@interface OCTAMapViewController ()

@end

@implementation OCTAMapViewController

@synthesize OCTA_stops;
@synthesize OCTA_database;
//@synthesize locationManager;
@synthesize OCTAmap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"\nView Did Load");
    
    //locationManager = [[CLLocationManager alloc] init];
    //[locationManager startUpdatingLocation];
    
    MKCoordinateRegion mapRegion;
    mapRegion.center.latitude = OCTAmap.userLocation.coordinate.latitude;
    mapRegion.center.longitude = OCTAmap.userLocation.coordinate.longitude;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    [OCTAmap setRegion:mapRegion animated: YES];
    
    NSLog(@"OCTA Map View Loaded");
    NSLog(@"User Latitude: %f %f", OCTAmap.userLocation.coordinate.latitude, OCTAmap.userLocation.coordinate.longitude);
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(OCTAmap.userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [OCTAmap setRegion:viewRegion animated:YES];
    
    //Setup annotations
    OCTA_stops = [OCTA_database allStops];
    
    NSLog(@"OCTA Stop: %@", OCTA_stops[0]);
    
    StopLocation *annotation = OCTA_stops[0];
    [self.OCTAmap addAnnotation:annotation];
    
    for(StopLocation *annotation in OCTA_stops) {
        NSLog(@"Annotation: %@", annotation);
        [self.OCTAmap addAnnotation:annotation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"View Will Appear");
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(OCTAmap.userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [OCTAmap setRegion:viewRegion animated:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(OCTAmap.userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [OCTAmap setRegion:viewRegion animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
