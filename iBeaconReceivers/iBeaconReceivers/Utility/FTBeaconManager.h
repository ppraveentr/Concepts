//
//  FTBeaconManager.h
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;
@import CoreBluetooth;

#define WellcomeTitle @"View Details"
#define WellcomeMessage @"Wellcome, New offer is availabe for you!!!"

FOUNDATION_EXPORT NSString *const BeaconUserInfo;

@protocol FTBeaconManagerProtocal <NSObject>

@optional
-(void)nearByBeaconFound:(NSNotification*)sender;
-(void)iBeaconMonitoringFailed:(NSNotification*)sender;

@end

@interface FTBeaconManager : NSObject <CLLocationManagerDelegate>

+(instancetype)sharedInstance;

+(NSDictionary*)dictionaryFromReigon:(CLBeaconRegion*)region;

+(instancetype)startBeaconManagerWithDelegate:(id<FTBeaconManagerProtocal>)delegate;

+(void)stopBeaconManagerForDelegate:(id<FTBeaconManagerProtocal>)delegate;

+(BOOL)isBeaconMonitoring;

@end
