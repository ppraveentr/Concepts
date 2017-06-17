//
//  FTConstants.h
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTTheam.h"

static NSString * const kFingerPrintCellIdentifier = @"FingerPrintCell";
static NSString * const kBeaconMonitoringCellIdentifier = @"BeaconMonitoringCell";
static NSString * const kFTOffersCellIdentifier = @"FTOffersCell";

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#define RGB(r, g, b)		[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGFT(r, g, b, a)		[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


static NSString * const kAppBoldFontName = @"HelveticaNeue-Bold";
#define FTCTouchTitleColor RGFT(255, 255, 255, 1)

#define FTCTouchTitleFont [UIFont fontWithName:kAppBoldFontName size:16.0f]
#define FTCTouchTitleShadowColor RGFT(0, 0, 0, 0.1)
#define FTCTouchTitleShadowOffset CGSizeMake(0, 1)

#define FTBrandColor_A RGB(185,15,0)
#define FTNavigationBarRed FTBrandColor_A

