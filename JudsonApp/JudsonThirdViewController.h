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
    __weak IBOutlet UIButton *giving;
}
- (IBAction)openSafari:(id)sender;


@end
