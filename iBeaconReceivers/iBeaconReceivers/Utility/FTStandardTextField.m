//
//  FTStandardTextField.m
//  FTMobile
//
//  Created by Praveen Prabhakar on 1/23/13.
//  Copyright (c) 2015 Prabhakar, Praveen. All rights reserved.
//

#import "FTStandardTextField.h"
#import "FTConstants.h"

#define kPaddingRect CGRectMake(0, 0, 10, 10)

@interface FTStandardTextField (Private) 

- (void)setRightOverlayViewWithImage:(UIImage *) image;

@end

@implementation FTStandardTextField

@synthesize isCut,locations,signIn;

-(void)awakeFromNib{
    [super awakeFromNib];
    
    editOperationsDisabled = NO;
    
    //        [self setBackground:createImage(@"textinput_bk")];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self setReturnKeyType:UIReturnKeyDone];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self setEnablesReturnKeyAutomatically:YES];
    [self setLeftView:[[UIView alloc] initWithFrame:kPaddingRect]];
    [self setLeftViewMode:UITextFieldViewModeAlways];
    [self setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self setState:kFTTextFieldStateDefault];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
        
    if (self) {
        
        editOperationsDisabled = NO;
        
//        [self setBackground:createImage(@"textinput_bk")];
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setReturnKeyType:UIReturnKeyDone];
        [self setClearButtonMode:UITextFieldViewModeWhileEditing];
        [self setEnablesReturnKeyAutomatically:YES];
        [self setLeftView:[[UIView alloc] initWithFrame:kPaddingRect]];
        [self setLeftViewMode:UITextFieldViewModeAlways];
        [self setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self setState:kFTTextFieldStateDefault];
        
    }
    
    return self;
}


- (void) setState:(FTStandardTextFieldState) state {
    
    NSString *rightViewImageName = @"pencil_default.png";
    
    switch (state) {
            
        case kFTTextFieldStateFocus:
            rightViewImageName = @"pencil_focus.png";
            break;
        case kFTTextFieldStateError:
            rightViewImageName = @"error.png";
            break;
        case kFTTextFieldStateDefault:
        default:
            break;
    
    }
    
//    UIImage *rightViewImage = createImage(rightViewImageName);
//    [self setRightOverlayViewWithImage:rightViewImage];
    
}


- (void)setLeftOverlayViewWithImage:(UIImage *) image {
    
	
    
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
	[imageView setImage:image];
	[self setRightView:imageView];
	[self setRightViewMode: UITextFieldViewModeUnlessEditing];
    
}

- (void)setRightOverlayViewWithImage:(UIImage *) image {
    
	
    
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
	[imageView setImage:image];
	[self setRightView:imageView];
	[self setRightViewMode: UITextFieldViewModeUnlessEditing];
    
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

-(void) cut:(id)sender {
    
    self.isCut = TRUE;
    
    [super cut:sender];
    
}

-(BOOL) canPerformAction:(SEL)action withSender:(id)sender
{
    if (editOperationsDisabled) {
        return NO;
    }
    
    
    return [super canPerformAction:action withSender:sender];
    
}

- (BOOL) hasText {
    
    return ([[self text] length] != 0);
    
}

- (void) disableEditOperations:(BOOL) disable {
    
    editOperationsDisabled = disable;

}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
	
	if(signIn)
		return CGRectMake(10, 12,136,20);
	else if(locations)
		return CGRectMake(5,5,30,20);
	else
		return [super leftViewRectForBounds:bounds];
}

@end

