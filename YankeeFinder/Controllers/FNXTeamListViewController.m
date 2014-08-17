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
#import "FNXRosterViewController.h"

@interface FNXTeamListViewController ()

@property (nonatomic, strong) __block NSArray *teamsArray;
@property (nonatomic, strong) __block NSString *teamId;
@property (nonatomic, strong) __block NSString *teamName;

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
    FNXTeam *team = [FNXTeam instanceFromDictionary:(NSDictionary *)_teamsArray[indexPath.row]];
    _teamId = [NSString stringWithFormat:@"%@", team.teamID];
    _teamName = team.fullName;
    [self performSegueWithIdentifier:@"rosterSegue" sender:self];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"rosterSegue"]) {
        FNXRosterViewController *rosterViewController = [segue destinationViewController];
        if (rosterViewController != nil) {
            rosterViewController.title = _teamName;
            rosterViewController.teamId = _teamId;
        }
    }
}


@end
