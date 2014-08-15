//
//  FNXTeamViewCell.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/15/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXTeamViewCell.h"

@implementation FNXTeamViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
