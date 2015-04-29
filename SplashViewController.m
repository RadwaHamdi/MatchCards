//
//  SplashViewController.m
//  MatchUp
//
//  Created by JETS on 4/14/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

UIGravityBehavior* gravity;
UICollisionBehavior* collision;
UIDynamicItemBehavior *ballBehavior;
UIImageView *_ball;
UIImageView *splashImage;

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
    splashImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [splashImage setImage: [UIImage imageNamed:@"background1.png"]];
    [self.view addSubview:splashImage];
    
    //set an anchor point on the image view so it opens from the left
    splashImage.layer.anchorPoint = CGPointMake(0, 0.5);
    _ball=[[UIImageView alloc]initWithFrame:CGRectMake(110.0, 50.0, 100.0, 50.0)];
    _ball.image = [UIImage imageNamed:@"matchcards.png"];
    [splashImage addSubview:_ball];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //reset the image view frame
    splashImage.frame = CGRectMake(0, 0, 320, 480);
    [self ballAnimation];
    [NSTimer scheduledTimerWithTimeInterval:4.0
                                     target:self
                                   selector:@selector(navigation)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) ballAnimation {
    
    gravity = [[UIGravityBehavior alloc] initWithItems:@[_ball]];
    
    [self.animator addBehavior:gravity];
    collision = [[UICollisionBehavior alloc] initWithItems:@[_ball]];
    [collision addBoundaryWithIdentifier:@"tabs" fromPoint:CGPointMake(50 , 200)toPoint:CGPointMake(300 , 200) ];
    [self.animator addBehavior:collision];
    collision.collisionDelegate = self;
    ballBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_ball]];
    ballBehavior.elasticity = 0.75;
    [self.animator addBehavior:ballBehavior];
    
    
}
-(void)navigation{
    /*
    ViewController1 *view =[ViewController1 new];
    [self presentViewController:view animated:YES completion:nil];
     */
    NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
    if( [check boolForKey:@"logged"]) {
        [self performSegueWithIdentifier:@"goDirectHome" sender:self];
    }
    else {
        [self performSegueWithIdentifier:@"startGame" sender:self];
    }
    
}

@end
