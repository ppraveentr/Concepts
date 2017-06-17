//
//  FTStandardTextField.h
//  FTMobile
//
//  Created by Praveen Prabhakar on 1/23/13.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    
    kFTTextFieldStateDefault = 0,
    
    kFTTextFieldStateFocus,
    
    kFTTextFieldStateError
    
} FTStandardTextFieldState;

@interface FTStandardTextField : UITextField {
    
    BOOL isCut;
    BOOL editOperationsDisabled;
    BOOL signIn,locations;
    
}

@property (nonatomic) BOOL isCut,signIn,locations;

- (id) initWithFrame:(CGRect) frame;
- (void) setState:(FTStandardTextFieldState) state;
- (BOOL) hasText;
- (void) disableEditOperations:(BOOL) disable;
- (void)setLeftOverlayViewWithImage:(UIImage *) image;

@end
