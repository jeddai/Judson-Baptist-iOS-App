//
//  JudsonFourthViewController.h
//  Judson Baptist
//
//  Created by Charles Humphreys on 7/16/14.
//
//

#import <UIKit/UIKit.h>

@interface JudsonFourthViewController : UIViewController<UIWebViewDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate>
{
    __weak IBOutlet UIWebView *myWebView;
    NSURL *websiteUrl;
    NSURLRequest *urlRequest;
    __weak IBOutlet UIActivityIndicatorView *myActivityIndicator;
    __weak IBOutlet UIBarButtonItem *refreshButton;
    __weak IBOutlet UIBarButtonItem *moreButton;
}
- (IBAction)refreshPage:(id)sender;
- (IBAction)action:(id)sender;

@end
