//
//  ConfirmPasswordViewController.m
//  Heylaapp
//
//  Created by HappySanz on 17/11/17.
//  Copyright © 2017 Palpro Tech. All rights reserved.
//

#import "ConfirmPasswordViewController.h"

@interface ConfirmPasswordViewController ()
{
    AppDelegate *appDel;
    NSString *eyeFlag;
}
@end

@implementation ConfirmPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    _submit.layer.cornerRadius = 8;
    _submit.clipsToBounds = YES;
    _newpassword.delegate = self;
    eyeFlag = @"0";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)eyeBtn:(id)sender
{
    if ([eyeFlag isEqualToString:@"0"])
    {
        self.imageView.image = [UIImage imageNamed:@"hide.png"];
        eyeFlag = @"1";
        self.newpassword.secureTextEntry = YES;
    }
    else
    {
        self.imageView.image = [UIImage imageNamed:@"unhide.png"];
        eyeFlag = @"0";
        self.newpassword.secureTextEntry = NO;
    }
}
- (IBAction)submitBtn:(id)sender
{
    NSString *password = self.newpassword.text;

    if ([self.newpassword.text isEqualToString:@""])
    {
//      [_newpassword showErrorWithText:@"Give a new password to reset!"];
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Password should contain atleast 6 characters"
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
    else if (password.length < 6)
    {
//      [_newpassword showErrorWithText:@"Password should contain atleast 6 characters"];
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Password should contain atleast 6 characters"
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
    else
    {
        appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];        
        NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
        [parameters setObject:appDel.user_Id forKey:@"user_id"];
        [parameters setObject:self.newpassword.text forKey:@"password"];

        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        NSString *resetPassword = @"apimain/resetpassword";
        NSArray *components = [NSArray arrayWithObjects:baseUrl,resetPassword, nil];
        NSString *api = [NSString pathWithComponents:components];
        
        [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             
             NSLog(@"%@",responseObject);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSString *msg = [responseObject objectForKey:@"msg"];
             NSString *status = [responseObject objectForKey:@"status"];
             
             if ([msg isEqualToString:@"Password Updated"] && [status isEqualToString:@"success"])
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
             else
             {
                 UIAlertController *alert= [UIAlertController
                                            alertControllerWithTitle:@"Heyla"
                                            message:msg
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
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.newpassword)
    {
        [theTextField resignFirstResponder];
    }
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.newpassword)
    {
        if (textField.text.length >= 12 && range.length == 0)
        {
            return NO;
        }
    }
    return YES;
}
-(void)dismissKeyboard
{
    [_newpassword resignFirstResponder];
    
}
- (IBAction)forgotPasswordAction:(id)sender {
}
@end
