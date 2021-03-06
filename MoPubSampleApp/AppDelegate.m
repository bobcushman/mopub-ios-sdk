//
//  AppDelegate.m
//  MoPub
//
//  Copyright (c) 2013 MoPub. All rights reserved.
//

#import "AppDelegate.h"
#import "MPAdTableViewController.h"
#import "MPAdSection.h"
#import "MPIdentityProvider.h"
#import "MPAdConversionTracker.h"

#if RUN_KIF_TESTS
#import "MPKIFTestController.h"
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"This device's advertisingIdentifier: %@", [MPIdentityProvider identifier]);

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[MPAdTableViewController alloc] initWithAdSections:[MPAdSection adSections]]];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    [[MPAdConversionTracker sharedConversionTracker] reportApplicationOpenForApplicationID:@"112358"];

    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1]];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    navController.navigationBar.tintColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1];
    navController.navigationBar.tintColor = [UIColor colorWithRed:0.21 green:0.21 blue:0.21 alpha:1];
    navController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1]};

#if RUN_KIF_TESTS
    [[MPKIFTestController sharedInstance] startTestingWithCompletionBlock:^{
        // Exit after the tests complete so that CI knows we're done
        exit([[MPKIFTestController sharedInstance] failureCount]);
    }];
#endif

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

@end
