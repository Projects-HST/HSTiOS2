//
//  ChangePassowrdViewController.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 28/01/20.
//  Copyright © 2020 Palpro Tech. All rights reserved.
//

#import "ChangePassowrdViewController.h"

@interface ChangePassowrdViewController ()
{
    AppDelegate *appDel;
    NSString *oldPaswrd;
    NSString *paswrd;
    NSString *confirmPaswrd;
}

@end

@implementation ChangePassowrdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.oldPassword.delegate = self;
    self.passsword.delegate = self;
    self.confirmPassword.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
    action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    _submitOutlet.layer.cornerRadius = 5;
    _submitOutlet.clipsToBounds = YES;
    
    oldPaswrd = @"YES";
    paswrd = @"YES";
    confirmPaswrd = @"YES";

}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,630);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)oldPasswordAction:(id)sender
{
    if ([oldPaswrd isEqualToString:@"YES"])
    {
        self.oldPasswordImg.image = [UIImage imageNamed:@"unhide"];
        oldPaswrd = @"NO";
        self.oldPassword.secureTextEntry = NO;
    }
    else
    {
        self.oldPasswordImg.image = [UIImage imageNamed:@"hide"];
        oldPaswrd = @"YES";
        self.oldPassword.secureTextEntry =  YES;
    }
}

- (IBAction)newPasswordAction:(id)sender
{
    if ([paswrd isEqualToString:@"YES"])
    {
        self.paswwordImg.image = [UIImage imageNamed:@"unhide"];
        paswrd = @"NO";
        self.passsword.secureTextEntry = NO;
    }
    else
    {
        self.paswwordImg.image = [UIImage imageNamed:@"hide"];
        paswrd = @"YES";
        self.passsword.secureTextEntry =  YES;
    }
}

- (IBAction)confirmPasswordAction:(id)sender
{
    if ([confirmPaswrd isEqualToString:@"YES"])
    {
        self.confirmPasswordImg.image = [UIImage imageNamed:@"unhide"];
        confirmPaswrd = @"NO";
        self.confirmPassword.secureTextEntry = NO;
    }
    else
    {
        self.confirmPasswordImg.image = [UIImage imageNamed:@"hide"];
        confirmPaswrd = @"YES";
        self.confirmPassword.secureTextEntry =  YES;
    }
}

- (IBAction)submitAction:(id)sender
{
    if ([self.oldPassword.text isEqualToString:@""])
    {
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Old Password cannot be empty"
                                   preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {

                             }];

        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if ([self.passsword.text isEqualToString:@""])
    {
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"New Password cannot be empty"
                                   preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {

                             }];

        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if ([self.confirmPassword.text isEqualToString:@""])
    {
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Confirm Password cannot be empty"
                                   preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {

                             }];

        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if (self.passsword.text == self.confirmPassword.text)
    {
        NSLog(@"%@%@",self.passsword.text,self.confirmPassword.text);
        [self requestForChangingPassword:self.oldPassword.text:self.passsword.text];
    }
    else
    {
        NSLog(@"%@%@",self.passsword.text,self.confirmPassword.text);
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Password didn't match"
                                   preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {

                             }];

        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)requestForChangingPassword:(NSString *)oldPassword :(NSString *)newPassword
{
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:appDel.user_Id forKey:@"user_id"];
    [parameters setObject:oldPassword forKey:@"old_password"];
    [parameters setObject:newPassword forKey:@"password"];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    NSString *mobileverify = @"apimain/change_password";
    NSArray *components = [NSArray arrayWithObjects:baseUrl,mobileverify, nil];
    NSString *api = [NSString pathWithComponents:components];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {

         NSLog(@"%@",responseObject);
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         NSString *msg = [responseObject objectForKey:@"msg"];
         NSString *status = [responseObject objectForKey:@"status"];

         if ([msg isEqualToString:@"Password Updated"] && [status isEqualToString:@"success"])
         {
             UIAlertController *alert= [UIAlertController
                                        alertControllerWithTitle:@"Heyla"
                                        message:@"Password Updated"
                                        preferredStyle:UIAlertControllerStyleAlert];

             UIAlertAction *ok = [UIAlertAction
                                  actionWithTitle:@"OK"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                    [self changedPassword];
                                  }];

             [alert addAction:ok];
             [self presentViewController:alert animated:YES completion:nil];
         }
         else
         {
             UIAlertController *alert= [UIAlertController
                                        alertControllerWithTitle:@"Heyla"
                                        message:@"Old password is incorrect"
                                        preferredStyle:UIAlertControllerStyleAlert];

             UIAlertAction *ok = [UIAlertAction
                                  actionWithTitle:@"OK"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                    
                                  }];

             [alert addAction:ok];
             [self presentViewController:alert animated:YES completion:nil];
         }
     }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSLog(@"error: %@", error);
     }];
}
-(void)changedPassword
{
    self->appDel.user_name = @"";
    self->appDel.picture_url =@"";
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"stat_user_type"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"stat_user_id"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"password"];
    [[NSUserDefaults standardUserDefaults]setObject:@"signOut" forKey:@"status"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"picture_Url"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"statemail_id"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"statemobile_no"];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"fullName"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"dob"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"occupation"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"gender"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"addressLine"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"addressLineTwo"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"addressLineThree"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"country"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"state"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"city"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"pincode"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"country_id_key"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"state_id_key"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"city_id_key"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"new_Letter"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"statFull_Name"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"statUser_Name"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"selectView"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"deviceToken_Key"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"showSplash"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"status"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"from_sideMenu"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"selected_city_prof"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"TranscationStatus"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"userInfostat"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"remember_me"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"locatedCity"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"for_Alert"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"for_Alert"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"advnce_filter"];
    LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginViewController animated:NO completion:nil];
}

- (void)keyboardWasShown:(NSNotification*)notification
{
    NSDictionary *info = [notification userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    UIEdgeInsets contentInset = self.scrollView.contentInset;
    contentInset.bottom = keyboardRect.size.height;
    self.scrollView.contentInset = contentInset;
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.oldPassword)
    {
        [_passsword becomeFirstResponder];
    }
    else if (theTextField == self.passsword)
    {
        [_confirmPassword becomeFirstResponder];
    }
    else if (theTextField == self.confirmPassword)
    {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= 12 && range.length == 0)
    {
        return NO;
    }
    return YES;
}

-(void)dismissKeyboard
{
    [_oldPassword resignFirstResponder];
    [_passsword resignFirstResponder];
    [_confirmPassword resignFirstResponder];
}
- (IBAction)backBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)forgotPasswordAction:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"NO" forKey:@"fromActivatePage"];
    [self performSegueWithIdentifier:@"forgotPassword" sender:self];
}
@end
