//
//  DetailsLessonViewController.h
//  Teza
//
//  Created by Tcacenco Daniel on 3/2/15.
//  Copyright (c) 2015 PlayerMDHD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface DetailsLessonViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) Location *location;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *infoText;
@property (strong, nonatomic) IBOutlet UIImageView *firstImage;

@property (nonatomic) NSMutableArray *cipheMethods;


- (IBAction)postFacebook:(id)sender;


@end
