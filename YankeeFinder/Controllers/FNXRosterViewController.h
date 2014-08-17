//
//  FNXRosterViewController.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/15/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNXRosterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *rosterTableView;
@property (nonatomic, weak) NSString *teamId;

@end
