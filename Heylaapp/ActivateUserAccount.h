//
//  ActivateUserAccount.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 21/01/20.
//  Copyright © 2020 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActivateUserAccount : UIViewController <UITextFieldDelegate>
- (IBAction)backButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *submitOutlet;
- (IBAction)submitAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
