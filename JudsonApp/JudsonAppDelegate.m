//
//  JudsonAppDelegate.m
//  JudsonApp
//
//  Created by Charles Humphreys on 7/14/14.
//
//

#import "JudsonAppDelegate.h"

@implementation JudsonAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    sleep(1);
    
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        //connection working
    }
    else
    {
        [self alert];
    }
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:(46/255.0) green:(77/255.0) blue:(134/255.0) alpha:1.0]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:(238/255.0) green:(238/255.0) blue:(219/255.0) alpha:1.0]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(238/255.0) green:(238/255.0) blue:(219/255.0) alpha:1.0]];
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:16.0f]}];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)alert
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Internet connection needed to access data" message:@"" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

@end
