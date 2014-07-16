//
//  JudsonThirdViewController.h
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import <UIKit/UIKit.h>

@interface JudsonThirdViewController : UIViewController<UIWebViewDelegate, UIGestureRecognizerDelegate>
{
    __weak IBOutlet UIWebView *myWebView;
    NSURL *websiteUrl;
    NSURLRequest *urlRequest;
    __weak IBOutlet UIActivityIndicatorView *myActivityIndicator;
    __weak IBOutlet UIBarButtonItem *refresh;
}
- (IBAction)refreshPage:(id)sender;

@end
