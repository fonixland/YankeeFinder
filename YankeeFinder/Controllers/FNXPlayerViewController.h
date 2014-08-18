//
//  FNXPlayerViewController.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNXPlayer.h"
#import "FNXStats.h"

@interface FNXPlayerViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) FNXPlayer *player;
@property (nonatomic, strong) FNXStats *playerStats;
@property (weak, nonatomic) IBOutlet UIImageView *playerPhoto;
@property (weak, nonatomic) IBOutlet UILabel *birthInfo;
@property (weak, nonatomic) IBOutlet UILabel *playerNumber;
@property (weak, nonatomic) IBOutlet UITableView *playerTableView;

@end
