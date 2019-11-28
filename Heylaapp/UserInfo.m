//
//  UserInfo.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 29/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo ()
{
    NSString *isNextButtonClicked;
}
@end

@implementation UserInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->isNextButtonClicked = @"0";
    self.skipOutlet.hidden = NO;
    _previousOutlet.enabled = NO;
    _previousOutlet.alpha = 0.5;

}

-(void)viewWillAppear:(BOOL)animated
{
    self.headingLabel.text = @"Events that you like";
    self.descripitionLabel.text = @"Here we list the events based on your preferences. And you can change your preferences anytime.";
    self.bgImgView.image = [UIImage imageNamed:@"user_guide_1.jpg"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextAction:(id)sender
{
    if ([self->isNextButtonClicked isEqualToString:@"0"])
    {
        self.headingLabel.text = @"Events that are in trend";
        self.descripitionLabel.text = @"Popular events are those viewed by most";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_2.jpg"];
        self->isNextButtonClicked = @"1";
        _previousOutlet.enabled = YES;
        _previousOutlet.alpha = 1.0;
    }
    else if ([self->isNextButtonClicked isEqualToString:@"1"])
    {
        self.headingLabel.text = @"Everything around you goes in here!";
        self.descripitionLabel.text = @"All events nearby your chosen location are listed here";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_3.jpg"];
        self->isNextButtonClicked = @"2";
        
    }
    else if ([self->isNextButtonClicked isEqualToString:@"2"])
    {
        self.headingLabel.text = @"Places that bustle!";
        self.descripitionLabel.text = @"Hotspots lists the most popular and exciting areas in Singapore";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_4.jpg"];
        self->isNextButtonClicked = @"3";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"3"])
    {
        self.headingLabel.text = @"The board of bonus!";
        self.descripitionLabel.text = @"Leaderboard lists Heyla users with the most bonus points earned through various activities";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_5.jpg"];
        self->isNextButtonClicked = @"4";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"4"])
    {
       
        self.headingLabel.text = @"All you need is beside here";
        self.descripitionLabel.text = @"Side menu boasts some of the app's important features";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_6.jpg"];
        self->isNextButtonClicked = @"5";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"5"])
    {
        self.headingLabel.text = @"No need to scroll down";
        self.descripitionLabel.text = @"Search for events by their names";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_7.jpg"];
        self->isNextButtonClicked = @"6";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"6"])
    {
        self.headingLabel.text = @"Get what you're exactly looking for!";
        self.descripitionLabel.text = @"Advance Search enables you to narrow your search results";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_8.jpg"];
        self->isNextButtonClicked = @"7";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"7"])
    {
        self.headingLabel.text = @"Events in your radius";
        self.descripitionLabel.text = @"You can find events within a radius of your choice. Map View gives you a broader perspective of your location";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_9.jpg"];
        self->isNextButtonClicked = @"8";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"8"])
    {
        [self.nextOutlet setTitle:@"FINISH" forState:UIControlStateNormal];
        self.headingLabel.text = @"Click it to view it";
        self.skipOutlet.hidden = YES;
        self.descripitionLabel.text = @"Clicking on an event will give you its details";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_10.jpg"];
        self->isNextButtonClicked = @"9";
    }
    else if ([self->isNextButtonClicked isEqualToString:@"9"])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)skipAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)previousAction:(id)sender
{
        if ([self->isNextButtonClicked isEqualToString:@"1"])
    {
        self.headingLabel.text = @"Events that you like";
        self.descripitionLabel.text = @"Here we list the events based on your preferences. And you can change your preferences anytime.";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_1.jpg"];
        self->isNextButtonClicked = @"0";
        _previousOutlet.enabled = NO;
        _previousOutlet.alpha = 0.5;
         self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"2"])
    {
         self.headingLabel.text = @"Events that are in trend";
         self.descripitionLabel.text = @"Popular events are those viewed by most";
         self.bgImgView.image = [UIImage imageNamed:@"user_guide_2.jpg"];
         self->isNextButtonClicked = @"1";
         _previousOutlet.enabled = YES;
         _previousOutlet.alpha = 1.0;
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];


        
    }
    else if ([self->isNextButtonClicked isEqualToString:@"3"])
    {
        self.headingLabel.text = @"Everything around you goes in here!";
        self.descripitionLabel.text = @"All events nearby your chosen location are listed here";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_3.jpg"];
        self->isNextButtonClicked = @"2";
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"4"])
    {
        self.headingLabel.text = @"Places that bustle!";
        self.descripitionLabel.text = @"Hotspots lists the most popular and exciting areas in Singapore";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_4.jpg"];
        self->isNextButtonClicked = @"3";
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"5"])
    {
       self.headingLabel.text = @"The board of bonus!";
       self.descripitionLabel.text = @"Leaderboard lists Heyla users with the most bonus points earned through various activities";
       self.bgImgView.image = [UIImage imageNamed:@"user_guide_5.jpg"];
       self->isNextButtonClicked = @"4";
       self.skipOutlet.hidden = NO;
       [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"6"])
    {
        self.headingLabel.text = @"All you need is beside here";
        self.descripitionLabel.text = @"Side menu boasts some of the app's important features";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_6.jpg"];
        self->isNextButtonClicked = @"5";
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"7"])
    {
        self.headingLabel.text = @"No need to scroll down";
        self.descripitionLabel.text = @"Search for events by their names";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_7.jpg"];
        self->isNextButtonClicked = @"6";
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"8"])
    {
        self.headingLabel.text = @"Get what you're exactly looking for!";
        self.descripitionLabel.text = @"Advance Search enables you to narrow your search results";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_8.jpg"];
        self->isNextButtonClicked = @"7";
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
    else if ([self->isNextButtonClicked isEqualToString:@"9"])
    {
        self.headingLabel.text = @"Events in your radius";
        self.descripitionLabel.text = @"You can find events within a radius of your choice. Map View gives you a broader perspective of your location";
        self.bgImgView.image = [UIImage imageNamed:@"user_guide_9.jpg"];
        self->isNextButtonClicked = @"8";
        self.skipOutlet.hidden = NO;
        [self.nextOutlet setTitle:@"NEXT" forState:UIControlStateNormal];

    }
}
@end
