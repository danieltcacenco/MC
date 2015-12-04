//
//  TCImageViewController.h
//  MC
//
//  Created by Tcacenco Daniel on 4/26/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCImageViewController : UIViewController

- (IBAction)imageButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic) UIImage *imageLab;

@end
