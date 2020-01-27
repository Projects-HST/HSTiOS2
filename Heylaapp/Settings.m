//
//  Settings.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 13/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import "Settings.h"
#import "Aboutus.h"

@interface Settings ()
{
    AppDelegate *appDel;
    BOOL isSwitchClicked;
    NSString *status;
    NSString *selectView;
}

@end

@implementation Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self checkingForNotification];
}

- (void)checkingForNotification
{
            appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
            [parameters setObject:appDel.user_Id forKey:@"user_id"];

            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
            NSString *getEventCountries = @"apimain/profileDetails";
            NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventCountries, nil];
            NSString *api = [NSString pathWithComponents:components];
        
            [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
             {
        
                 NSLog(@"%@",responseObject);
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSString *msg = [responseObject objectForKey:@"msg"];
                 NSString *status = [responseObject objectForKey:@"status"];
        

                 if ([msg isEqualToString:@"User Details"] && [status isEqualToString:@"Success"])
                 {
                     NSDictionary *dict = [responseObject objectForKey:@"userData"];
                     NSString *newsletter_status = [dict objectForKey:@"newsletter_status"];
                     if ([newsletter_status isEqualToString:@"Y"])
                     {
                         self->isSwitchClicked = false;
                         self->status = @"Y";
                         [self->_switchOutlet setOn:YES animated:YES];

                     }
                     else
                     {
                         self->isSwitchClicked = true;
                         self->status = @"N";
                         [self->_switchOutlet setOn:NO animated:YES];
                     }

                 }

             }
                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
             {
                 NSLog(@"error: %@", error);
             }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return 10;
}

- (void)updateNotificationStatus
{
        appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
        [parameters setObject:appDel.user_Id forKey:@"user_id"];
        [parameters setObject:self->status forKey:@"status"];

        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
        NSString *getEventCountries = @"apimain/updateNotification";
        NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventCountries, nil];
        NSString *api = [NSString pathWithComponents:components];
    
        [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
    
             NSLog(@"%@",responseObject);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSString *msg = [responseObject objectForKey:@"msg"];
             NSString *status = [responseObject objectForKey:@"status"];
    
             if ([msg isEqualToString:@"Notification Updated"] && [status isEqualToString:@"success"])
             {
//                 UIAlertController *alert= [UIAlertController
//                                            alertControllerWithTitle:@"Heyla"
//                                            message:msg
//                                            preferredStyle:UIAlertControllerStyleAlert];
//
//                 UIAlertAction *ok = [UIAlertAction
//                                      actionWithTitle:@"OK"
//                                      style:UIAlertActionStyleDefault
//                                      handler:^(UIAlertAction * action)
//                                      {
//
//                                      }];
//
//                 [alert addAction:ok];
//                 [self presentViewController:alert animated:YES completion:nil];
                 
                 MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                 
                 // Configure for text only and offset down
                 hud.mode = MBProgressHUDModeText;
                 hud.label.text = @"Push notification enabled";
                 hud.margin = 10.f;
                 hud.yOffset = 200.f;
                 hud.removeFromSuperViewOnHide = YES;
                 [hud hideAnimated:YES afterDelay:2];
             }
             else
             {
//                 UIAlertController *alert= [UIAlertController
//                                            alertControllerWithTitle:@"Heyla"
//                                            message:msg
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//                 UIAlertAction *ok = [UIAlertAction
//                                      actionWithTitle:@"OK"
//                                      style:UIAlertActionStyleDefault
//                                      handler:^(UIAlertAction * action)
//                                      {
//    
//                                      }];
//    
//                 [alert addAction:ok];
//                 [self presentViewController:alert animated:YES completion:nil];
                 
                 MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                 
                 // Configure for text only and offset down
                 hud.mode = MBProgressHUDModeText;
                 hud.label.text = @"Push notification disabled";
                 hud.margin = 10.f;
                 hud.yOffset = 200.f;
                 hud.removeFromSuperViewOnHide = YES;
                 [hud hideAnimated:YES afterDelay:2];
             }
         }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             NSLog(@"error: %@", error);
         }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1)
    {
        [self performSegueWithIdentifier:@"profileSegue" sender:self];
    }
    else if (indexPath.row == 3)
    {
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Are you sure want to deactive your account?"
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"YES"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                [self deactiveAccount];
                             }];
        
        UIAlertAction *cancel = [UIAlertAction
                                 actionWithTitle:@"NO"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if (indexPath.row == 4)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"aboutus" forKey:@"policys"];
        [self performSegueWithIdentifier:@"privacyPolicy" sender:self];
    }
    else if (indexPath.row == 5)
    {
        [self performSegueWithIdentifier:@"feedback" sender:self];
    }
    else if (indexPath.row == 6)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"privacypolicy" forKey:@"policys"];
        [self performSegueWithIdentifier:@"privacyPolicy" sender:self];
    }
    else if (indexPath.row == 7)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"paymentpolicy" forKey:@"policys"];
        [self performSegueWithIdentifier:@"privacyPolicy" sender:self];
    }
    else if (indexPath.row == 8)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"termsConditn" forKey:@"policys"];
        [self performSegueWithIdentifier:@"privacyPolicy" sender:self];
    }
    
}
-(void)deactiveAccount
{
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:appDel.user_Id forKey:@"user_id"];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *getEventCountries = @"apimain/account_deactive";
    NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventCountries, nil];
    NSString *api = [NSString pathWithComponents:components];
    
    [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
    
        NSLog(@"%@",responseObject);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString *msg = [responseObject objectForKey:@"msg"];
        NSString *status = [responseObject objectForKey:@"status"];
    
        if ([msg isEqualToString:@"Account Deactivated Successfully"] && [status isEqualToString:@"Success"])
        {
            [self clearAllSavedData];
            LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self presentViewController:loginViewController animated:NO completion:nil];
        }

    }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             NSLog(@"error: %@", error);
         }];
}

-(void)clearAllSavedData
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
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation

- (IBAction)switchAction:(id)sender
{
    if (isSwitchClicked == true)
    {
        self->isSwitchClicked = false;
        [_switchOutlet setOn:YES animated:YES];
        self->status = @"Y";
        [self updateNotificationStatus];
    }
    else
    {
        self->isSwitchClicked = true;
        [_switchOutlet setOn:NO animated:YES];
        self->status = @"N";
        [self updateNotificationStatus];

    }
}

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
