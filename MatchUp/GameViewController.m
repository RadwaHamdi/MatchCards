//
//  GameViewController.m
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

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
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]] ;
    count =0;
    tagFirst = 17;
    tagSecond = 17;
    imageNames = [[NSArray alloc] initWithObjects:@"cats.jpg",@"elephant.jpg",@"kangro.jpg",@"ketty.jpg",@"rat.jpg",@"orangecat.jpg",@"penguin.jpg",@"cat.jpg", nil];
    score = 0;
    trials = 0;
    matched = 0;
    
    
    for (int i=0; i<16; i++) {
        btnTags[i] = 0;
    }
    
    
    for (int i=0; i<8; i++) {
        btnTagsCounter [i] = 0;
    }
    
    
    
    for (int i=0; i< 16; i++) {
        int random = arc4random()%8;
        if (btnTagsCounter[random] >=2) {
            i--;
            continue;
        }
        btnTagsCounter[random]++;
        btnTags[i] = random;
        //   printf("%d  ",random);
    }
        timeSec = 0;
        timeMin = 0;
        _labelScore.text = [NSString stringWithFormat:@"%d", score];
        _labelTrials.text = [NSString stringWithFormat:@"%d", trials];
        _labelMatched.text = [NSString stringWithFormat:@"%d", matched];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
        // [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        
        
        
    
}

//Event called every time the NSTimer ticks.
- (void)timerTick:(NSTimer *)timer
{
    timeSec++;
    if (timeSec == 60)
    {
        timeSec = 0;
        timeMin++;
    }
    //Format the string 00:00
    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
    //Display on your label
    //[timeLabel setStringValue:timeNow];
    _labelTimer.text= timeNow;
}

//Call this to stop the timer event(could use as a 'Pause' or 'Reset')
- (void) StopTimer
{
    [timer invalidate];
    
    //Since we reset here, and timerTick won't update your label again, we need to refresh it again.
    //Format the string in 00:00
    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
    //Display on your label
    // [timeLabel setStringValue:timeNow];
    _labelTimer.text= timeNow;
}

//add images names here
/*
 UIImage *image = [UIImage imageNamed:@"brown.png"];
 [self.btnFirst setImage:image forState:UIControlStateNormal];
 */


