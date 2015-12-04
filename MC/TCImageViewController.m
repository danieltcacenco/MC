//
//  TCImageViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 4/26/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "TCImageViewController.h"

@interface TCImageViewController ()

@end

@implementation TCImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _image.image = _imageLab;
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

- (IBAction)imageButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
