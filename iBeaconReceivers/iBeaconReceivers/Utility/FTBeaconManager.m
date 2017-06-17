//
//  FTBeaconManager.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import "FTBeaconManager.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

    //Current Operation Context
typedef NS_ENUM(NSUInteger, OperationContext) {
    kRangingOperationContext = 1,
    kMonitoringOperationContext,
    kDefautOperationContext = 0
};

#pragma mark - Notification Constant
NSString *const BeaconUserInfo = @"com.iBeacaon.BeaconUserInfo";

static NSString * const BeaconFoundNotification = @"com.iBeacaon.found";
static NSString * const BeaconMonitoringNotification = @"com.iBeacaon.monitoring";

#pragma mark - UUID
static NSString * const kUUID = @"11111111-2222-3333-4444-555555555555";
static NSString * const kIdentifier = @"My iPhone iBeacon";

#pragma mark - Error
static NSString * const kRaningNotAvaialbe = @"Couldn't turn on ranging: Ranging is not available.";
static NSString * const kBeaconRegionMonitoringNotAvaialbe = @"Couldn't turn on region monitoring: Region monitoring is not available for CLBeaconRegion class.";
static NSString * const kLocationMonitoringServicesDisabled = @"Couldn't turn on monitoring: Location services are not enabled.";
static NSString * const kLocationRangingServicesDisabled = @"Couldn't turn on ranging: Location services are not enabled.";

static NSString * const kLocationMonitoringAccessMissing_Always = @"Couldn't turn on monitoring: Required Location Access(Always) missing.";
static NSString * const kLocationMonitoringAccessMissing_WhenInUse = @"Couldn't turn on monitoring: Required Location Access(WhenInUse) missing.";
static NSString * const kLocationAccessRequied_Always = @"Required Location Access(Always) missing. Click Settings to update Location Access.";

#pragma mark -
@interface FTBeaconManager ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;

@property (nonatomic, strong) NSArray *detectedBeacons;

@property (nonatomic) OperationContext operationContext;

@property (nonatomic) BOOL rangingSwitch, monitoringSwitch;

+ (void)startBeaconManager;

- (void)startMonitoringForBeacons;
- (void)startRangingForBeacons;

@end

@implementation FTBeaconManager

+(instancetype)sharedInstance {
    
    static FTBeaconManager * manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[FTBeaconManager alloc] init];
            [manager setRangingSwitch:NO];
            [manager setMonitoringSwitch:NO];
            [manager setOperationContext:kDefautOperationContext];
        }
    });
    
    return manager;
}

#pragma mark - Beacon Monitoring
+(void)startBeaconManager {
    
    [[[self class] sharedInstance] startMonitoringForBeacons];
    [[[self class] sharedInstance] startRangingForBeacons];
}

+(instancetype)startBeaconManagerWithDelegate:(id<FTBeaconManagerProtocal>)delegate {
    
    if (delegate) {
            //Beacons
        if ([delegate respondsToSelector:@selector(nearByBeaconFound:)]) {
            [[NSNotificationCenter defaultCenter] addObserver:delegate selector:@selector(nearByBeaconFound:) name:BeaconFoundNotification object:nil];
        }
            //Monitoring Not Possible
        if ([delegate respondsToSelector:@selector(iBeaconMonitoringFailed:)]) {
             [[NSNotificationCenter defaultCenter] addObserver:delegate selector:@selector(iBeaconMonitoringFailed:) name:BeaconMonitoringNotification object:nil];
        }
    }

    [[self class] startBeaconManager];
    
    return [[self class] sharedInstance];
}

#pragma mark Stop Beacon Monitoring

+(void)stopBeaconManagerForDelegate:(id<FTBeaconManagerProtocal>)delegate {

    if (delegate) {
            //Beacons
        if ([delegate respondsToSelector:@selector(nearByBeaconFound:)]) {
            [[NSNotificationCenter defaultCenter] removeObserver:delegate name:BeaconFoundNotification object:nil];
        }
            //Monitoring Not Possible
        if ([delegate respondsToSelector:@selector(iBeaconMonitoringFailed:)]) {
            [[NSNotificationCenter defaultCenter] removeObserver:delegate name:BeaconMonitoringNotification object:nil];
        }
    }
    
    [[[self class] sharedInstance] stopRangingForBeacons];
    [[[self class] sharedInstance] stopMonitoringForBeacons];
}

