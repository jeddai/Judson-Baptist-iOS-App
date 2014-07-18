//
//  JudsonFourthViewController.m
//  Judson Baptist
//
//  Created by Charles Humphreys on 7/16/14.
//
//

#import "JudsonFourthViewController.h"

@interface JudsonFourthViewController ()

@end

@implementation JudsonFourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myWebView.delegate = self;
    [myActivityIndicator startAnimating ];
    websiteUrl = [NSURL URLWithString:@"http://judsonbaptist.com/media.php?pageID=17"];
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
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if(data)
    {
        
    }
    else
    {
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(home) userInfo:nil repeats:NO];
    }
}

- (void)home
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
