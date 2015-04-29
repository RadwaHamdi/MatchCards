//
//  MTTableViewCell.h
//  MatchUp
//
//  Created by JETS on 4/14/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *score;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end
