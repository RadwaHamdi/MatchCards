//
//  SettingsViewController.m
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    NSUserDefaults* check1 = [NSUserDefaults standardUserDefaults];
    if( [check1 boolForKey:@"sound"]) {
        self.sounds.on = YES;
        self.soundLabel.text = @"Enabled" ;
    } else {
        self.sounds.on = NO;
        self.soundLabel.text = @"Disabled" ;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)soundSlider:(id)sender {
    NSUserDefaults* saving = [NSUserDefaults standardUserDefaults];
    [saving setBool:self.sounds.isOn forKey:@"sound"];
    NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
    if( [check boolForKey:@"sound"]) {
        self.soundLabel.text = @"Enabled" ;
    } else {
        self.soundLabel.text = @"Disabled" ;
    }
}
@end
