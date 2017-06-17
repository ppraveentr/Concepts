//
//  FTOffersTableViewCell.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/2/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import "FTOffersTableViewCell.h"
#import "FTBeaconManager.h"
#import "MDAOffers.h"

@interface FTOffersTableViewCell ()

@property (nonatomic,strong) IBOutlet UILabel *offersMessage;
@end

@implementation FTOffersTableViewCell
@synthesize offersImageView;

+(NSString *)detailsStringForBeacon:(CLBeacon *)beacon
{
    switch ([beacon.minor integerValue]) {
        case 1:
        {
            return @"Welcome to StartBucks!!! Do you like to use your starbuck offer!";
            
        }
            break;
        case 2:{
            return @"Hi User, Welcome to our banking Center!!! Would you like to meet with our Merrill Lynch adviser!";
        }
            break;
            
        default:
            break;
    }
    
    NSString *proximity;
    switch (beacon.proximity) {
        case CLProximityNear:
            proximity = @"Near";
            break;
        case CLProximityImmediate:
            proximity = @"Immediate";
            break;
        case CLProximityFar:
            proximity = @"Far";
            break;
        case CLProximityUnknown:
        default:
            proximity = @"Unknown";
            break;
    }
    
    NSString *format = @"%@, %@ • %@ • %f • %li";
    
    return [NSString stringWithFormat:format, beacon.major, beacon.minor, proximity, beacon.accuracy, beacon.rssi];
}

#pragma mark -
-(void)setOffersMessageTextFromCLBeacon:(CLBeacon*)beacon{
    [_offersMessage setText:[[self class] detailsStringForBeacon:beacon]];
    
    switch ([beacon.minor integerValue]) {
        case 1: {
            [offersImageView setImage:[UIImage imageNamed:@"starbucks_logo.png"]];
        }
            break;
        case 2:{
            [offersImageView setImage:[UIImage imageNamed:@"merrilllynch_logo.png"]];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)setOffersMessageTextFromOffers:(MDAOffers*)beacon{
    
    [_offersMessage setText:[beacon offerDescription]];
    [offersImageView setImage:[UIImage imageNamed:@"starbucks_logo.png"]];
    
}
@end
