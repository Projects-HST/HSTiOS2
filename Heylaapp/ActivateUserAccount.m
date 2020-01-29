//
//  ActivateUserAccount.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 21/01/20.
//  Copyright © 2020 Palpro Tech. All rights reserved.
//

#import "ActivateUserAccount.h"

@interface ActivateUserAccount ()
{
    AppDelegate *appDel;
}
@end

@implementation ActivateUserAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.email.delegate = self;
//    self.phoneNumber.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                  action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
//    [self NumberKeypadToolBar];
    self.submitOutlet.layer.cornerRadius = 5.0;
    self.submitOutlet.clipsToBounds = YES;
}

//-(void)NumberKeypadToolBar
//{
//    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50)];
//    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
//    numberToolbar.items = [NSArray arrayWithObjects:
//                          [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNumberPad)],
//                          [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                          [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneWithNumberPad)],
//                          nil];
//    [numberToolbar sizeToFit];
//    _phoneNumber.inputAccessoryView = numberToolbar;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)submitAction:(id)sender
{
    if ([self.email.text isEqual: @""])
    {
        UIAlertController *alert= [UIAlertController
                                  alertControllerWithTitle:@"Heyla"
                                  message:@"Email ID/Mobile number is mandatory"
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
        [self webRequest:self.email.text];
    }
}

-(void)webRequest:(NSString *)emailOrPhoneNumber
{
    [self.email resignFirstResponder];
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:emailOrPhoneNumber forKey:@"email_or_mobile"];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *getEventCountries = @"apimain/check_account_activate";
    NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventCountries, nil];
    NSString *api = [NSString pathWithComponents:components];
    
    [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
    
        NSLog(@"%@",responseObject);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString *msg = [responseObject objectForKey:@"msg"];
        NSString *status = [responseObject objectForKey:@"status"];
    
        if ([msg isEqualToString:@"Code has sent to mobile number successfully"] && [status isEqualToString:@"Success"])
        {
            [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"fromActivatePage"];
            [self performSegueWithIdentifier:@"activateToOtp" sender:self];
        }
        else if ([msg isEqualToString:@"Code has sent to mail  successfully"] && [status isEqualToString:@"Success"])
        {
            [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"fromActivatePage"];
            [self performSegueWithIdentifier:@"activateToOtp" sender:self];
        }
        else if ([msg isEqualToString:@"Please Contact Heyla Team!."] && [status isEqualToString:@"Error"])
        {
            [self deactivateAccountAdmin:self.email.text];
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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.email)
    {
        [_email resignFirstResponder];
    }
    
    return YES;
}

-(void)deactivateAccountAdmin:(NSString *)emailOrPhoneNumber
{
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:emailOrPhoneNumber forKey:@"email_or_mobile"];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *getEventCountries = @"apimain/request_to_activate";
    NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventCountries, nil];
    NSString *api = [NSString pathWithComponents:components];
    
    [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
    
        NSLog(@"%@",responseObject);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString *msg = [responseObject objectForKey:@"msg"];
        NSString *status = [responseObject objectForKey:@"status"];
    
        if ([msg isEqualToString:@"Account activation request sent successfully"] && [status isEqualToString:@"success"])
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
                                     LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                     [self presentViewController:loginViewController animated:NO completion:nil];
                                 }];
            
             [alert addAction:ok];
             [self presentViewController:alert animated:YES completion:nil];
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

//-(void)doneWithNumberPad
//{
//    if (_phoneNumber.isFirstResponder)
//    {
//        [_phoneNumber resignFirstResponder];
//    }
//}
//
//-(void)cancelNumberPad
//{
//    [_phoneNumber resignFirstResponder];
//}

-(void)dismissKeyboard
{
    [_email resignFirstResponder];
    [_phoneNumber resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"activateToOtp"]) {

        // Get destination view
        ForgotPasswordOTPViewController *vc = [segue destinationViewController];
        // Pass the information to your destination view
        vc.emailOrphoneNumber = self.email.text;
    }
}

@end
