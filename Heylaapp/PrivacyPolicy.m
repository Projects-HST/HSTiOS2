//
//  PrivacyPolicy.m
//  Heylaapp
//
//  Created by Happy Sanz Tech on 27/11/19.
//  Copyright © 2019 Palpro Tech. All rights reserved.
//

#import "PrivacyPolicy.h"

@interface PrivacyPolicy ()
{
    
    /*About Us Policy Data */
    
    NSArray *aboutUsHeaderText;
    NSArray *aboutUsDescripitionText;
    
    /*Privacy Policy Data */
    
    NSArray *privacyPolicyHeaderText;
    NSArray *privacyPolicyDescripitionText;
    
    /*Payment Policy Data */
       
    NSArray *paymentPolicyHeaderText;
    NSArray *paymentPolicyDescripitionText;
       
    /*Terms and Condition Data */
    
    NSArray *termsHeaderText;
    NSArray *termsDescripitionText;
    
}

@end


@implementation PrivacyPolicy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    NSString *str =  [[NSUserDefaults standardUserDefaults]objectForKey:@"policys"];

    if ([str isEqualToString:@"privacypolicy"])
       {
           self.navigationItem.title = @"Privacy Policy";
       }
       else if([str isEqualToString:@"paymentpolicy"])
       {
          self.navigationItem.title = @"Payment Policy";
       }
       else if ([str isEqualToString:@"aboutus"])
       {
          self.navigationItem.title = @"About Us";
       }
       else
       {
           self.navigationItem.title = @"Terms and Condition";
       }
    
     /*About Us Policy Data */
    
    aboutUsHeaderText = @[@"About Heyla",@"Want to know what’s happening in Singapore?",@"For organizers",@"For users"];
    
    aboutUsDescripitionText = @[@"Heyla is an encyclopaedia of “What, When and Where” for the world of events, from entertainment, shopping, sports, dining, travelling, business, and many more. You can organize events or attend them, or choose to do both.Heyla acts as a connecting link between event organizers and event seekers. It is your gateway in your pocket to the world outside, waiting to be explored, shared and enjoyed. Know what buzzing events are happening in Singapore today.",
                                @"There’s always something happening in the Little Red Dot. The question is, “are you ready to step out and make a memory”?  We got determined to step in, after learning that there is a huge gap between event organizers and event seekers. Heyla is that bridge. It’s a conduit between organizers and general public.",@"By becoming an event organizer, you can create or organize any type of event such as entertainment, business meets, family gatherings, travellers, casual or formal meet-ups, and many more. The organizer\'s imagination is the limit. Get in touch with us  to know more.",@"Whether you’re an individual or with a group of buddies, local or travelling, Heyla satisfies your event hunting like never before.You can find events of your choice within a few clicks. Whether it’s nearby or around the city-state you can expect events that keep you engaged at any given time.You can take a look at our ‘Map View’ of the events, to choose them location wise. Make sure to check out ‘Hotspots’ or ‘Popular’ events to explore the most happening places.But the best way to know is by simply exploring the app.Download the app now to discover the world of entertainment, knowledge and networking."];
    
    /*Privacy Policy Data */

    privacyPolicyHeaderText = @[@"Introduction to the Privacy Policy",@"The Website & App",@"Email Newsletter",@"Use of Cookies",@"External Links",@"Social Media Platforms",@"Shortened Links in Social Media",@"Updates to this policy"];
    
    privacyPolicyDescripitionText = @[@"This privacy policy is for the website heyla application, and served by HeylaApp and governs the privacy of its users who choose to use it. The policy sets out the different areas where user privacy is concerned. It outlines the obligations and requirements of the users, the app, the website and website owners. Furthermore, the way it processes, stores and protects user data and information will also be detailed within this policy.",
        @"This Website and the App take a proactive approach to users’ privacy and ensures that the necessary steps are taken to protect the privacy of its users throughout their visiting experience.",
        @"We collect information directly from you when you register for an event or buy tickets. We also collect information if you post a comment on our app, website or social media pages or ask us a question through phone or email. We also collect information about you through third parties. If you use, Facebook &amp; Gmail to login then we obtain information about you through the third party sites.\nWhenever you use our app/website, we will detect your location to customize the events based on your location. This information will remain discrete with us. Your location information will be collected only if you enable your location services. We may collect demographic information about you, events you like, events you intend to participate in, tickets you buy, or any other information provided by you during the use of our app/website. For the users who register for an event through our app, we will collect basic attendees details required for registration / booking and this will be shared with the organizers of the event. For users who book tickets through us, we will process your payments through  one97 Communication Limited. Please visit http://www.one97.com/payments.php to know about their privacy policy. We will not ask for any banking details on our app/website.",
        @"This website/app operates an email newsletter program that is used to inform subscribers about new events added on this website/app. Users can subscribe through an online automated process if they wish to do so but at their own discretion. Email marketing campaigns published by this website/app or its owners may contain tracking facilities within the actual email. Subscriber activity is tracked and stored in a database for future analysis and evaluation. Such tracked activity may include; the opening and forwarding of emails, the clicking of links within the email content, time, dates and frequency of activity. This information is used to refine future email campaigns and supply the users with more relevant content based around their activity.",
        @"This website uses cookies to better the user experience while visiting the website. Wherever applicable, this website uses a cookie control system, enabling the users on their visit to the website, to allow or disallow the use of cookies on their computer/device. This complies with recent legislation requirements for websites to obtain explicit consent from users before leaving behind or reading files such as cookies on a user’s computer/device. Cookies are small files saved to the user computer’s hard drive, or devices that track, save and store information about the user interactions and usage of the website. This allows the website, through its server to provide the users with a tailored experience within this website. Users are advised that if they wish to deny the use and saving of cookies from this website onto their computer\'s hard drive, they should take the necessary steps within their web browser\'s security settings to block all cookies from this website and its external serving vendors. Other cookies may be stored on your computer’s hard drive by external vendors when this website uses referral programs, sponsored links or adverts. Such cookies are used for the conversion and referral tracking. No personal information is stored, saved or collected.",
        @"Although this website/App only looks to include quality, safe and relevant external links, users should always adopt a policy of caution before clicking on any external web links mentioned anywhere in this website/App. The owners of this website/App cannot guarantee or verify the contents of any externally linked website despite their best efforts. Users should therefore note that, they click on external links at their own risk and this website/App and its owners cannot be held liable for any damages or implications caused by visiting any external links mentioned.",
        @"Any communication, engagement or action taken by the website or the App through an external social media platform are in custom to the terms and conditions, and privacy policies held with each social media platform. Users are advised to use social media platforms wisely and communicate or engage upon them with due care and caution in regard to their own privacy and personal details. The Website or the App will never ask for personal or sensitive information through any social media platform. It encourages the users who wish to discuss sensitive details, to contact them through primary communication channels, such as, by telephone or email. This Website or the App may use social sharing buttons, which help to share web content directly from web pages to the respective social media platform. Users are advised before using the social sharing buttons that, they do it at their own discretion, and also note that the social media platform may track and save your request to share a web page respectively through your social media platform account.",
        @"The website and the App may share links to relevant pages on their social media accounts. Some social media platforms, by default, shorten the length of the URL’s. Users are advised to take caution before clicking on the shortened URLs published on social media platforms by this website or the App. Team Heyla will put all efforts to ensure only genuine URL’s are published, but many social media platforms are prone to spam as well as hacking. Thus, the website, the App or it\'s owners cannot be held liable for any damage or implication caused by visiting any shortened URL’s.",@"This Privacy Policy was last updated on 08.09.2018. From time to time we may change or make additions to our privacy policy. We will notify you of any material changes to this policy as required by law. We will also post an updated copy on our website and during App updates."];
    
    /*Payment Policy Data */
    
    paymentPolicyHeaderText = @[@"Payment Policy",@"General Pricing",@"Heyla Event Service Charge    : 2% ",@"Payment Gateway Charge      : 1.99% ",@"Total : 4.71% (Total 3.99% +18%GST)",@"Payment Confirmation",@"Refund / Cancellation / Exchanges",@"Customer Care",@"Changes on Pricing"];
    
    paymentPolicyDescripitionText = @[@"Heyla accepts Visa, MasterCard, American Express, selected Credit &amp; Debit Cards and Net Banking. Other payment methods may be added from time to time. We process our payments through one97 Communication Limited. Users are subject to internet-handling fees and a non-refundable, processing fees per ticket.\nHeyla acts as an agent to promote the events and sell tickets on behalf of the event organizers. We do not hold any control on the availability and pricing of the tickets.",
        @"",@"",@"", @"\nEx: Your event ticket is 100. Final payout after deduction of payment gateway fee + taxes = (100 x 4.71) / 100 = INR 95.29 \nNote: Payments would be processed in 3-5 working days after the completion of the event",
        @"Once your payment is successful, you will be directed to the confirmation page which will contain all the details regarding your order. You will also receive a text message and email regarding your order confirmation. If you do not receive a confirmation or experience an error during payments, contact the customer care regarding your order. We are not liable for your losses if you do not contact us regarding your issue faced during booking.",
        @"Once the payment is made and the booking is confirmed, you cannot make any changes in the order. Kindly read the details of the event and eligibility before making the booking. We are not liable to make any refund for tickets purchased.\nIf the event gets cancelled by the organizers of the event, we will refund the amount as per the policy of the organizer. If in case the organizer changes the event date, we will contact you and proceed as per the policy of the organizer.\nHeyla App may, in its discretion, attempt to mediate such dispute, however, we will have no liability for an Organizer’s failure to give refunds, our failure to mediate a dispute; or our decision if it does mediate the dispute.",
        @"If there are any queries regarding your order, you can get in touch with us at <a href= mailto:hello@heylaapp.sg>hello@heylaapp.sg </a> / 9443471551. We assure you a response within one business day.",
        @"This Pricing Policy was last updated on 08.09.2018. From time to time we may change or make additions to our Pricing Policy. We will notify you of any material changes to this policy as required by law. We will also post an updated copy on our website and during app updates."];
    
    /*Terms and Condition Data */
    
    termsHeaderText = @[@"Acceptance of Terms",@"Privacy Policy",@"Services",@"Restrictions on use",@"Changes on Terms &amp; Conditions",@"Contact Us"];
    
    termsDescripitionText = @[@"The HeylaApp is a one stop platform for all your event needs, which is owned and operated by Happy Sanz Tech. #28, Bukit Pasoh Road, Singapore 089842.\n\nThrough our platforms, mobile apps and website, Heyla enables its users to view and share events and book tickets for events in  Singapore. This User Agreement (Agreement) sets out the terms and conditions on which Heyla will provide the services to the User through its Website and App.\n\nThe usage of the Website/App is offered to users conditioned on acceptance without modification, of all the terms, conditions and notices contained in this Agreement, as may be posted on the Website/App from time to time. For the removal of doubts, it is clarified that the use of the Website/App by the User constitutes an acknowledgement and acceptance by the User of this Agreement.\n\nHeylaApp reserves the right to change the terms &amp; conditions and notices under which the Services are offered through Website/ App, including but not limited to the Services provided through the Website/App. The User shall be responsible for regularly reviewing these terms and conditions.",
        @"The User hereby consents, expresses and agrees that he/she has read and fully understood the Privacy Policy of Helya in respect to the website/app. The User further confirms that the terms and contents of such Privacy Policy are acceptable to him/her.",
        @"Users are entitled to make use of the services including viewing, and sharing of events. Heyla also lets users book their tickets or register for events through the app. Heyla reserves the right to modify the nature of its services. It also lets the organizers to post their events.\n\nIf the users are booking their tickets through our platform, they hereby consent, express and agree that they have read and fully understood the Pricing Policy of Heyla in respect to the website/app. The User further confirms that the terms of such Pricing Policy are acceptable to him/her.",
        @"Your use of the website/app is restricted to viewing information of events, booking tickets, giving suggestions or raising queries or complaints. To protect our website, app and other users, we reserve all the rights to delete any content from the website/app. We also reserve the right to restrict the access of the website/app to certain users.",
        @"These terms &amp; conditions were last updated on 08.09.2018. From time to time we may change or make additions to our terms &amp; Conditions. We will notify you of any material changes to this policy as required by law. We will also post an updated copy on our website and during app updates.",
        @"If there is any query regarding the terms &amp; conditions, you may contact us at hello@heylaapp.sg / +91 9443471551"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *str =  [[NSUserDefaults standardUserDefaults]objectForKey:@"policys"];
    
    if ([str isEqualToString:@"privacypolicy"])
    {
        return privacyPolicyHeaderText.count;
    }
    else if([str isEqualToString:@"paymentpolicy"])
    {
        return paymentPolicyHeaderText.count;
    }
    else if ([str isEqualToString:@"aboutus"])
    {
        return aboutUsHeaderText.count;
    }
    else
    {
        return termsHeaderText.count;
    }
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    PrivacyPolicyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *str =  [[NSUserDefaults standardUserDefaults]objectForKey:@"policys"];
       
       if ([str isEqualToString:@"privacypolicy"])
       {
           cell.headerLabel.text = [privacyPolicyHeaderText objectAtIndex:indexPath.row];
           cell.descripitionLabel.text = [privacyPolicyDescripitionText objectAtIndex:indexPath.row];
       }
       else if([str isEqualToString:@"paymentpolicy"])
       {
           cell.headerLabel.text = [paymentPolicyHeaderText objectAtIndex:indexPath.row];
           cell.descripitionLabel.text = [paymentPolicyDescripitionText objectAtIndex:indexPath.row];
       }
       else if ([str isEqualToString:@"aboutus"])
       {
            cell.headerLabel.text = [aboutUsHeaderText objectAtIndex:indexPath.row];
            cell.descripitionLabel.text = [aboutUsDescripitionText objectAtIndex:indexPath.row];
       }
       else
       {
          cell.headerLabel.text = [termsHeaderText objectAtIndex:indexPath.row];
          cell.descripitionLabel.text = [termsDescripitionText objectAtIndex:indexPath.row];
       }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 119.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}

- (IBAction)backAction:(id)sender
{
   [self dismissViewControllerAnimated:YES completion:nil];
}
@end
