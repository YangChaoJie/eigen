#import "ARAppActivityContinuationDelegate.h"


@implementation ARAppActivityContinuationDelegate

+ (void)load
{
    [JSDecoupledAppDelegate sharedAppDelegate].activityContinuationDelegate = [[self alloc] init];
}

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType;
{
    return [userActivityType isEqualToString:NSUserActivityTypeBrowsingWeb];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler;
{
    UIViewController *viewController = [ARSwitchBoard.sharedInstance loadURL:userActivity.webpageURL];
    if (viewController) {
        [[ARTopMenuViewController sharedController] pushViewController:viewController];
    }
    return YES;
}

//- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error;
//- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity;

@end