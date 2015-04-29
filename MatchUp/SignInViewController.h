//
//  SignInViewController.h
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController < NSURLConnectionDataDelegate , NSURLConnectionDelegate , UIAlertViewDelegate  >

{
    NSURLConnection* connection;
}
@property NSMutableString* asyncResponse ;


@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *password;

- (IBAction)signingIn:(id)sender;

@end
