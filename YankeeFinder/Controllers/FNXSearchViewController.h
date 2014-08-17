//
//  FNXSearchViewController.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/16/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNXSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

- (IBAction)searchButtonPressed:(id)sender;

@end
