//
//  DetailNavigationBarViewController.h
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNavigationBarViewController : UIViewController

@property (nonatomic) UIImage *imageGet;
@property (strong, nonatomic) IBOutlet UIImageView *imageNavBar;
@property (strong, nonatomic) IBOutlet UIImageView *imageBg;
- (IBAction)cancel:(id)sender;
- (IBAction)applica:(id)sender;

@end
