//
//  JudsonThirdViewController.m
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import "JudsonThirdViewController.h"

@interface JudsonThirdViewController ()

@end

@implementation JudsonThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"Judson.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openSafari:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://public.serviceu.com/PaymentForm/9113/?OrgKey=9acc9223-cd1e-451a-bc8c-3aacb31fa190"]];
}
@end
