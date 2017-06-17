//
//  UserContentManager.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/5/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

@import CoreLocation;
@import CoreBluetooth;

#import "UserContentManager.h"

#define StarBucksMessage @"Welcome to StartBucks!!! Do you like to use your starbuck offer!"

@implementation UserContentManager

+(instancetype)sharedInstance{
    
    static UserContentManager * manager = nil;
    
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //
    if (manager == nil) {
        manager = [[UserContentManager alloc] init];
    }
    //    });
    
    return manager;
}

#pragma mark - Index path management

+ (NSMutableDictionary *)getOffersForBeacons:(NSArray *)beacons
{
    NSMutableDictionary *mutableBeacons = [NSMutableDictionary dictionary];
    
    [beacons enumerateObjectsUsingBlock:^(CLBeacon *beacon, NSUInteger idx, BOOL *stop) {

        NSArray *offersFound = [NSArray array];
        
        if (beacon.proximity == CLProximityImmediate) {
                offersFound = [[self class] getOffersForBeaconProximityIntermediate:beacon];
        }else if (beacon.proximity == CLProximityNear || beacon.proximity == CLProximityFar)
        {
            offersFound = [[self class] getOffersForBeaconProximityNear:beacon];
        }

        [mutableBeacons setObject:offersFound forKey:[NSString stringWithFormat:@"%lu",(unsigned long)idx]];
        
    }];
    
    return [mutableBeacons copy];
}

+ (NSArray *)getOffersForBeaconProximityNear:(CLBeacon *)beacons
{
    NSMutableArray *mutableBeacons = [NSMutableArray array];
    
    switch ([beacons.minor integerValue]) {
        case 2:{
            MDAOffers *offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:StarBucksMessage];
            [mutableBeacons addObject:offer];
            
//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];
//            
//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];
            
        }
            break;
        default:
        {
            MDAOffers *offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:StarBucksMessage];
            [mutableBeacons addObject:offer];
            
//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];
//            
//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];

        }
            break;
    }
    
    
    return [mutableBeacons copy];
}

+ (NSArray *)getOffersForBeaconProximityIntermediate:(CLBeacon *)beacons
{
    NSMutableArray *mutableBeacons = [NSMutableArray array];
    
    switch ([beacons.minor integerValue]) {
        case 2:{
            
            MDAOffers *offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:StarBucksMessage];
            [mutableBeacons addObject:offer];

//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];
//
//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];
//
//            offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:@"NEw"];
//            [mutableBeacons addObject:offer];

        }
            break;
        default:
        {
            MDAOffers *offer = [MDAOffers initOfferWithTitle:@"StarBucks" withDescription:StarBucksMessage];
            [mutableBeacons addObject:offer];
        }
            break;
    }
    
    
    return [mutableBeacons copy];
}

@end
