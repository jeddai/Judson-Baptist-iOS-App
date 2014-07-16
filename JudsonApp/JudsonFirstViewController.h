//
//  JudsonFirstViewController.h
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import <UIKit/UIKit.h>

@interface JudsonFirstViewController : UIViewController<UIWebViewDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate>
{
    __weak IBOutlet UIWebView *myWebView;
    NSURL *websiteUrl;
    NSURLRequest *urlRequest;
    __weak IBOutlet UIBarButtonItem *moreButton;
    __weak IBOutlet UIBarButtonItem *refreshButton;
    __weak IBOutlet UIActivityIndicatorView *myActivityIndicator;
}
- (IBAction)action:(id)sender;
- (IBAction)refresh:(id)sender;

@end
