//
//  DetailBackgroundViewController.h
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailBackgroundViewController : UIViewController
@property (nonatomic) UIImage *imageGet;
@property (strong, nonatomic) IBOutlet UIImageView *imageBackground;

- (IBAction)cancel:(id)sender;
- (IBAction)apply:(id)sender;
@end
