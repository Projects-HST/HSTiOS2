//
//  SignUpWelcomeViewController.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 28/09/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import "SignUpWelcomeViewController.h"

@interface SignUpWelcomeViewController ()

@end

@implementation SignUpWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.getStartedOutlet.layer.cornerRadius = 3.0;
    self.getStartedOutlet.clipsToBounds = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getStartedButon:(id)sender
{
    [self performSegueWithIdentifier:@"welcometoProfile" sender:self];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}
@end
