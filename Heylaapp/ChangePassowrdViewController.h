//
//  ChangePassowrdViewController.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 28/01/20.
//  Copyright © 2020 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangePassowrdViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *oldPassword;
@property (weak, nonatomic) IBOutlet UITextField *passsword;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *oldPasswrdBtnOutlet;
@property (weak, nonatomic) IBOutlet UIButton *PasswordBtnOutlet;
@property (weak, nonatomic) IBOutlet UIButton *confirmPasswordBtnOutlet;
- (IBAction)oldPasswordAction:(id)sender;
- (IBAction)newPasswordAction:(id)sender;
- (IBAction)confirmPasswordAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitOutlet;
- (IBAction)submitAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *oldPasswordImg;
@property (weak, nonatomic) IBOutlet UIImageView *paswwordImg;
@property (weak, nonatomic) IBOutlet UIImageView *confirmPasswordImg;
- (IBAction)backBtnAction:(id)sender;
- (IBAction)forgotPasswordAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
