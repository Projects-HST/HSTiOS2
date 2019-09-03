//
//  Notification.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 29/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import "Notification.h"

@interface Notification ()
{
    AppDelegate *appDel;
    NSArray *notificationArr;
    NSMutableArray *createdateArr;
    NSMutableArray *templateContentArr;
    NSMutableArray *templateNameArr;
    NSMutableArray *templatePicArr;
    NSMutableArray *viewStatusArr;
}
@end

@implementation Notification

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    createdateArr = [[NSMutableArray alloc]init];
    templateContentArr = [[NSMutableArray alloc]init];
    templateNameArr = [[NSMutableArray alloc]init];
    templatePicArr = [[NSMutableArray alloc]init];
    viewStatusArr = [[NSMutableArray alloc]init];
    [self webRequestForNotificationList];
}

-(void)webRequestForNotificationList
{
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:appDel.user_Id forKey:@"user_id"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *getEventcities = @"apimain/view_notification";
    NSArray *components = [NSArray arrayWithObjects:baseUrl,getEventcities, nil];
    NSString *api = [NSString pathWithComponents:components];
    
    [manager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         NSLog(@"%@",responseObject);
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         NSString *msg = [responseObject objectForKey:@"msg"];
         NSString *status = [responseObject objectForKey:@"status"];
         
         if ([msg isEqualToString:@"View Notification"] && [status isEqualToString:@"success"])
         {
             self->notificationArr = [responseObject objectForKey:@"Notification"];
             
             [self->createdateArr removeAllObjects];
             [self->templateContentArr removeAllObjects];
             [self->templateNameArr removeAllObjects];
             [self->templatePicArr removeAllObjects];
             [self->viewStatusArr removeAllObjects];
             
             for (int i =0; i < [self->notificationArr count]; i++)
             {
                 NSDictionary *notification = [self->notificationArr objectAtIndex:i];
                 NSString * created_at = [notification objectForKey:@"created_at"];
                 NSString * template_content = [notification objectForKey:@"template_content"];
                 NSString * template_name = [notification objectForKey:@"template_name"];
                 NSString * template_pic = [notification objectForKey:@"template_pic"];
                 NSString * view_status = [notification objectForKey:@"view_status"];
                 
                 [self->createdateArr addObject:created_at];
                 [self->templateContentArr addObject:template_content];
                 [self->templateNameArr addObject:template_name];
                 [self->templatePicArr addObject:template_pic];
                 [self->viewStatusArr addObject:view_status];

             }
             
             [self.tableView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NotificationCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.date.text = [createdateArr objectAtIndex:indexPath.row];
    cell.eventNameLabel.text = [templateNameArr objectAtIndex:indexPath.row];
    cell.eventdescripitionLabel.text = [templateContentArr objectAtIndex:indexPath.row];
    NSString *imgUrl = [templatePicArr objectAtIndex:indexPath.row];
    
    if ([imgUrl isEqualToString:@""])
    {
        cell.imgBgView.hidden = YES;
        cell.imgViewHeight.constant = 0.0f;
    }
    else
    {
        cell.imgBgView.hidden = NO;
        cell.imgViewHeight.constant = 145.0;
        __weak NotificationCell *weakCell = cell;
        UIImage *placeholderImage = [UIImage imageNamed:@""];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:imgUrl]];
        [cell.imgView setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image)
         {
             weakCell.imgView.image = image;
             
         } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
             
             NSLog(@"%@",error);
             
         }];
    }

    cell.cellView.layer.cornerRadius = 5.0;
    cell.cellView.layer.borderColor = [UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor;
    cell.cellView.layer.borderWidth = 0.5;
    cell.cellView.clipsToBounds = YES;
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return notificationArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 302.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
