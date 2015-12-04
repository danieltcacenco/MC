//
//  TDPasswordTableViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 6/26/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "TDPasswordTableViewController.h"
#import "LTHPasscodeViewController.h"

@interface TDPasswordTableViewController ()

@end

@implementation TDPasswordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([LTHPasscodeViewController doesPasscodeExist] &&
        [LTHPasscodeViewController didPasscodeTimerEnd]) {
        [[LTHPasscodeViewController sharedUser] showLockScreenWithAnimation:YES
                                                                 withLogout:NO
                                                             andLogoutTitle:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [[LTHPasscodeViewController sharedUser] showForEnablingPasscodeInViewController:self
                                                                                asModal:NO];
    }else if (indexPath.section == 1){
        [[LTHPasscodeViewController sharedUser] showForChangingPasscodeInViewController:self asModal:NO];
    }else if (indexPath.section == 2){
        [[LTHPasscodeViewController sharedUser] showForDisablingPasscodeInViewController:self
                                                                                 asModal:NO];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([LTHPasscodeViewController doesPasscodeExist]) {
        if (indexPath.section == 0) return nil;
    }
    return indexPath;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView :tableView cellForRowAtIndexPath:indexPath];
    if ([LTHPasscodeViewController doesPasscodeExist]) {
        if (indexPath.section == 1)   {
            cell.hidden = NO;
        }
        if (indexPath.section == 2)   {
            cell.hidden = NO;
        }
    }else{
        if (indexPath.section == 1)   {
            cell.hidden = YES;
        }
        if (indexPath.section == 2)   {
            cell.hidden = YES;
        }
    }
    return cell;
}

@end
