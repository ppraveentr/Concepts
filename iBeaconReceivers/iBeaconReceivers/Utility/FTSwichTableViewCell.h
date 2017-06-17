//
//  FTSwichTableViewCell.h
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/1/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FTSwichTableViewCellProtocal <NSObject>

-(void)switchValueChanged:(id)sender;

@end

@interface FTSwichTableViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UISwitch *cellSwitch;
@property (nonatomic,assign) id<FTSwichTableViewCellProtocal> switchDelegate;

@end
