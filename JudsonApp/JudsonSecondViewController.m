//
//  JudsonSecondViewController.m
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import "JudsonSecondViewController.h"
#import "Annotation.h"

@interface JudsonSecondViewController ()

@end

@implementation JudsonSecondViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.orientation = (UIInterfaceOrientation) [UIDevice currentDevice].orientation;
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeStandard;
    
    CLLocationCoordinate2D coord = {.latitude =  36.080, .longitude =  -86.771894};
    MKCoordinateSpan span = {.latitudeDelta =  0.16, .longitudeDelta =  0.16};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    [mapView setShowsUserLocation:YES];
    [mapView setDelegate:self];
    [self.view addSubview:mapView];
    
    UIImage *image = [UIImage imageNamed:@"Judson.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    CLLocationCoordinate2D location;
    Annotation *ann;
    
    //  Judson
    ann = [[Annotation alloc] init];
    location.latitude = 36.077325;
    location.longitude = -86.771894;
    ann.coordinate = location;
    ann.title = @"Judson Baptist Church";
    ann.subtitle = @"4900 Franklin Road, Nashville, TN 37220";
    
    [mapView addAnnotation:ann];
}

- (void)updateLayoutForNewOrientation:(UIInterfaceOrientation)orientation
{
    [self viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    if(self.orientation != (UIInterfaceOrientation) [UIDevice currentDevice].orientation)
    {
        [super viewWillAppear:animated];
        [self updateLayoutForNewOrientation:self.interfaceOrientation];
        self.orientation = (UIInterfaceOrientation) [UIDevice currentDevice].orientation;
    }
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    [self updateLayoutForNewOrientation:self.interfaceOrientation];
}

- (MKAnnotationView *)mapView:(MKMapView *)annotMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == annotMapView.userLocation)
    {
        return nil;
    }
    else
    {
        MKPinAnnotationView *myPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
        
        UIButton *mapsButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [mapsButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        [mapsButton setTintColor:[UIColor colorWithRed:(46/255.0) green:(77/255.0) blue:(134/255.0) alpha:1.0]];
        
        myPin.rightCalloutAccessoryView = mapsButton;
        
        myPin.draggable = NO;
        myPin.highlighted = YES;
        myPin.animatesDrop = YES;
        myPin.canShowCallout = YES;
        
        UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"first.png"]];
        myPin.leftCalloutAccessoryView = myCustomImage;
        
        return myPin;
    }
}

-(void)button:(id)sender
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select option:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Get Directions",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [self AppleMaps];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

/*
- (void)GoogleMaps
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"maps.google.com://?saddr=%f,%f&daddr=36.077325,-86.771894"]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"maps.google.com://?saddr=%f,%f&daddr=36.077325,-86.771894"]];
    }
    else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Google Maps not found." message:@"Use Apple Maps, sorry." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
    }
}
*/

- (void)AppleMaps
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.apple.com/?qsaddr=Current+Location&daddr=36.077325,-86.771894"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
