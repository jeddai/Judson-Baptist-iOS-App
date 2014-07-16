//
//  JudsonSecondViewController.h
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JudsonSecondViewController : UIViewController<UIActionSheetDelegate, MKMapViewDelegate>
{
    MKMapView *mapView;
}

@property(nonatomic, retain) MKMapView *mapView;

@end
