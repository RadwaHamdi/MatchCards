//
//  SettingsViewController.h
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

- (IBAction)soundSlider:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *sounds;
@property (strong, nonatomic) IBOutlet UILabel *soundLabel;

@end
