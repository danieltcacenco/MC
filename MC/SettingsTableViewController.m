//
//  SettingsTableViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/3/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SWRevealViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.title = @"Setări";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSData* imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundHeader"];
    UIImage *image = [UIImage imageWithData:imageData];
    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    NSData *imageDataBacgkorund = [[NSUserDefaults standardUserDefaults]objectForKey:@"background"];
    UIImage *imageBacgkround = [UIImage imageWithData:imageDataBacgkorund];
    NSData *imageDataMenu = [[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundMenu"];
    UIImage *imageMenu = [UIImage imageWithData:imageDataMenu];
    _imageHeader.image = image;
    _imageBackground.image = imageBacgkround;
    _imageMenu.image = imageMenu;
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:imageBacgkround];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
    
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor whiteColor]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
