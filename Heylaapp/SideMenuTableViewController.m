//
//  SideMenuTableViewController.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 30/05/18.
//  Copyright © 2018 Palpro Tech. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import <QuartzCore/QuartzCore.h>

@interface SideMenuTableViewController ()
{
    NSArray *menuItems;
    NSArray *staticMenu;
    AppDelegate *appDel;
}
@end

@implementation SideMenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    menuItems = @[@"samp",@"bookingHistory",@"preference", @"changeCity", @"wishList", @"shareApp", @"rateApp", @"blog",@"settings",@"userinfo",@"logOut"];
    staticMenu = @[@"userName"];
    [self getProfileDetails];
}

-(void)getProfileDetails
{
    appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSString *user_id = [[NSUserDefaults standardUserDefaults]objectForKey:@"stat_user_id"];
    self->appDel.user_Id = user_id;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:appDel.user_Id forKey:@"user_id"];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *getEventcities = @"apimain/profileDetails";
    NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventcities, nil];
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
             NSString *user_id = [dict objectForKey:@"user_id"];
             self->appDel.user_Id = [dict objectForKey:@"user_id"];
             self->appDel.address_line_1 = [dict objectForKey:@"address_line_1"];
             self->appDel.address_line_2 = [dict objectForKey:@"address_line_2"];
             self->appDel.address_line_3 = [dict objectForKey:@"address_line_3"];
             self->appDel.birth_date = [dict objectForKey:@"birth_date"];
             self->appDel.city_id = [dict objectForKey:@"city_id"];
             self->appDel.city_name = [dict objectForKey:@"city_name"];
             self->appDel.country_id = [dict objectForKey:@"country_id"];
             self->appDel.country_name = [dict objectForKey:@"country_name"];
             self->appDel.email_verify_status = [dict objectForKey:@"email_verify_status"];
             NSString *full_Name = [dict objectForKey:@"full_name"];
             [[NSUserDefaults standardUserDefaults]setObject:full_Name forKey:@"statFull_Name"];
             self->appDel.full_name = [[NSUserDefaults standardUserDefaults]objectForKey:@"statFull_Name"];
             self->appDel.gender = [dict objectForKey:@"gender"];
             self->appDel.newsletter_status = [dict objectForKey:@"newsletter_status"];
             self->appDel.occupation = [dict objectForKey:@"occupation"];
             self->appDel.picture_url = [dict objectForKey:@"picture_url"];
             NSString *picture = [dict objectForKey:@"picture_url"];
             self->appDel.referal_code = [dict objectForKey:@"referal_code"];
             self->appDel.state_id = [dict objectForKey:@"state_id"];
             self->appDel.state_name = [dict objectForKey:@"state_name"];
             self->appDel.user_role = [dict objectForKey:@"user_role"];
             self->appDel.user_role_name = [dict objectForKey:@"user_role_name"];
             self->appDel.zip = [dict objectForKey:@"zip"];
             NSString *emailId = [dict objectForKey:@"email_id"];
             self->appDel.email_id = [[NSUserDefaults standardUserDefaults]objectForKey:@"statemail_id"];
             NSString *mobile_no = [dict objectForKey:@"mobile_no"];
             self->appDel.mobile_no = [[NSUserDefaults standardUserDefaults]objectForKey:@"statemobile_no"];
             NSString *userName = [dict objectForKey:@"user_name"];
             [[NSUserDefaults standardUserDefaults]setObject:userName forKey:@"statUser_Name"];
             self->appDel.user_name = [[NSUserDefaults standardUserDefaults]objectForKey:@"statUser_Name"];
             NSString *log_Type = @"";
             [[NSUserDefaults standardUserDefaults]setObject:log_Type forKey:@"login_type"];
             self->appDel.login_type = [[NSUserDefaults standardUserDefaults]objectForKey:@"login_type"];
             self->appDel.user_type = @"1";
             NSLog(@"%@",self->appDel.user_Id);
             [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"stat_user_type"];
             [[NSUserDefaults standardUserDefaults]setObject:emailId forKey:@"statemail_id"];
             [[NSUserDefaults standardUserDefaults]setObject:@"signIn" forKey:@"status"];
             [[NSUserDefaults standardUserDefaults]setObject:picture forKey:@"picture_Url"];
             [[NSUserDefaults standardUserDefaults]setObject:user_id forKey:@"stat_user_id"];
             [[NSUserDefaults standardUserDefaults]setObject:mobile_no forKey:@"statemobile_no"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.full_name forKey:@"statFull_Name"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.birth_date forKey:@"dob"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.occupation forKey:@"occupation"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.gender forKey:@"gender"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.address_line_1 forKey:@"addressLine"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.address_line_2 forKey:@"addressLineTwo"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.address_line_3 forKey:@"addressLineThree"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.country_name forKey:@"country"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.state_name forKey:@"state"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.city_name forKey:@"city"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.zip forKey:@"pincode"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.country_id forKey:@"country_id"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.state_id forKey:@"state_id"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.city_id forKey:@"city_id"];
             [[NSUserDefaults standardUserDefaults]setObject:self->appDel.newsletter_status forKey:@"new_Letter"];
             
             [self.tableView reloadData];
         }
         else
         {
//             UIAlertController *alert= [UIAlertController
//                                        alertControllerWithTitle:@"Heyla"
//                                        message:msg
//                                        preferredStyle:UIAlertControllerStyleAlert];
//
//             UIAlertAction *ok = [UIAlertAction
//                                  actionWithTitle:@"OK"
//                                  style:UIAlertActionStyleDefault
//                                  handler:^(UIAlertAction * action)
//                                  {
//
//                                  }];
//
//             [alert addAction:ok];
//             [self presentViewController:alert animated:YES completion:nil];
         }
     }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSLog(@"error: %@", error);
     }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return menuItems.count;
        }
            break;
            
        case 1:
        {
            return staticMenu.count;
        }
            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        NSString *CellIdentifier = [staticMenu objectAtIndex:indexPath.row];
        SideMenuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.userImageView.layer.cornerRadius = cell.userImageView.frame.size.width / 2;
        cell.userImageView.clipsToBounds = YES;
        appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        if ([appDel.user_type isEqualToString:@"2"])
        {
            cell.UserName.text = @"Guest User";
            cell.cityName.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"selected_city_prof"];
        }
        else
        {
            cell.UserName.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"statFull_Name"];
            cell.cityName.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"selected_city_prof"];
        }
        
        NSLog(@"%@",appDel.login_type);
        if ([appDel.login_type isEqualToString:@"FB"])
        {
            __weak SideMenuTableViewCell *weakCell = cell;
            UIImage *placeholderImage = [UIImage imageNamed:@"profile.png"];
            NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults]objectForKey:@"picture_Url"]]];
            [weakCell.userImageView setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image)
             {
//                 weakCell.userImageView.hidden = YES;
                 weakCell.userImageView.image = image;
                 weakCell.userImageView.layer.cornerRadius = cell.userImageView.frame.size.width / 2;
                 weakCell.userImageView.clipsToBounds = YES;
                 weakCell.userImageView.layer.borderWidth = 4.0f;
                 weakCell.userImageView.layer.borderColor = [UIColor whiteColor].CGColor;
                 [self scaleAndRotateImage:image];

                 UIGraphicsEndImageContext();
             } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                 
                 NSLog(@"%@",error);
                 
             }];
            
            
        }
        else
        {
            __weak SideMenuTableViewCell *weakCell = cell;
            UIImage *placeholderImage = [UIImage imageNamed:@"profile.png"];
            NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults]objectForKey:@"picture_Url"]]];
            [weakCell.userImageView setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image)
             {
 //                weakCell.userImageView.hidden = YES;
                 weakCell.userImageView.image = image;
                 weakCell.userImageView.layer.cornerRadius = cell.userImageView.frame.size.width / 2;
                 weakCell.userImageView.clipsToBounds = YES;
                 weakCell.userImageView.layer.borderWidth = 4.0f;
                 weakCell.userImageView.layer.borderColor = [UIColor whiteColor].CGColor;
                 [self scaleAndRotateImage:image];

                 UIGraphicsEndImageContext();
             } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                 
                 NSLog(@"%@",error);
                 
             }];
        }
        cell.profilePageBtn.tag = 0;
        [cell.profilePageBtn addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    else
    {
        NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
        SideMenuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        return cell;
    }
}
-(void)yourButtonClicked:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        if ([appDel.user_type isEqualToString:@"2"])
        {
            UIAlertController *alert= [UIAlertController
                                       alertControllerWithTitle:@"Heyla"
                                       message:@"Login to Access"
                                       preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                     [self presentViewController:loginViewController animated:NO completion:nil];
                                 }];
            
            UIAlertAction *cancel = [UIAlertAction
                                     actionWithTitle:@"Cancel"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         
                                     }];
            
            [alert addAction:ok];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self performSegueWithIdentifier:@"menu_profilePage" sender:self];
        }
    }
}
-(UIImage *)scaleAndRotateImage:(UIImage *)image
{
    // No-op if the orientation is already correct
    if (image.imageOrientation == UIImageOrientationUp) return image;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (indexPath.row == 0)
        {
            return 158;
        }
        else
        {
            return 50;

        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            return 158;
        }
        else
        {
            return 42;
        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideMenuMainViewController *sideMenuMainViewController = (SideMenuMainViewController *)self.sideMenuController;
    NSLog(@"%@",sideMenuMainViewController);
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if(indexPath.row == 1)
    {
        if ([appDel.user_type isEqualToString:@"2"])
        {
            UIAlertController *alert= [UIAlertController
                                       alertControllerWithTitle:@"Heyla"
                                       message:@"Login to Access"
                                       preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                     [self presentViewController:loginViewController animated:NO completion:nil];
                                 }];
            
            UIAlertAction *cancel = [UIAlertAction
                                     actionWithTitle:@"Cancel"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         
                                     }];
            
            [alert addAction:ok];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self performSegueWithIdentifier:@"bookingHistory" sender:self];
        }
    }
    else if(indexPath.row == 2)
    {
        
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"from_sideMenu"];
        [self performSegueWithIdentifier:@"preference" sender:self];
    }
    else if(indexPath.row == 3)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"from_sideMenu"];
        [self performSegueWithIdentifier:@"changeCity" sender:self];

    }
    else if(indexPath.row == 4)
    {
        if ([appDel.user_type isEqualToString:@"2"])
        {
            UIAlertController *alert= [UIAlertController
                                       alertControllerWithTitle:@"Heyla"
                                       message:@"Login to Access"
                                       preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                     [self presentViewController:loginViewController animated:NO completion:nil];
                                 }];
            
            UIAlertAction *cancel = [UIAlertAction
                                     actionWithTitle:@"Cancel"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         
                                     }];
            
            [alert addAction:ok];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self performSegueWithIdentifier:@"whishlist" sender:self];
        }
    }
