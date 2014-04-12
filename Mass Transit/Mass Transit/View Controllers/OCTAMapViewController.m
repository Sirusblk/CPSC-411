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

@synthesize locationManager;
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
    
    //locationManager = [[CLLocationManager alloc] init];
    //[locationManager startUpdatingLocation];
    
    MKCoordinateRegion mapRegion;
    mapRegion.center.latitude = OCTAmap.userLocation.coordinate.latitude;
    mapRegion.center.longitude = OCTAmap.userLocation.coordinate.longitude;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    [OCTAmap setRegion:mapRegion animated: YES];
    
    NSLog(@"OCTA Map View Loaded");
    NSLog(@"User Latitude: %f", OCTAmap.userLocation.coordinate.latitude);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = OCTAmap.userLocation.coordinate.latitude;
    zoomLocation.longitude= OCTAmap.userLocation.coordinate.longitude;
    
    NSLog(@"User Latitude: %f", OCTAmap.userLocation.coordinate.latitude);
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [OCTAmap setRegion:viewRegion animated:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"User Latitude: %f", OCTAmap.userLocation.coordinate.latitude);
    
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
