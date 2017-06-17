//
//  MDAOffers.h
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/5/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAOffers : NSObject

@property (nonatomic,strong) NSString *offerTitle;
@property (nonatomic,strong) NSString *offerDescription;

+(instancetype)initOfferWithTitle:(NSString*)title withDescription:(NSString*)decs;

@end
