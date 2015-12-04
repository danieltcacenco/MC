//
//  DetailNavigationBarViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "DetailNavigationBarViewController.h"

@interface DetailNavigationBarViewController ()

@end

@implementation DetailNavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageNavBar.image = _imageGet;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    NSData *imageDataBacgkorund = [[NSUserDefaults standardUserDefaults]objectForKey:@"background"];
    UIImage *imageBacgkround = [UIImage imageWithData:imageDataBacgkorund];
    _imageBg.image = imageBacgkround;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)applica:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(_imageGet)forKey:@"backgroundHeader"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
