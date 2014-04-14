//
//  MetrolinkMapViewController.m
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "MetrolinkMapViewController.h"

#define METERS_PER_MILE 1609.344

@interface MetrolinkMapViewController ()

@end

@implementation MetrolinkMapViewController

@synthesize MetrolinkMap;

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
    
    MKCoordinateRegion mapRegion;
    mapRegion.center.latitude = MetrolinkMap.userLocation.coordinate.latitude;
    mapRegion.center.longitude = MetrolinkMap.userLocation.coordinate.longitude;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    [MetrolinkMap setRegion:mapRegion animated: YES];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(MetrolinkMap.userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [MetrolinkMap setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View Will Appear");
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(MetrolinkMap.userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [MetrolinkMap setRegion:viewRegion animated:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(MetrolinkMap.userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [MetrolinkMap setRegion:viewRegion animated:YES];
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
