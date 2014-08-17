//
//  FNXRosterViewController.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/15/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXRosterViewController.h"
#import "FNXRosterViewCell.h"
#import "FNXPlayer.h"
#import "FNXPlayerViewController.h"

@interface FNXRosterViewController ()

@property (nonatomic, strong) __block NSArray *rosterArray;
@property (nonatomic, strong) FNXPlayer *player;

@end

@implementation FNXRosterViewController

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
    
    [yankeesHandler getRosterWithTeamId:_teamId WithCallback:^(NSArray *rosterResponseArray, NSError *error)
     {
         if (!error) {
             _rosterArray = rosterResponseArray;
             [_rosterTableView reloadData];
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
    return _rosterArray.count;
}

- (FNXRosterViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    FNXRosterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FNXRosterViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    _player = [FNXPlayer instanceFromDictionary:(NSDictionary *)_rosterArray[indexPath.row]];
    
    cell.nameLabel.text = _player.fullName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _player = [FNXPlayer instanceFromDictionary:(NSDictionary *)_rosterArray[indexPath.row]];
    [self performSegueWithIdentifier:@"playerSegue" sender:self];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"playerSegue"]) {
        FNXPlayerViewController *playerViewController = [segue destinationViewController];
        if (playerViewController != nil) {
            playerViewController.player = _player;
        }
    }
}

@end
