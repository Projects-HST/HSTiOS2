//
//  Settings.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 13/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Settings : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;
- (IBAction)switchAction:(id)sender;
- (IBAction)backAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