+(BOOL)isBeaconMonitoring {
    
    if ([[[self class] sharedInstance] locationManager]) {
        return [[[self class] sharedInstance] rangingSwitch] && [[[self class] sharedInstance] monitoringSwitch];
    };
    return NO;
}

#pragma mark - Beacon ranging

- (void)createBeaconRegion {
    
    if (self.beaconRegion)
        return;
    
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:kUUID];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:kIdentifier];
    self.beaconRegion.notifyEntryStateOnDisplay = YES;
}

- (void)startRangingForBeacons {
    
    self.operationContext = kRangingOperationContext;

    [self createLocationManager];
    
    [self checkLocationAccessForRanging];
    
    self.detectedBeacons = [NSArray array];
    [self turnOnRanging];
}

- (void)turnOnRanging {
    
    NSLog(@"Turning on ranging...");
    
    if (![CLLocationManager isRangingAvailable]) {
        NSLog(kRaningNotAvaialbe);
        self.rangingSwitch = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kRaningNotAvaialbe];
        return;
    }
    
    if (self.locationManager.rangedRegions.count > 0) {
        NSLog(@"Didn't turn on ranging: Ranging already on.");
        return;
    }
    
    [self createBeaconRegion];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
    NSLog(@"Ranging turned on for region: %@.", self.beaconRegion);
}

- (void)stopRangingForBeacons {
    
    if (self.locationManager.rangedRegions.count == 0) {
        NSLog(@"Didn't turn off ranging: Ranging already off.");
        return;
    }
    
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    
    self.detectedBeacons = [NSArray array];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:BeaconFoundNotification object:self.detectedBeacons];

    NSLog(@"Turned off ranging.");
}

#pragma mark - Beacon region monitoring

- (void)createLocationManager {
    
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = (id<CLLocationManagerDelegate>)[[UIApplication sharedApplication] delegate];
    }
}

- (void)startMonitoringForBeacons {
    
    self.operationContext = kMonitoringOperationContext;

    [self createLocationManager];
    
    [self checkLocationAccessForMonitoring];
    
    [self turnOnMonitoring];
}

- (void)turnOnMonitoring {
    
    NSLog(@"Turning on monitoring...");
    
    if (![CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
        NSLog(kBeaconRegionMonitoringNotAvaialbe);
        self.monitoringSwitch = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kBeaconRegionMonitoringNotAvaialbe];
        return;
    }
    
    [self createBeaconRegion];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    
    NSLog(@"Monitoring turned on for region: %@.", self.beaconRegion);
}

- (void)stopMonitoringForBeacons {
    
    [self.locationManager stopMonitoringForRegion:self.beaconRegion];
    self.locationManager = nil;
    
    NSLog(@"Turned off monitoring");
}

#pragma mark - Index path management

- (NSArray *)filteredBeacons:(NSArray *)beacons {
    
    NSMutableArray *mutableBeacons = [NSMutableArray arrayWithArray:beacons];

        //TODO: Yet to work on "proximity" options.
//    [beacons enumerateObjectsUsingBlock:^(CLBeacon *beacon, NSUInteger idx, BOOL *stop) {
//        if (beacon.proximity == CLProximityImmediate) {
//            [mutableBeacons addObject:beacon];
//        }
//    }];
    
    // Filters duplicate beacons out; this may happen temporarily if the originating device changes its Bluetooth id
    NSMutableSet *lookup = [[NSMutableSet alloc] init];
    
    [mutableBeacons enumerateObjectsUsingBlock:^(CLBeacon *curr, NSUInteger idx, BOOL *stop) {
        NSString *identifier = [NSString stringWithFormat:@"%@/%@", curr.major, curr.minor];
        // this is very fast constant time lookup in a hash table
        if ([lookup containsObject:identifier]) {
            [mutableBeacons removeObjectAtIndex:idx];
        } else {
            [lookup addObject:identifier];
        }
    }];
    
    return [mutableBeacons copy];
}

