//
//  FTBaseViewController.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import "FTBaseViewController.h"

@interface FTBaseViewController ()

@end

@implementation FTBaseViewController

-(void)loadView{
    [super loadView];
    
    [[self view] setBackgroundColor:RGB(249,247,244)];
    [self configureTitleView];
}

-(void)configureTitleView {
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.title;
    titleLabel.accessibilityTraits = UIAccessibilityTraitHeader;
    [self fomatLabel:titleLabel withFont:FTCTouchTitleFont];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

-(void)setTitle:(NSString *)title{
    
//    CGFloat navBarWidth = [[UIScreen mainScreen] applicationFrame].size.width;
//    CGFloat titleViewHeight = self.navigationController.navigationBar.frame.size.height;
//    
//    CGFloat titleTextWidth = [title sizeWithFont:FTCTouchTitleFont
//                                    constrainedToSize:CGSizeMake(navBarWidth, titleViewHeight-10)
//                                        lineBreakMode:NSLineBreakByCharWrapping].width;
//    
//    if(titleTextWidth > SCREEN_WIDTH-60) {
//        titleTextWidth = SCREEN_WIDTH-60;
//    }
//    
//    CGRect labelViewFrame = CGRectMake(0, 0, titleTextWidth, titleViewHeight);
//    [[self.navigationItem titleView] setFrame:labelViewFrame];
    
    [(UILabel*)[self.navigationItem titleView] setText:title];
}

- (void)fomatLabel:(UILabel *)label withFont:(UIFont *)font
{
    [label setFont:font];
    [label setTextColor:FTCTouchTitleColor];
    [label setShadowColor:FTCTouchTitleShadowColor];
    [label setShadowOffset:FTCTouchTitleShadowOffset];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setNumberOfLines:1];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
}

- (void) setNavigationBarTitleView {
    
    UINavigationController *navigationController = [self navigationController];
    
    if(navigationController) {
        [[navigationController navigationBar] setTintColor:FTNavigationBarRed];
        if (IS_OS_7_OR_LATER) {
            //  BarTintColor is applied to Navigation Bar in iOS 7
            [[navigationController navigationBar] setBarTintColor:FTNavigationBarRed];
            
            // Navigation Bar title and button texts will be of tint Color in iOS 7
            [[navigationController navigationBar] setTintColor:[UIColor whiteColor]];
            [[navigationController navigationBar ] setTranslucent:NO];
            [[navigationController navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
            
        }
        
        UIImage *navBarTitleImage = [UIImage imageNamed:@"navbar_logo.png"];
        UIImageView *navBarTitleView = [[UIImageView alloc] initWithImage:navBarTitleImage];
        [self.navigationItem setTitleView:navBarTitleView];
    }
    
}


@end
