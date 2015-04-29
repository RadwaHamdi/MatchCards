//
//  SignUpViewController.h
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <NSURLConnectionDataDelegate , NSURLConnectionDelegate , UIAlertViewDelegate  >

{
    NSURLConnection* connection;
    BOOL isSigned ;
}
 @property NSMutableString* asyncResponse ;
 
//- (IBAction)signUp:(id)sender;
 
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *confirmPass;

- (IBAction)signingUp:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *signUpButton;


@end
