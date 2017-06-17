//
//  FTSwichTableViewCell.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 1/1/15.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import "FTSwichTableViewCell.h"

@implementation FTSwichTableViewCell
@synthesize cellSwitch;
@synthesize switchDelegate;

-(IBAction)switchValueChanged:(id)sender{
    if ([switchDelegate respondsToSelector:@selector(switchValueChanged:)]) {
        [switchDelegate switchValueChanged:sender];
    }
}

@end
