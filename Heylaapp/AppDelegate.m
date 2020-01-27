//
//  AppDelegate.m
//  Heylaapp
//
//  Created by HappySanz on 23/10/17.
//  Copyright © 2017 Palpro Tech. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <UserNotifications/UserNotifications.h>
#import "LGSideMenuController.h"

@import GoogleMaps;

#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@interface AppDelegate ()

@end

@implementation AppDelegate

//static NSString * const kClientID =  
//@"322143328499-a9cu5r1s70idnt8c40mb641k37kctgsp.apps.googleusercontent.com";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    if( SYSTEM_VERSION_LESS_THAN( @"10.0" ) ) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |  UNAuthorizationOptionProvidesAppNotificationSettings) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
//        if(optind != nil)
//        {
//            NSLog( @"registerForPushWithOptions:" );
//        }
    }
    else {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if( !error ) {
                // required to get the app to do anything at all about push notifications
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] registerForRemoteNotifications];
                });
                NSLog( @"Push registration success." );
            } else {
                NSLog( @"Push registration FAILED" );
                NSLog( @"ERROR: %@ - %@", error.localizedFailureReason, error.localizedDescription );
                NSLog( @"SUGGESTIONS: %@ - %@", error.localizedRecoveryOptions, error.localizedRecoverySuggestion );
            }
        }];
    }
    NSLog( @"### running FB sdk version: %@", [FBSDKSettings sdkVersion] );
    NSLog(@"%@",@"Check 2");
    NSString *splash = [[NSUserDefaults standardUserDefaults]objectForKey:@"showSplash"];
    NSString *status = [[NSUserDefaults standardUserDefaults]objectForKey:@"status"];    if ([splash isEqualToString:@"hide"])
    {
        
        if ([status isEqualToString:@"signIn"])
        {
            [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"userInfostat"];
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
            [navigationController setViewControllers:@[[storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"]]];

            SideMenuMainViewController *sideMenuMainViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SideMenuMainViewController"]; //or
            sideMenuMainViewController.rootViewController = navigationController;
            [sideMenuMainViewController setupWithType:0];
            self.window.rootViewController = sideMenuMainViewController;
            [self.window makeKeyAndVisible];


//          UIWindow *window = UIApplication.sharedApplication.delegate.window;
//          window.rootViewController = sideMenuMainViewController;
//
//          [UIView transitionWithView:window
//                              duration:0
//                               options:UIViewAnimationOptionTransitionCrossDissolve
//                            animations:nil
//                            completion:nil];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults]setObject:@"alertUserIfno" forKey:@"userInfostat"];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self.window makeKeyAndVisible];
            [self.window.rootViewController presentViewController:loginViewController animated:YES completion:NULL];
        }
    }

    [GMSServices provideAPIKey:@"AIzaSyBAgz6YE_YSQoNpjngo9wg6pCim0lMXRVI"];
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [FIRApp configure];
    GAI *gai = [GAI sharedInstance];
    [gai trackerWithTrackingId:@"UA-92904528-2"];
    gai.trackUncaughtExceptions = YES;
    gai.logger.logLevel = kGAILogLevelVerbose;
    
    return YES;
}
//- (void)registerForRemoteNotifications {
//    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//        center.delegate = self;
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
//            if(!error){
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [[UIApplication sharedApplication] registerForRemoteNotifications];
//                });
////                [[UIApplication sharedApplication] registerForRemoteNotifications];
//            }
//        }];
//    }
//    else {
//        // Code for old versions
//    }
//}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     [FBSDKAppEvents activateApp];
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}
//-(void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
//{
//    NSString *tokenString = [deviceToken description];
//
//    tokenString = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//
//    tokenString = [tokenString stringByReplacingOccurrencesOfString:@" " withString:@" "];
//
//    NSLog(@"Push Notification tokenstring is %@",tokenString);
//
//    [[NSUserDefaults standardUserDefaults]setObject:tokenString forKey:@"deviceToken_Key"];
//
//    [[NSUserDefaults standardUserDefaults]synchronize];
//}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    //Format token as per need:
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    NSLog(@"Device Token is \n%@",token);
    [[NSUserDefaults standardUserDefaults]setObject:token forKey:@"deviceToken_Key"];

}
#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Heylaapp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}


//Called to let your app know which action was selected by the user for a given notification.

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Error:%@",error);
}


//-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
//    [self application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:^(UIBackgroundFetchResult result) {
//    }];
//}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void(^)(UIBackgroundFetchResult))completionHandler {
    // iOS 10 will handle notifications through other methods
    
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO( @"10.0" ) )
    {
        NSLog( @"iOS version >= 10. Let NotificationCenter handle this one." );
        // set a member variable to tell the new delegate that this is background
        return;
    }
    NSLog( @"HANDLE PUSH, didReceiveRemoteNotification: %@", userInfo );
    // custom code to handle notification content
    if( [UIApplication sharedApplication].applicationState == UIApplicationStateInactive )
    {
        NSLog( @"INACTIVE" );
        completionHandler( UIBackgroundFetchResultNewData );
    }
    else if( [UIApplication sharedApplication].applicationState == UIApplicationStateBackground )
    {
        NSLog( @"BACKGROUND" );
        completionHandler( UIBackgroundFetchResultNewData );
    }
    else
    {
        NSLog( @"FOREGROUND" );
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);

}

//Called to let your app know which action was selected by the user for a given notification.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler
{
    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
    completionHandler();

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Notification *notification = [storyboard instantiateViewControllerWithIdentifier:@"notificationNav"];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:notification animated:YES completion:NULL];
   
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

//- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame
//{
//    @try
//    {
//        [UIView animateWithDuration:0.35 animations:^{
//            CGRect windowFrame = ((UINavigationController *)((UITabBarController *)self.window.rootViewController).viewControllers[0]).view.frame;
//            if (newStatusBarFrame.size.height > 20)
//            {
//                [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"Hotspot_nav"];
//                windowFrame.origin.y = newStatusBarFrame.size.height - 20 ;
//            }
//            else
//            {
//                [[NSUserDefaults standardUserDefaults]setObject:@"NO" forKey:@"Hotspot_nav"];
//                windowFrame.origin.y = 0.0;
//                
//            }
//            ((UINavigationController *)((UITabBarController *)self.window.rootViewController).viewControllers[0]).view.frame = windowFrame;
//        }];
//    }
//    @catch (NSException *exception)
//    {
//       
//    }
//}
@end
