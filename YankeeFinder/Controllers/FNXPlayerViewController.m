//
//  FNXPlayerViewController.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXPlayerViewController.h"

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
    _playerNumber.text = [NSString stringWithFormat:@"Number: %@", _player.number];
    
    if (!_player.isPitcher) {
        //get batting stats
    }
    else
    {
        //get pitching stats
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
