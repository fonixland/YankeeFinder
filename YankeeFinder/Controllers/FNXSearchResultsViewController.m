//
//  FNXSearchResultsViewController.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/16/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXSearchResultsViewController.h"
#import "FNXSearchResultsTableViewCell.h"
#import "FNXPlayer.h"
#import "FNXPlayerViewController.h"
#import "FNXTeam.h"

@interface FNXSearchResultsViewController ()

@property (nonatomic, strong) __block NSArray *resultsArray;
@property (nonatomic, strong) __block IBOutlet UITableView *searchResultsTableView;
@property (nonatomic, strong) FNXPlayer *player;

@end

@implementation FNXSearchResultsViewController

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
    
    [yankeesHandler getPlayerWithSearchString:_searchString WithCallback:^(NSArray *searchResultsResponseArray, NSError *error)
     {
         if (!error) {
             _resultsArray = searchResultsResponseArray;
             [_searchResultsTableView reloadData];
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
    return _resultsArray.count;
}

- (FNXSearchResultsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    FNXSearchResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FNXSearchResultsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    _player = [FNXPlayer instanceFromDictionary:(NSDictionary *)_resultsArray[indexPath.row]];

    cell.nameLabel.text = _player.fullName;
    
    FNXYankeesAPI *yankeesAPI = [[FNXYankeesAPI alloc] init];
    
    [yankeesAPI getTeamWithId:[NSString stringWithFormat:@"%@", _player.teamID] WithCallback:^(NSDictionary *teamDict, NSError *error)
     {
         FNXTeam *team = [FNXTeam instanceFromDictionary:teamDict];
         cell.teamLabel.text = team.fullName;
     }];
    

    cell.positionLabel.text = [NSString stringWithFormat:@"Pos: %@", _player.position];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _player = [FNXPlayer instanceFromDictionary:(NSDictionary *)_resultsArray[indexPath.row]];
    [self performSegueWithIdentifier:@"playerSearchResultsSegue" sender:self];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"playerSearchResultsSegue"]) {
        FNXPlayerViewController *playerViewController = [segue destinationViewController];
        if (playerViewController != nil) {
            playerViewController.player = _player;
        }
    }
}

@end