//    else if(indexPath.row == 5)
//    {
//
//        appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        NSString *theMessage = [NSString stringWithFormat:@"Hey! Get the Heyla app and win some exciting rewards."];
//        NSString *strURL=[NSString stringWithFormat:@"https://itunes.apple.com/us/app/heyla/id1328232644?ls=1&mt=8"];
//        NSURL *urlReq = [NSURL URLWithString:strURL];
//        NSArray *items = @[theMessage,urlReq];
//
//        // build an activity view controller
//        UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
//
//        // and present it
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//
//        [self presentActivityController:controller];
//
//    }
    else if(indexPath.row == 6)
    {
        UIApplication *application = [UIApplication sharedApplication];
        NSURL *URL = [NSURL URLWithString:@"https://apps.apple.com/us/app/heyla/id1438601804?ls=1"];
        [application openURL:URL options:@{} completionHandler:^(BOOL success)
         {
             if (success)
             {
                 NSLog(@"Opened url");
             }
         }];
    }
    else if(indexPath.row == 7)
    {
        [self performSegueWithIdentifier:@"blogView" sender:self];
    }
    else if(indexPath.row == 8)
    {
        if ([appDel.user_type isEqualToString:@"2"])
        {
            UIAlertController *alert= [UIAlertController
                                       alertControllerWithTitle:@"Heyla"
                                       message:@"Login to Access"
                                       preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                     [self presentViewController:loginViewController animated:NO completion:nil];
                                 }];
            
            UIAlertAction *cancel = [UIAlertAction
                                     actionWithTitle:@"Cancel"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         
                                     }];
            
            [alert addAction:ok];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self performSegueWithIdentifier:@"settings" sender:self];
        }
    }
    else if (indexPath.row == 9)
    {
        [self performSegueWithIdentifier:@"userinfoSegue" sender:self];
    }
    else if (indexPath.row == 10)
    {
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Heyla"
                                   message:@"Do you really want to signout?"
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"YES"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
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
                                 [self performSegueWithIdentifier:@"signOut" sender:self];
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
}
- (void)presentActivityController:(UIActivityViewController *)controller
{
    [MBProgressHUD hideHUDForView:self.view animated:YES]; 
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
  
    // access the completion handler
    controller.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed)
        {
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }
        else
        {
            // user cancelled
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"We didn't want to share anything after all.");
        }
        if (error)
        {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)profileImageButton:(id)sender
{
    [self performSegueWithIdentifier:@"sidemenu_profile" sender:self];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}
- (IBAction)shareBtnOutlet:(id)sender
{
      appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
      NSString *theMessage = [NSString stringWithFormat:@"Hey! Get the Heyla app and win some exciting rewards."];
      NSString *strURL=[NSString stringWithFormat:@"https://itunes.apple.com/us/app/heyla/id1328232644?ls=1&mt=8"];
      NSURL *urlReq = [NSURL URLWithString:strURL];
      NSArray *items = @[theMessage,urlReq];
      
      // build an activity view controller
      UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
              
      // and present it
      [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
      {
          UIPopoverPresentationController *popController = [controller popoverPresentationController];
          popController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
          popController.sourceView = sender;
          popController.sourceRect = CGRectMake(105, 23, 0, 0);
      }
      else
      {
          UIPopoverPresentationController *popController = [controller popoverPresentationController];
          popController.sourceView = self.view;
      }
      
      [self presentActivityController:controller];
              
}
@end
