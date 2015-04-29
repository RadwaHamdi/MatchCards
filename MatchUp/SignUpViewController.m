//
//  SignUpViewController.m
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignInViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    isSigned= NO ;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]] ;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)signUp:(id)sender {
    NSMutableString* str = [[NSMutableString alloc] initWithString:@"http://jets.iti.gov.eg/FriendsApp/services/user/register?name="]  ;
    [str appendString:[self.name text]];
    [str appendString:@"&password="];
    [str appendString:[self.password text]];
    [str appendString:@"&age="];
    [str appendString:@""];
    [str appendString:@"&imageURL="];
    [str appendString:@""];
    [str appendString:@"&longitude="];
    [str appendString:@""];
    [str appendString:@"&latitude="];
    [str appendString:@""];
    
   // NSString* urlStr = [NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/register?name=%@&phone%@&age=%@&imageURL=%@&longitude=%@&latitude=%@" , [self.name text] ,[self.phone text] ,[self.age text] ,[self.imageName text] ,[self.longitude text] ,[self.latitude text]];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
    [connection start];

}
*/
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.asyncResponse = [NSMutableString new];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString* dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [self.asyncResponse appendString:dataStr];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSDictionary* parsedObj = [NSJSONSerialization JSONObjectWithData:[self.asyncResponse dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    NSString* status = [parsedObj valueForKey:@"status"];
    if ([status isEqualToString:@"SUCCESS"]) {
        isSigned = YES ;
        [self performSegueWithIdentifier:@"signUp" sender:self];
        //SignInViewController* signin = [SignInViewController new];
        //[self presentViewController:signin animated:YES completion:nil];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Fail!" message:@"This user is exist!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", @"Try Again" , nil];
        [alert show];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==1) {
        [self.name setText:@""];
        [self.password setText:@""];
        [self.confirmPass setText:@""];
        
    }

}

/*
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"signUp"]) {
        
        return isSigned ;
    }
    else {
        return YES ;
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"signUp"]) {
         //SignInViewController* signin = (SignInViewController*) segue.destinationViewController;
        //[signin setm];
    }
    else {
        
    }
}

-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
}

*/

- (IBAction)signingUp:(id)sender {
    if ([self.password.text isEqualToString:self.confirmPass.text]) {
        NSMutableString* str = [[NSMutableString alloc] initWithString:@"http://10.145.18.57:8084/IOSGameServer/SignUp?name="]  ;
        [str appendString:[self.name text]];
        [str appendString:@"&password="];
        [str appendString:[self.password text]];
    
    
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
        [connection start];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Fail!" message:@"Passwords don't match!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", @"Try Again" , nil];
        [alert show];
    }
}
@end
