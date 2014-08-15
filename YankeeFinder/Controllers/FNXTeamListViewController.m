//
//  FNXTeamListViewController.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXTeamListViewController.h"
#import "FNXTeam.h"
#import "FNXTeamViewCell.h"

@interface FNXTeamListViewController ()

@property (nonatomic, strong) __block NSArray *teamsArray;

@end

@implementation FNXTeamListViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    FNXYankeesAPI *yankeesHandler = [[FNXYankeesAPI alloc] init];
    
    [yankeesHandler getTeamWithCallback:^(NSArray *teamsResponseArray, NSError *error)
     {
         if (!error) {
             _teamsArray = teamsResponseArray;
             [_teamTableView reloadData];
         }
     }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _teamsArray.count;
}

- (FNXTeamViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    FNXTeamViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FNXTeamViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    FNXTeam *team = [FNXTeam instanceFromDictionary:(NSDictionary *)_teamsArray[indexPath.row]];
    
    cell.nameLabel.text = team.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
