//
//  ProfileViewController.h
//  MatchUp
//
//  Created by JETS on 4/6/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate , NSURLConnectionDataDelegate , NSURLConnectionDelegate , UIAlertViewDelegate  >

{
    NSURLConnection* connection;
    NSString* oldName ;
    NSString* name ;
    NSString* image ;
    NSString* imgPath ;
}
@property NSMutableString* asyncResponse ;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)changeImage:(id)sender;
- (IBAction)editName:(id)sender;
- (IBAction)save:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@end
