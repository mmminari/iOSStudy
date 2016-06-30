#import "StoreLocationViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ShowMenuViewController.h"

@interface StoreLocationViewController ()

@property (strong, nonatomic) ShowMenuViewController *menuVC;

@end

@implementation StoreLocationViewController
{
    GMSMapView *mapView;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[self.storeInfo latitude]
                                                            longitude:[self.storeInfo longitude]
                                                                 zoom:17.0];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake([self.storeInfo latitude], [self.storeInfo longitude]);
    marker.map = mapView;
    
    self.menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.menuVC.view];
    [self.util setContentViewLayoutWithSubView2:self.menuVC.view withTargetView:self.view];
    self.menuVC.lbTitle.text = @"";
    self.menuVC.baseVC = self;
    
}


@end
