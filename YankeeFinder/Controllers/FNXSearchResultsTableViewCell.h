//
//  FNXSearchResultsTableViewCell.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/16/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNXSearchResultsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;

@end
