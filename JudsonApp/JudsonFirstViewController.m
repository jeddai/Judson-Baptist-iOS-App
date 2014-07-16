//
//  JudsonFirstViewController.m
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import "JudsonFirstViewController.h"
#import "JudsonAppDelegate.h"

@interface JudsonFirstViewController ()

@end

@implementation JudsonFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myWebView.delegate = self;
    [myActivityIndicator startAnimating ];
    websiteUrl = [NSURL URLWithString:@"http://www.judsonbaptist.com/"];
    urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    UIImage *image = [UIImage imageNamed:@"Judson.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    [myWebView loadRequest:urlRequest];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.delegate =  self;
    [myWebView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeft.delegate =  self;
    [myWebView addGestureRecognizer:swipeLeft];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [myWebView loadRequest:urlRequest];
                    break;
                case 1:
                    [myWebView goBack];
                    break;
                case 2:
                    [myWebView goForward];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action:(id)sender
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select option:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Go home",
                            @"Go back",
                            @"Go forward",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (IBAction)refresh:(id)sender
{
    [myWebView reload];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [myWebView loadRequest:urlRequest];
}

- (void)webViewDidFinishLoad:(UIWebView *)myWebView {
    myActivityIndicator.hidden = YES;
    [myActivityIndicator stopAnimating];
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
