//
//  FTBeaconOffersViewController.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import "FTBeaconOffersViewController.h"
#import "FTBeaconManager.h"
#import "UserContentManager.h"

#import "FTSwichTableViewCell.h"
#import "FTOffersTableViewCell.h"

#import "AppDelegate.h"

@interface FTBeaconOffersViewController () <UITableViewDataSource,UITableViewDelegate,FTSwichTableViewCellProtocal,FTBeaconManagerProtocal>

@property (nonatomic,strong) NSArray *detectedBeacons;
@property (nonatomic,strong) NSDictionary *offersAvaialbe;
@property (nonatomic,strong) IBOutlet UITableView *currentTableView;
@end

@implementation FTBeaconOffersViewController
@synthesize currentTableView;

- (void)loadView {
    [super loadView];
    
    [self setTitle:@"Offers"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
        //Start Beacon Ranging
    if ([[NSUserDefaults standardUserDefaults] valueForKey:kBeaconMonitoringCellIdentifier]) {
        [FTBeaconManager startBeaconManagerWithDelegate:self];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //Stop Beacon Ranging
    [FTBeaconManager stopBeaconManagerForDelegate:self];
}

#pragma mark-

-(void)switchValueChanged:(UISwitch*)sender{
    
    if ([sender tag] == [kFingerPrintCellIdentifier hash]) {
        if ([sender isOn]) {
            [[NSUserDefaults standardUserDefaults] setValue:@([sender isOn]) forKey:kFingerPrintCellIdentifier];
        }else{
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:kFingerPrintCellIdentifier];
        }

    }
    else if ([sender tag] == [kBeaconMonitoringCellIdentifier hash]) {
        
        if ([sender isOn]) {
            [FTBeaconManager startBeaconManagerWithDelegate:self];
            [[NSUserDefaults standardUserDefaults] setValue:@([sender isOn]) forKey:kBeaconMonitoringCellIdentifier];
        }else{
            [FTBeaconManager stopBeaconManagerForDelegate:self];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:kBeaconMonitoringCellIdentifier];
        }
    }
}

#pragma mark-
-(IBAction)signOutClicked:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark- iBeacon Notifications
-(void)nearByBeaconFound:(NSNotification*)sender{
    if ([[sender object] isKindOfClass:[NSArray class]]) {
        _detectedBeacons = [NSArray arrayWithArray:[sender object]];
    }
    
    if ([_detectedBeacons count]) {
        _offersAvaialbe = [NSDictionary dictionaryWithDictionary:[UserContentManager getOffersForBeacons:_detectedBeacons]];
    }else if ([_offersAvaialbe count]){
        _offersAvaialbe = [NSDictionary dictionary];
    }
    
    [currentTableView reloadData];
}

-(void)iBeaconMonitoringFailed:(NSNotification *)sender{
    [self.currentTableView reloadData];
}

#pragma mark - Table view functionality

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.offersAvaialbe count]+1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Preference";
    }
    if ([self.offersAvaialbe count]) {
        return @"Available Offers";
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1; // Return 2 for using Touch Id
    }
    return [(NSArray*)_offersAvaialbe[[@(section-1) stringValue]] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 44;
    }
    
    if ([self.offersAvaialbe count]) {
        return 90;
    }
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Preference
    if (indexPath.section == 0) {
        
        NSString *cellIdentifier = kBeaconMonitoringCellIdentifier;
        
        if (indexPath.row == 1) {
            cellIdentifier = kFingerPrintCellIdentifier;

        }
        FTSwichTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        [[cell cellSwitch] setTag:[cellIdentifier hash]];
        
        [cell setSwitchDelegate:self];
        
        if (indexPath.row == 0) {
            [[cell cellSwitch] setOn:[FTBeaconManager isBeaconMonitoring]];

        }
        else if (indexPath.row == 1) {
            [[cell cellSwitch] setOn:[[NSUserDefaults standardUserDefaults] valueForKey:kFingerPrintCellIdentifier]];
        }
        
        return cell;

    }
    
    //Available Offers
    NSArray *offers = self.offersAvaialbe[[@(indexPath.section-1) stringValue]];
    MDAOffers *selectedOffer = offers[indexPath.row];
    
    FTOffersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFTOffersCellIdentifier];
    [cell setOffersMessageTextFromOffers:selectedOffer];
    
    return cell;
}


-(CGFloat)getRequiredHeightForText:(NSString*)_string forWidth:(CGFloat)width
{
    if (_string == nil || [_string length] ==0)
        return 44;
    
    CGSize requiredSize,maxSize=CGSizeMake(width,1000);
    
    requiredSize = [_string boundingRectWithSize: maxSize
                                              options: (NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                           attributes: [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:13]
                                                                                   forKey:NSFontAttributeName]
                                              context: nil].size;
    
    requiredSize.height = MAX(requiredSize.height+20,20);
    return ceilf(requiredSize.height);
}

@end
