//
//  Notification.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 29/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Notification : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
