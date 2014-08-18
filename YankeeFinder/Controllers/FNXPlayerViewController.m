//
//  FNXPlayerViewController.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXPlayerViewController.h"
#import "FNXBatting.h"
#import "FNXPitching.h"

@interface FNXPlayerViewController ()

@end

@implementation FNXPlayerViewController

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
    self.title = _player.fullName;
}

- (void)viewWillAppear:(BOOL)animated
{
    if (_player.fullName.length < 1) {
        //search
    }
    else
    {
        [self getPlayerInfo];
    }
}

- (void)getPlayerInfo
{
    FNXYankeesAPI *yankeesHandler = [[FNXYankeesAPI alloc] init];
    
    [yankeesHandler getPlayerPhoto:_player.headShotURL WithCallback:^(NSData *playerPhotoData, NSError *error)
     {
         if (!error) {
             UIImage *img = [[UIImage alloc]initWithData:playerPhotoData];
             _playerPhoto.image = img;
         }
     }];
    
    _birthInfo.text = [NSString stringWithFormat:@"Born: %@, %@, %@", _player.birthCity, _player.birthState, _player.birthCountry];
    _playerNumber.text = [NSString stringWithFormat:@"Jersey Number: %@", _player.number];
    
    // get stats
    
    [yankeesHandler getPlayerStatsWithId:[NSString stringWithFormat:@"%@", _player.playerID] WithCallback:^(NSDictionary *playerStatsDict, NSError *error)
     {
         if (!error) {
             _playerStats = [FNXStats instanceFromDictionary:playerStatsDict];             
             if (!_player.isPitcher) {
                 //get batting stats
                 for (FNXBatting *playerBatting in _playerStats.batting) {
                     NSLog(@"%@", [playerBatting dictionaryRepresentation]);
                 }
             }
             else
             {
                 //get pitching stats
                 for (FNXPitching *playerPitching in _playerStats.pitching) {
                     NSLog(@"%@", [playerPitching dictionaryRepresentation]);
                 }
             }
             [_playerTableView reloadData];
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(-10, -5, 320, 30)];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    //    headerLabel.center = headerView.center;
    headerLabel.textColor = [UIColor whiteColor];

    if (_player.isPitcher) {
        headerLabel.text = @"PITCHING";
    }
    else
    {
        headerLabel.text = @"BATTING";
    }

    
    [headerView addSubview:headerLabel];
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_player.isPitcher) {
        return _playerStats.pitching.count;
    }
    else
    {
        return _playerStats.batting.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (_player.isPitcher) {
        FNXPitching *pitching = _playerStats.pitching[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"Year: %@ - Outs: %@", pitching.yearID, pitching.oUTS];
    }
    else
    {
        FNXBatting *batting = _playerStats.batting[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"Year: %@ - Home Runs: %@", batting.yearID, batting.hR];
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:15];
    return cell;
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
