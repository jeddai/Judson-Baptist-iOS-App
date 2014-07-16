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
    myWebView.delegate = self;
    [myActivityIndicator startAnimating ];
    websiteUrl = [NSURL URLWithString:@"https://public.serviceu.com/PaymentForm/9113/?OrgKey=9acc9223-cd1e-451a-bc8c-3aacb31fa190"];
    urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    UIImage *image = [UIImage imageNamed:@"Judson.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.delegate =  self;
    [myWebView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeft.delegate =  self;
    [myWebView addGestureRecognizer:swipeLeft];
}

- (void)viewWillAppear:(BOOL)animated
{
    [myWebView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)myWebView
{
    myActivityIndicator.hidden = YES;
    [myActivityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [myWebView loadRequest:urlRequest];
}

- (IBAction)refreshPage:(id)sender
{
    [myWebView loadRequest:urlRequest];
}

- (void)swipeRightAction:(id)selector
{
    if ([myWebView canGoBack])
    {
        [myWebView goBack];
    }
}

- (void)swipeLeftAction:(id)selector
{
    if ([myWebView canGoForward])
    {
        [myWebView goForward];
    }
}

@end
