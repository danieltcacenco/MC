//
//  DetailSideBarMenuViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "DetailSideBarMenuViewController.h"

@interface DetailSideBarMenuViewController ()

@end

@implementation DetailSideBarMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageMenu.image = _imageGet;
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

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)apply:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(_imageGet)forKey:@"backgroundMenu"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