/*  x = 120;
 y = 60;
 
 for (int i =0 ; i<4; i++) {
 for (int j=0; j<4; j++) {
 
 
 }
 }*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonsClicked:(UIButton *) sender {
    count++;
    flag = 0;
    /////clicked sound
    NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
    if( [check boolForKey:@"sound"]) {
    SystemSoundID soundID;
    
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"click" ofType:@"caf"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    }
    //////////
    //  if(flag ==0){
    if (sender.tag == 0) {
        [UIView transitionWithView:_btnFirst duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnFirst setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[0] ]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[0] = 1;
        //   _btnFirst.enabled = NO;
    }
    
    else if(sender.tag == 1){
        [UIView transitionWithView:_btnSecond duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnSecond setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[1]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
    }
    else if(sender.tag == 2){
        [UIView transitionWithView:_btnThird duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnThird setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[2]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    
    else if(sender.tag == 3){
        [UIView transitionWithView:_btnFourth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnFourth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[3]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 4){
        [UIView transitionWithView:_btnFifth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnFifth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[4]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 5){
        [UIView transitionWithView:_btnSixth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnSixth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[5]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 6){
        [UIView transitionWithView:_btnSeventh duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnSeventh setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[6]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    
    else if(sender.tag == 7){
        [UIView transitionWithView:_btnEightth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnEightth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[7]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 8){
        [UIView transitionWithView:_btnNineth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnNineth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[8]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    
    else if(sender.tag == 9){
        [UIView transitionWithView:_btnTenth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnTenth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[9]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    
    else if(sender.tag == 10){
        [UIView transitionWithView:_btnEleventh duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnEleventh setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[10]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 11){
        [UIView transitionWithView:_btnTwelveth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnTwelveth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[11]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 12){
        [UIView transitionWithView:_btnThirteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnThirteenth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[12]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 13){
        [UIView transitionWithView:_btnFourteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnFourteenth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[13]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    
    else if(sender.tag == 14){
        [UIView transitionWithView:_btnFifteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnFifteenth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[14]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    else if(sender.tag == 15){
        [UIView transitionWithView:_btnSixteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_btnSixteenth setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex:btnTags[15]]] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[sender.tag] = 1;
        
    }
    if (count >=2) {
        // [NSThread sleepForTimeInterval:5];
    }
    
    //[NSThread sleepForTimeInterval:5];
    
    if (count == 1) {
        
        
        for (int i=0; i<16; i++) {
            if(btnSelected[i] == 1){
                tagFirst = i;
                btnSelected[i] = 2;
                printf("%d ",tagFirst);
                break;
            }
        }
    }
    else if (count == 2){
        //  [NSThread sleepForTimeInterval:5];
        trials++;
        _labelTrials.text = [NSString stringWithFormat:@"%d", trials];
        
        for (int i=0; i<16; i++) {
            if(btnSelected[i] == 1){
                tagSecond = i;
                btnSelected[i] = 2;
                printf("%d ",tagSecond);
                break;
            }
        }
        
        if(btnTags[tagFirst] == btnTags[tagSecond] && tagFirst != tagSecond){
            count = 0;
            matched ++;
            _labelMatched.text = [NSString stringWithFormat:@"%d", matched];
            score += MAX((30 - timeMin)*10,0);
            _labelScore.text = [NSString stringWithFormat:@"%d", score];
            //matched sound
            NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
            if( [check boolForKey:@"sound"]) {
                SystemSoundID soundID;
                NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"matched" ofType:@"caf"];
                NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            
                AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
                AudioServicesPlaySystemSound(soundID);
            }
            ///////////////
            
            if (tagFirst == 0 || tagSecond == 0) {
                
                _btnFirst.enabled = NO;
            }
            
            if(tagFirst == 1 || tagSecond == 1){
                _btnSecond.enabled = NO;
            }
            if(tagFirst == 2 || tagSecond == 2){
                _btnThird.enabled = NO;
                
            }
            
            if(tagFirst == 3 || tagSecond == 3){
                
                _btnFourth.enabled = NO;
                
            }
            if(tagFirst == 4 || tagSecond == 4){
                _btnFifth.enabled = NO;
                
            }
            if(tagFirst == 5 || tagSecond == 5){
                _btnSixth.enabled = NO;
                
            }
            if(tagFirst == 6 || tagSecond == 6){
                _btnSeventh.enabled = NO;
                
            }
            
            if(tagFirst == 7 || tagSecond == 7){
                _btnEightth.enabled = NO;
                
            }
            if(tagFirst == 8 || tagSecond ==8){
                _btnNineth.enabled = NO;
            }
            
            if(tagFirst == 9 || tagSecond == 9){
                _btnTenth.enabled = NO;
                
            }
            
            if(tagFirst == 10 || tagSecond == 10){
                _btnEleventh.enabled = NO;
                
            }
            if(tagFirst == 11 || tagSecond == 11){
                _btnTwelveth.enabled = NO;
                
            }
            if(tagFirst == 12 || tagSecond == 12){
                _btnThirteenth.enabled = NO;
            }
            if(tagFirst == 13 || tagSecond == 13){
                _btnFourteenth.enabled = NO;
            }
            
            if(tagFirst == 14 || tagSecond == 14){
                _btnFifteenth.enabled = NO;
                
            }
            if(tagFirst == 15 || tagSecond == 15){
                _btnSixteenth.enabled = NO;
                
            }
            if(matched == 8){
                //alert
                self.StopTimer;
                [NSTimer scheduledTimerWithTimeInterval:2.0
                                                 target:self
                                               selector:@selector(showAlert)
                                               userInfo:nil
                                                repeats:NO];
            }
        }
        else{
            
            count = 0;
            //if(count == 1){
            for (int i=0; i<16; i++) {
                if (i == 0 || i == 0) {
                    
                    _btnFirst.userInteractionEnabled = NO;
                }
                
                if(i == 1 || i == 1){
                    _btnSecond.userInteractionEnabled = NO;
                }
                if(i == 2 || i == 2){
                    _btnThird.userInteractionEnabled = NO;
                    
                }
                
                if(i == 3 || i == 3){
                    
                    _btnFourth.userInteractionEnabled = NO;
                    
                }
                if(i == 4 || i == 4){
                    _btnFifth.userInteractionEnabled = NO;
                    
                }
                if(i == 5 || i == 5){
                    _btnSixth.userInteractionEnabled = NO;
                    
                }
                if(i == 6 || i == 6){
                    _btnSeventh.userInteractionEnabled = NO;
                    
                }
                
                if(i == 7 || i == 7){
                    _btnEightth.userInteractionEnabled = NO;
                    
                }
                if(i == 8 || i ==8){
                    _btnNineth.userInteractionEnabled = NO;
                }
                
                if(i == 9 || i == 9){
                    _btnTenth.userInteractionEnabled = NO;
                    
                }
                
                if(i == 10 || i == 10){
                    _btnEleventh.userInteractionEnabled = NO;
                    
                }
                if(i == 11 || i == 11){
                    _btnTwelveth.userInteractionEnabled = NO;
                    
                }
                if(i == 12 || i == 12){
                    _btnThirteenth.userInteractionEnabled = NO;
                }
                if(i == 13 || i == 13){
                    _btnFourteenth.userInteractionEnabled = NO;
                }
                
                if(i == 14 || i == 14){
                    _btnFifteenth.userInteractionEnabled = NO;
                    
                }
                if(i == 15 || i == 15){
                    _btnSixteenth.userInteractionEnabled = NO;
                    
                }
                
            }
            [NSTimer scheduledTimerWithTimeInterval:3.0
                                             target:self
                                           selector:@selector(flipCardsBack)
                                           userInfo:nil
                                            repeats:NO];
            
            //   [NSThread sleepForTimeInterval:5];
        }
    }
    
    /*  if (btnTags[tagFirst] == btnTags[tagSecond]) {
     
     }
     else{
     btnSelected[tagFirst] = 0;
     btnSelected[tagSecond] = 0;
     
     count = 0;
     
     
     
     }*/
}

