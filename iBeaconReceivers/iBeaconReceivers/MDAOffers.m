//
//  MDAOffers.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/5/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import "MDAOffers.h"

@implementation MDAOffers
@synthesize offerTitle, offerDescription;

+(instancetype)initOfferWithTitle:(NSString*)title withDescription:(NSString*)decs{
    MDAOffers *offer= [[MDAOffers alloc] init];
    
    [offer setOfferTitle:title];
    [offer setOfferDescription:decs];
    
    return offer;
}

-(instancetype)init{
    self = [super init];
    
    return self;
}

@end
