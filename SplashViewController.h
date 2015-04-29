//
//  SplashViewController.h
//  MatchUp
//
//  Created by JETS on 4/14/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController <UICollisionBehaviorDelegate>

@property (nonatomic,strong) UIDynamicAnimator* animator;
-(void) ballAnimation ;

@property (nonatomic,strong) UIGravityBehavior* gravity ;
@property (nonatomic,strong) UICollisionBehavior* collision ;
@property (nonatomic,strong) UIDynamicItemBehavior *ballBehavior ;
@property (nonatomic,strong) UIImageView  *_ball;
@property (nonatomic,strong) UIImageView *splashImage;


@end
