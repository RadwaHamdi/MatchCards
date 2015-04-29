//
//  HomeViewController.m
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]] ;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)play:(id)sender {
}

- (IBAction)setting:(id)sender {
}
- (IBAction)showRatings:(id)sender {
}

- (IBAction)logout:(id)sender {
}*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"logout"]) {
        
        NSUserDefaults* saving = [NSUserDefaults standardUserDefaults];
        [saving setBool:NO forKey:@"logged"];
        [saving setObject:nil forKey:@"name"];
        [saving setObject:nil forKey:@"password"];
        [saving setObject:nil forKey:@"score"];
        [saving setObject:nil forKey:@"image"];

    }
}
@end