-(void) showAlert{
    ////connect server code
    NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
    NSString * savedName = [check objectForKey:@"name"];
    NSMutableString* str = [[NSMutableString alloc] initWithString:@"http://10.145.18.57:8084/IOSGameServer/EditUserScore?name="]  ;
    [str appendString: savedName];
    [str appendString:@"&score="];
    [str appendString: [NSString stringWithFormat:@"%d", score] ];
    
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
    [connection start];
    
    NSUserDefaults* saving = [NSUserDefaults standardUserDefaults];
    [saving setObject:[NSString stringWithFormat:@"%d", score] forKey:@"score"];
    /////
    
    /// win sound
    NSUserDefaults* check1 = [NSUserDefaults standardUserDefaults];
    if( [check1 boolForKey:@"sound"]) {
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"caf"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    }
    /////////////
    NSString *scoreString = [NSString stringWithFormat:@"You finished the game with score %d", score];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message: scoreString delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", @"play again", @"Share on Facebook" , nil];
    [alert show];
}

//server connection
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
        printf("score saved to server");
    } else {
        printf("score hasn't been saved to server");
    }
    
}


//////////

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 2:
            if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [controller setInitialText:[NSString stringWithFormat:@"I finished the Match Cards game with score %d.", score]];
                [controller addURL:[NSURL URLWithString:@""]];
                [controller addImage:[UIImage imageNamed:@"gameimg.jpg"]];
                
                [self presentViewController:controller animated:YES completion:Nil];
                
            }
            else{printf("No FB account");}
            break;
        case 1:
            //[self viewDidLoad];
            //[self viewWillAppear:YES];
            break;
            
        default:
            break;
    }
}

