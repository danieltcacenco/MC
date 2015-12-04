//
//  CypherViewController.h
//  MC
//
//  Created by Tcacenco Daniel on 5/9/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CypherViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textCypher;
- (IBAction)facebook:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *secondText;
- (IBAction)dontSend:(id)sender;
- (IBAction)send:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *dontSendButton;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) IBOutlet UIButton *cripteaza;



@end
