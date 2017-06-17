//
//  UserContentManager.h
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/5/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDAOffers.h"

@interface UserContentManager : NSObject

+(NSDictionary *)getOffersForBeacons:(NSArray *)beacons;

@end
