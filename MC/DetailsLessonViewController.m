//
//  DetailsLessonViewController.m
//  Teza
//
//  Created by Tcacenco Daniel on 3/2/15.
//  Copyright (c) 2015 PlayerMDHD. All rights reserved.
//

#import "DetailsLessonViewController.h"
#import "TCImageViewController.h"
#import <Social/Social.h>
#import "CypherViewController.h"
#import "Cifruri.h"
#import "MetodaSubstitutiei.h"

@interface DetailsLessonViewController ()

@end

@implementation DetailsLessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //self.title = _location.title;
    _titleLabel.text = _location.laboratorTitle;
    _infoText.text = _location.info;
    _infoText.font = [UIFont fontWithName:@"Avenir-Book" size:17.0];
    _firstImage.image = [UIImage imageNamed:_location.image];
    
    Cifruri *cifruri = [[Cifruri alloc]init];
    cifruri.simpleText = @"First";
    [_cipheMethods addObject:cifruri];
    
    
    MetodaSubstitutiei *ms = [[MetodaSubstitutiei alloc]init];
    ms.simpleText = @"Second";
    [_cipheMethods addObject:ms];
   

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"imageIdentifier" ]) {
        TCImageViewController *tIVC = (TCImageViewController *)segue.destinationViewController;
        tIVC.imageLab = [UIImage imageNamed:_location.image];
    }else if ([segue.identifier isEqualToString:@"cipherMethods"]){
        CypherViewController *cVC = (CypherViewController *)segue.destinationViewController;
        
    }
}


- (IBAction)postFacebook:(id)sender {
//    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//        SLComposeViewController *facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//        [facebookSheet setInitialText:[NSString stringWithFormat:@"%@ \n\n%@",  _titleLabel.text, _infoText.text]];
//        [facebookSheet addImage:[UIImage imageNamed:_location.image]];
//        [self presentViewController:facebookSheet animated:YES completion:nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:_infoText.text ,[UIImage imageNamed:_location.image],nil] applicationActivities:nil];
    
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact];
    [self presentViewController:activityViewController animated:YES completion:nil];
//    }else{
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Not Canoection to Facebook" message:@"Please go to setting to Facebook and connect your acount " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alertView show];
//    }
}
@end
