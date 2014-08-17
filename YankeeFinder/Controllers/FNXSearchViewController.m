//
//  FNXSearchViewController.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/16/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXSearchViewController.h"
#import "FNXSearchResultsViewController.h"

@interface FNXSearchViewController ()

@end

@implementation FNXSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"searchResultsSegue" sender:self];
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FNXSearchResultsViewController *searchResultsViewController = [segue destinationViewController];
    if (searchResultsViewController != nil) {
        searchResultsViewController.searchString = _searchTextField.text;
    }
}

@end
