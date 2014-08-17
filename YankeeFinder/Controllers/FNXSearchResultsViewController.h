//
//  FNXSearchResultsViewController.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/16/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNXSearchResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *searchString;

@end
