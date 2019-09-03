//
//  UserInfo.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 29/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *descripitionLabel;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
- (IBAction)nextAction:(id)sender;
- (IBAction)skipAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UIButton *nextOutlet;
@property (weak, nonatomic) IBOutlet UIButton *skipOutlet;

@end

NS_ASSUME_NONNULL_END
