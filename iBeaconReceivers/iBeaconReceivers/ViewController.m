//
//  ViewController.m
//  iBeaconReceivers
//
//  Created by Prabhakar, Praveen on 12/30/14.
//  Copyright (c) 2014 Prabhakar, Praveen. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

#import "AppDelegate.h"
#import "FTBeaconManager.h"

#import "FTBeaconOffersViewController.h"

@interface ViewController () <FTBeaconManagerProtocal>
@property (nonatomic, strong) IBOutlet UITextField *userIdTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Sign In"];
    [self setNavigationBarTitleView];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:kFingerPrintCellIdentifier]) {
//        [self touchIdCheck];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] setIsSignedIn:NO];
}

-(IBAction)turnOnBeacon:(UISwitch*)sender{
    
//    if ([sender isOn]) {
//        [FTBeaconManager startBeaconManagerWithDelegate:self];
//    }else{
//        [FTBeaconManager stopBeaconManagerForDelegate:self];
//    }

}

-(IBAction)signInButtonClicked:(id)sender{
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] setIsSignedIn:YES];

    [[NSUserDefaults standardUserDefaults] setObject:[_userIdTextField text] forKey:@"userIdTextField"];
}

-(void)touchIdSighIn{
    [self signInButtonClicked:nil];
    [self performSegueWithIdentifier:@"OffersViewSegue" sender:nil];
}

#pragma mark - Touch id
-(void)touchIdCheck
{
    NSLog(@"touchIdCheck");
    LAContext *contextTouch = [[LAContext alloc] init];
    // Set the LocalizedFallbackTitle empty if we dont want to show the Fallback option.
    [contextTouch setLocalizedFallbackTitle:@""];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Scan fingerprint to SignIn";
    
    if (IS_OS_8_OR_LATER && [contextTouch canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError])
    {
        // Fingerprints exist for Touch ID
        [contextTouch evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                     localizedReason:myLocalizedReasonString
                               reply:^(BOOL success, NSError *error)
         {
             if (success) {
                 
                 // User authenticated successfully
                 NSLog(@"Touch ID Success");
                 dispatch_sync(dispatch_get_main_queue(), ^{
                     [self touchIdSighIn];
                 });
             }
             else {
                 
                 NSLog(@"Touch ID failed : %ld", (long) error.code);
                 
                 switch (error.code)
                 {
                     case LAErrorAuthenticationFailed:
                     {
                         NSLog(@"Inside LAErrorAuthenticationFailed");
                         break;
                     }
                     case LAErrorUserCancel:
                     {
                         NSLog(@"Inside LAErrorUserCancel");
                         
                         dispatch_sync(dispatch_get_main_queue(), ^{
//                             [self.splashScreenView removeFromSuperview];
//                             [self loginRegularFlow];
                             
                             
                         });
                         
                         break;
                     }
                     case LAErrorUserFallback:
                     {
                         NSLog(@"Inside LAErrorUserFallback");
                         
                         break;
                     }
                         
                     case LAErrorSystemCancel:
                     {
                         NSLog(@"Inside LAErrorSystemCancel");
                         
                         break;
                     }
                     case LAErrorTouchIDNotAvailable:
                     {
                         NSLog(@"Inside LAErrorTouchIDNotAvailable");
                         
                         break;
                     }
                         
                     default:
                     {
                         NSLog(@"Inside Default error");
                         
                         //                         UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Error" message:@"Touch ID failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                         //
                         //                         dispatch_sync(dispatch_get_main_queue(), ^{
                         //                             [alert show];
                         //
                         //                            [self.splashScreenView removeFromSuperview];
                         //                             [self loginRegularFlow];
                         //
                         //
                         //                         });
                         break;
                     }
                 }
                 
                 
             }
             
         }];
    }
    else
    {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Error" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if(authError.code == LAErrorTouchIDNotEnrolled) {
            alert.message = @"You do not have any fingerprints enrolled. Please register in device Settings";
        }else if(authError.code == LAErrorTouchIDNotAvailable) {
            alert.message = @"Your device does not support TouchID authentication!";
        }else if(authError.code == LAErrorPasscodeNotSet){
            alert.message = @"Please set Passcode and enable Touch ID in device Settings";
        }
        else{
            alert.message = @"Touch ID isn't supported on your device";
            
        }
        [alert show];
    }
}

@end
