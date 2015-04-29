//
//  MTTableViewCell.m
//  MatchUp
//
//  Created by JETS on 4/14/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "MTTableViewCell.h"

@implementation MTTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
