//
//  Aboutus.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 26/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import "Aboutus.h"
#import "Settings.h"


@interface Aboutus ()

@end

@implementation Aboutus

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
//    NSString *selectedView = [[NSUserDefaults standardUserDefaults]objectForKey:@"selectView"];
//    if ([selectedView isEqualToString:@"About Us"])
//    {
//        self.title = @"About Us";
//        NSURL *url = [NSURL URLWithString:@"https://heylaapp.com/about-us"];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [_webView loadRequest:requestObj];
//    }
//    else if ([selectedView isEqualToString:@"Privacy Policy"])
//    {
//        self.title = @"Privacy Policy";
//        NSURL *url = [NSURL URLWithString:@"https://heylaapp.com/privacy"];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [_webView loadRequest:requestObj];
//    }
//    else if ([selectedView isEqualToString:@"Payment Policy"])
//    {
//        self.title = @"Payment Policy";
//        NSURL *url = [NSURL URLWithString:@"https://heylaapp.com/payment"];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [_webView loadRequest:requestObj];
//    }
//    else if ([selectedView isEqualToString:@"Terms and Condition"])
//    {
//        self.title = @"Terms and Condition";
//        NSURL *url = [NSURL URLWithString:@"https://heylaapp.com/terms"];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [_webView loadRequest:requestObj];
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
