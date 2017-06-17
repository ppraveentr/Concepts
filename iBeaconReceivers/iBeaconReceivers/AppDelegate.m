//
//  AppDelegate.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import "AppDelegate.h"
#import "FTBeaconManager.h"
#import "FTTheam.h"

@interface AppDelegate ()<CLLocationManagerDelegate>
@end

@implementation AppDelegate
@synthesize isSignedIn;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [FTTheam applyFTCTouchHandsetTheme];
    
    self.isSignedIn = NO;
    
//    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
//#ifdef __IPHONE_8_0
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge
//                                                                                             |UIRemoteNotificationTypeSound
//                                                                                             |UIRemoteNotificationTypeAlert) categories:nil];
//        [application registerUserNotificationSettings:settings];
//#endif
//    } else {
//        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
//        [application registerForRemoteNotificationTypes:myTypes];
//    }
    
    UILocalNotification *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (notification)
    {
        [self application:[UIApplication sharedApplication] didReceiveLocalNotification:notification];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Local Notification

- (void)application:(UIApplication *)application didReceiveLocalNotification: (UILocalNotification *)notification
{
    if (notification)
    {
        if ([[notification userInfo] valueForKey:BeaconUserInfo]) {
            
            if (isSignedIn) {
                NSDictionary *userInfo = [[notification userInfo] valueForKey:BeaconUserInfo];
                NSLog(@"userInfo %@",userInfo);
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Signed In"
                                                                    message:notification.alertBody
                                                                   delegate:self cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                [alertView show];
            }
            else {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                    message:notification.alertBody
                                                                   delegate:self cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                [alertView show];
            }
        }
    }
}

#pragma mark - Location manager delegate methods
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if ([[FTBeaconManager sharedInstance] respondsToSelector:@selector(locationManager: didChangeAuthorizationStatus:)]) {
        [[FTBeaconManager sharedInstance] locationManager:manager didChangeAuthorizationStatus:status];
    }
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region {
    
    if ([[FTBeaconManager sharedInstance] respondsToSelector:@selector(locationManager: didRangeBeacons: inRegion:)]) {
        [[FTBeaconManager sharedInstance] locationManager:manager didRangeBeacons:beacons inRegion:region];
    }
}

#pragma mark - Local notifications
- (void)sendLocalNotificationForBeaconRegion:(CLBeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    
    // Notification details
    notification.alertBody = [NSString stringWithFormat:WellcomeMessage];   // Major and minor are not available at the monitoring stage
    notification.alertAction = WellcomeTitle;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:[FTBeaconManager dictionaryFromReigon:region] forKey:BeaconUserInfo];
    [notification setUserInfo:userInfo];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
//    [self sendLocalNotificationForBeaconRegion:region];
    
    if ([[FTBeaconManager sharedInstance] respondsToSelector:@selector(locationManager: didEnterRegion:)]) {
        [[FTBeaconManager sharedInstance] locationManager:manager didEnterRegion:region];
    }
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
//    [self sendLocalNotificationForBeaconRegion:region];

    if ([[FTBeaconManager sharedInstance] respondsToSelector:@selector(locationManager: didExitRegion:)]) {
        [[FTBeaconManager sharedInstance] locationManager:manager didExitRegion:region];
        }
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    NSString *stateString = nil;
    switch (state) {
        case CLRegionStateInside:
            stateString = @"inside";
            break;
        case CLRegionStateOutside:
            stateString = @"outside";
            break;
        case CLRegionStateUnknown:
            stateString = @"unknown";
            break;
    }
    
    if ([[FTBeaconManager sharedInstance] respondsToSelector:@selector(locationManager: didDetermineState: forRegion:)]) {
        [[FTBeaconManager sharedInstance] locationManager:manager didDetermineState:state forRegion:region];
    }
}

@end