#pragma mark - Location manager delegate methods
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    if (![CLLocationManager locationServicesEnabled]) {
        if (self.operationContext == kMonitoringOperationContext) {
            NSLog(kLocationMonitoringServicesDisabled);
            self.monitoringSwitch = NO;
            [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kLocationMonitoringServicesDisabled];
            return;
        } else {
            [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kLocationRangingServicesDisabled];
            self.rangingSwitch = NO;
            return;
        }
    }
    
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    switch (authorizationStatus) {
        case kCLAuthorizationStatusAuthorizedAlways:
            if (self.operationContext == kMonitoringOperationContext) {
                self.monitoringSwitch = YES;
            } else {
                self.rangingSwitch = YES;
            }
            return;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            if (self.operationContext == kMonitoringOperationContext) {
                NSLog(kLocationMonitoringAccessMissing_Always);
                [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kLocationMonitoringAccessMissing_Always];
                self.monitoringSwitch = NO;
            } else {
                self.rangingSwitch = YES;
            }
            return;
            
        default:
            if (self.operationContext == kMonitoringOperationContext) {
                NSLog(kLocationMonitoringAccessMissing_Always);
                [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kLocationMonitoringAccessMissing_Always];
                self.monitoringSwitch = NO;
                return;
            } else {
                NSLog(kLocationMonitoringAccessMissing_WhenInUse);
                [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kLocationMonitoringAccessMissing_WhenInUse];
                self.rangingSwitch = NO;
                return;
            }
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region {
    
    NSArray *filteredBeacons = [self filteredBeacons:beacons];
    
    if (filteredBeacons.count == 0) {
        NSLog(@"No beacons found nearby.");
    } else {
        NSLog(@"Found %lu %@.", (unsigned long)[filteredBeacons count],
              [filteredBeacons count] > 1 ? @"beacons" : @"beacon");
    }
    
    self.detectedBeacons = filteredBeacons;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:BeaconFoundNotification object:self.detectedBeacons];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    
    NSLog(@"Entered region: %@", region);
    [self sendLocalNotificationForBeaconRegion:(CLBeaconRegion *)region];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    
    NSLog(@"Exited region: %@", region);
    [[NSNotificationCenter defaultCenter] postNotificationName:BeaconFoundNotification object:self.detectedBeacons];
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    
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
    
    NSLog(@"State changed to %@ for region %@.", stateString, region);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:BeaconFoundNotification object:self.detectedBeacons];

}

#pragma mark - Local notifications
- (void)sendLocalNotificationForBeaconRegion:(CLBeaconRegion *)region {
    
    UILocalNotification *notification = [UILocalNotification new];

    NSString *message = WellcomeMessage;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"userIdTextField"] length]) {
        NSString *userId =    [[NSUserDefaults standardUserDefaults] valueForKey:@"userIdTextField"];
        message = [NSString stringWithFormat:@"Hi %@, There is a notification waiting for you!!!",userId];
    }
    // Notification details
    
    notification.alertBody = [NSString stringWithFormat:@"%@", message];   // Major and minor are not available at the monitoring stage
    notification.alertAction = WellcomeTitle;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:[[self class] dictionaryFromReigon:region] forKey:BeaconUserInfo];
    [notification setUserInfo:userInfo];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

#pragma mark - Location access methods
- (void)checkLocationAccessForRanging {
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void)checkLocationAccessForMonitoring {
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
        if (authorizationStatus != kCLAuthorizationStatusAuthorizedAlways) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Access Missing"
                                                            message:@"Required Location Access(Always) missing. Click Settings to update Location Access."
                                                           delegate:self
                                                  cancelButtonTitle:@"Settings"
                                                  otherButtonTitles:@"Cancel", nil];
            [alert show];
            self.monitoringSwitch = NO;
            NSLog(kLocationAccessRequied_Always);
            [[NSNotificationCenter defaultCenter] postNotificationName:BeaconMonitoringNotification object:kLocationAccessRequied_Always];
            return;
        }
        [self.locationManager requestAlwaysAuthorization];
    }
}

#pragma mark - Alert view delegate methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}

+(NSDictionary*)dictionaryFromReigon:(CLBeaconRegion*)region {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setValue:[region proximityUUID].UUIDString forKey:@"proximityUUID"];

    [dic setValue:[region major] forKey:@"major"];
    [dic setValue:[region minor] forKey:@"minor"];
    
    return dic;
}

@end
