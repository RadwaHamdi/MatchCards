//
//  SignInViewController.m
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
        //NSString * savedName = [check objectForKey:@"name"];
        //NSString * savedPassword = [check objectForKey:@"password"];
        //if( ![savedName isEqualToString:nil ] && ![savedPassword isEqualToString:nil ]) {
        if( [check boolForKey:@"logged"]) {
            [self performSegueWithIdentifier:@"signIn" sender:self];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]] ;
}
-(void)viewDidAppear:(BOOL)animated {
    /*
    NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
    if( [check boolForKey:@"logged"]) {
        [self performSegueWithIdentifier:@"signIn" sender:self];
    }
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goSignUp" ]) {
        
    }
}

- (IBAction)signingIn:(id)sender {
    NSMutableString* str = [[NSMutableString alloc] initWithString:@"http://10.145.18.57:8084/IOSGameServer/SignIn?name="]  ;
    [str appendString:[self.name text]];
    [str appendString:@"&password="];
    [str appendString:[self.password text]];
    
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
    [connection start];
}

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
        NSString* name = [parsedObj valueForKey:@"name"];
        NSString* pass = [parsedObj valueForKey:@"password"];
        NSString* score = [parsedObj valueForKey:@"score"];
        NSString* image = [parsedObj valueForKey:@"image"];
        
        NSUserDefaults* saving = [NSUserDefaults standardUserDefaults];
        [saving setBool:YES forKey:@"logged"];
        [saving setObject:name forKey:@"name"];
        [saving setObject:pass forKey:@"password"];
        [saving setObject:score forKey:@"score"];
        [saving setObject:image forKey:@"image"];
        [saving setBool:YES forKey:@"sound"];
        
        //NSDictionary* parsedUser = [parsedObj valueForKey:@"user"];
        //printf([[parsedUser valueForKey:@"name"] UTF8String]);
        
        [self performSegueWithIdentifier:@"signIn" sender:self];
        
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Fail!" message:@"Sign in failed!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", @"Try Again" , nil];
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
        
        
    }
    
}



@end
