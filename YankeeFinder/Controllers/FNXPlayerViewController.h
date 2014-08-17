//
//  FNXPlayerViewController.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNXPlayer.h"

@interface FNXPlayerViewController : UIViewController

@property (nonatomic, strong) FNXPlayer *player;
@property (weak, nonatomic) IBOutlet UIImageView *playerPhoto;
@property (weak, nonatomic) IBOutlet UILabel *birthInfo;
@property (weak, nonatomic) IBOutlet UILabel *playerNumber;

@end
