//
//  FTOffersTableViewCell.h
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/2/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLBeacon;
@class MDAOffers;

@interface FTOffersTableViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UIImageView *offersImageView;

-(void)setOffersMessageTextFromCLBeacon:(CLBeacon*)beacon;
-(void)setOffersMessageTextFromOffers:(MDAOffers*)offer;
@end
