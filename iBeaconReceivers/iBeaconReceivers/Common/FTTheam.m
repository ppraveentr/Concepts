//
//  FTTheam.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FTConstants.h"
#import "FTTheam.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define createImage(imgSrc) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgSrc ofType:@"png"]]

@implementation FTTheam

+ (BOOL)isSystemVersioniOS7OrGreater
{
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        return YES;
    }
    return NO;
}

+ (void)applyFTCTouchHandsetTheme
{
    //Configure the status bar style
    if([[self class] isSystemVersioniOS7OrGreater]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"header_bk.png"] forBarMetrics:UIBarMetricsDefault];
    
    //This sets the color of a navigation bar when contained within FTNavigationController
    [[UINavigationBar appearanceWhenContainedIn:[UINavigationController class], nil] setBackgroundImage:createImage(@"com_header_bk") forBarMetrics:UIBarMetricsDefault];
    
    
    //This configures the navigation bar title text
    NSMutableDictionary *navTitleAttritbutesInputDict = [[NSMutableDictionary alloc] init];
    [navTitleAttritbutesInputDict setObject:FTCTouchTitleFont forKey:NSFontAttributeName];
    [navTitleAttritbutesInputDict setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [navTitleAttritbutesInputDict setObject:RGFT(0, 0, 0, -1) forKey:NSShadowAttributeName];
    [[UINavigationBar appearance] setTitleTextAttributes:navTitleAttritbutesInputDict];
    
    if ([[self class] isSystemVersioniOS7OrGreater])
    {
        [[UINavigationBar appearance] setBarTintColor:FTNavigationBarRed];
    }

}

+ (UIButton *) getFTStandardButtonWithFrame:(CGRect) frame title:(NSString *) title
{
    UIImage *normalStateImage = [UIImage imageNamed:@"primary.png"];
    UIImage *highlightedImage = [UIImage imageNamed:@"primary_hit.png"];
    UIImage *disabledImage = [UIImage imageNamed:@"primary_disabled.png"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:frame];
    [button setBackgroundImage:normalStateImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:disabledImage forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; //Use white color for all the states
    [[button titleLabel] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}
@end
