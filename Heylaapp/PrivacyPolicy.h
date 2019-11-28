//
//  PrivacyPolicy.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 27/11/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PrivacyPolicy : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
