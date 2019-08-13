//
//  Feedback.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 13/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Feedback : UIViewController<UITextFieldDelegate>
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *feedback;
@property (weak, nonatomic) IBOutlet UIButton *feedbackOutlet;
- (IBAction)feedbackAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

NS_ASSUME_NONNULL_END
