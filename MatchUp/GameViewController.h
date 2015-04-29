//
//  GameViewController.h
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <AudioToolbox/AudioToolbox.h>

@interface GameViewController : UIViewController < NSURLConnectionDataDelegate , NSURLConnectionDelegate , UIAlertViewDelegate  >



{
    
    NSArray *imageNames;
    NSInteger btnTags [16];
    NSInteger btnSelected [16];
    NSInteger btnTagsCounter[8];
    int x,y;
    int count;
    int flag;
    int tagFirst ;
    int tagSecond ;
    int timeSec;
    int timeMin;
    NSTimer *timer;
    int score;
    int trials;
    int matched;
    
    ////server connect
    NSURLConnection* connection;
}
////server connect
@property NSMutableString* asyncResponse ;

@property (weak, nonatomic) IBOutlet UILabel *labelTimer;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelMatched;
@property (weak, nonatomic) IBOutlet UILabel *labelTrials;


@property (weak, nonatomic) IBOutlet UIButton *btnFirst;
- (IBAction)ButtonsClicked:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnSecond;
@property (weak, nonatomic) IBOutlet UIButton *btnThird;
@property (weak, nonatomic) IBOutlet UIButton *btnFourth;
@property (weak, nonatomic) IBOutlet UIButton *btnFifth;
@property (weak, nonatomic) IBOutlet UIButton *btnSixth;
@property (weak, nonatomic) IBOutlet UIButton *btnSeventh;
@property (weak, nonatomic) IBOutlet UIButton *btnEightth;
@property (weak, nonatomic) IBOutlet UIButton *btnNineth;
@property (weak, nonatomic) IBOutlet UIButton *btnTenth;
@property (weak, nonatomic) IBOutlet UIButton *btnEleventh;
@property (weak, nonatomic) IBOutlet UIButton *btnTwelveth;
@property (weak, nonatomic) IBOutlet UIButton *btnThirteenth;
@property (weak, nonatomic) IBOutlet UIButton *btnFourteenth;
@property (weak, nonatomic) IBOutlet UIButton *btnFifteenth;
@property (weak, nonatomic) IBOutlet UIButton *btnSixteenth;

-(void) flipCardsBack;
- (void)timerTick:(NSTimer *)timer ;
- (void) StopTimer ;
-(void) showAlert;

@end
