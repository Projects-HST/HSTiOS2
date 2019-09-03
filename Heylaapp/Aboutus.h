//
//  Aboutus.h
//  Heylaapp
//
//  Created by Happy Sanz Tech on 26/08/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Aboutus : UIViewController
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