- (void) flipCardsBack{
    if (tagFirst == 0) {
        
        [UIView transitionWithView:_btnFirst duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFirst setBackgroundImage:[UIImage imageNamed: @"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[0] = 0;
        // [NSThread sleepForTimeInterval:5];
    }
    
    else if(tagFirst == 1){
        [UIView transitionWithView:_btnSecond duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSecond setBackgroundImage:[UIImage imageNamed:@"brown.png" ] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[1] = 0;
    }
    else if(tagFirst == 2){
        [UIView transitionWithView:_btnThird duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnThird setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[2] = 0;
        
    }
    
    else if(tagFirst == 3){
        [UIView transitionWithView:_btnFourth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFourth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[3] = 0;
        
    }
    else if(tagFirst == 4){
        [UIView transitionWithView:_btnFifth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFifth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[4] = 0;
        
    }
    else if(tagFirst == 5){
        [UIView transitionWithView:_btnSixth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSixth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[5] = 0;
        
    }
    else if(tagFirst == 6){
        [UIView transitionWithView:_btnSeventh duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSeventh setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[6] = 0;
        
    }
    
    else if(tagFirst == 7){
        [UIView transitionWithView:_btnEightth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnEightth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[7] = 0;
        
    }
    else if(tagFirst == 8){
        [UIView transitionWithView:_btnNineth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnNineth setBackgroundImage:[UIImage imageNamed:@"brown.png"]forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[8] = 0;
        
    }
    
    else if(tagFirst == 9){
        [UIView transitionWithView:_btnTenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnTenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[9] = 0;
        
    }
    
    else if(tagFirst == 10){
        [UIView transitionWithView:_btnEleventh duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnEleventh setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[10] = 0;
        
    }
    else if(tagFirst == 11){
        [UIView transitionWithView:_btnTwelveth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnTwelveth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[11] = 0;
        
    }
    else if(tagFirst == 12){
        [UIView transitionWithView:_btnThirteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnThirteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[12] = 0;
        
    }
    else if(tagFirst == 13){
        [UIView transitionWithView:_btnFourteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFourteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[13] = 0;
        
    }
    
    else if(tagFirst == 14){
        [UIView transitionWithView:_btnFifteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFifteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[14] = 0;
        
    }
    else if(tagFirst == 15){
        [UIView transitionWithView:_btnSixteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSixteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[15] = 0;
        
    }
    //[NSThread sleepForTimeInterval:10];
    
    if (tagSecond == 0) {
        [UIView transitionWithView:_btnFirst duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFirst setBackgroundImage:[UIImage imageNamed: @"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[0] = 0;
    }
    
    else if(tagSecond == 1){
        [UIView transitionWithView:_btnSecond duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSecond setBackgroundImage:[UIImage imageNamed:@"brown.png" ] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[1] = 0;
    }
    else if(tagSecond == 2){
        [UIView transitionWithView:_btnThird duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnThird setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[2] = 0;
        
    }
    
    else if(tagSecond == 3){
        [UIView transitionWithView:_btnFourth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFourth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[3] = 0;
        
    }
    else if(tagSecond == 4){
        [UIView transitionWithView:_btnFifth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFifth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[4] = 0;
        
    }
    else if(tagSecond == 5){
        [UIView transitionWithView:_btnSixth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSixth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[5] = 0;
        
    }
    else if(tagSecond == 6){
        [UIView transitionWithView:_btnSeventh duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSeventh setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[6] = 0;
        
    }
    
    else if(tagSecond == 7){
        [UIView transitionWithView:_btnEightth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnEightth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[7] = 0;
        
    }
    else if(tagSecond == 8){
        [UIView transitionWithView:_btnNineth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnNineth setBackgroundImage:[UIImage imageNamed:@"brown.png"]forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[8] = 0;
        
    }
    
    else if(tagSecond == 9){
        [UIView transitionWithView:_btnTenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnTenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[9] = 0;
        
    }
    
    else if(tagSecond == 10){
        [UIView transitionWithView:_btnEleventh duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnEleventh setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[10] = 0;
        
    }
    else if(tagSecond == 11){
        [UIView transitionWithView:_btnTwelveth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnTwelveth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[11] = 0;
        
    }
    else if(tagSecond == 12){
        [UIView transitionWithView:_btnThirteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnThirteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[12] = 0;
        
    }
    else if(tagSecond == 13){
        [UIView transitionWithView:_btnFourteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFourteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[13] = 0;
        
    }
    
    else if(tagSecond == 14){
        [UIView transitionWithView:_btnFifteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnFifteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[14] = 0;
        
    }
    else if(tagSecond == 15){
        [UIView transitionWithView:_btnSixteenth duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_btnSixteenth setBackgroundImage:[UIImage imageNamed:@"brown.png"] forState:UIControlStateNormal];
        }   completion:nil];
        btnSelected[15] = 0;
        
    }
    // }
    for (int i=0; i<16; i++) {
        if (i == 0 || i == 0) {
            
            _btnFirst.userInteractionEnabled = YES;
        }
        
        if(i == 1 || i == 1){
            _btnSecond.userInteractionEnabled = YES;
        }
        if(i == 2 || i == 2){
            _btnThird.userInteractionEnabled = YES;
            
        }
        
        if(i == 3 || i == 3){
            
            _btnFourth.userInteractionEnabled = YES;
            
        }
        if(i == 4 || i == 4){
            _btnFifth.userInteractionEnabled = YES;
            
        }
        if(i == 5 || i == 5){
            _btnSixth.userInteractionEnabled = YES;
            
        }
        if(i == 6 || i == 6){
            _btnSeventh.userInteractionEnabled = YES;
            
        }
        
        if(i == 7 || i == 7){
            _btnEightth.userInteractionEnabled = YES;
            
        }
        if(i == 8 || i ==8){
            _btnNineth.userInteractionEnabled = YES;
        }
        
        if(i == 9 || i == 9){
            _btnTenth.userInteractionEnabled = YES;
            
        }
        
        if(i == 10 || i == 10){
            _btnEleventh.userInteractionEnabled = YES;
            
        }
        if(i == 11 || i == 11){
            _btnTwelveth.userInteractionEnabled = YES;
            
        }
        if(i == 12 || i == 12){
            _btnThirteenth.userInteractionEnabled = YES;
        }
        if(i == 13 || i == 13){
            _btnFourteenth.userInteractionEnabled = YES;
        }
        
        if(i == 14 || i == 14){
            _btnFifteenth.userInteractionEnabled = YES;
            
        }
        if(i == 15 || i == 15){
            _btnSixteenth.userInteractionEnabled = YES;
            
        }
        
    }    }



@end

