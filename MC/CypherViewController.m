//
//  CypherViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/9/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "CypherViewController.h"
#import <Social/Social.h>

@interface CypherViewController ()

@end

@implementation CypherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dontSendButton.hidden = YES;
    _sendButton.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)facebook:(id)sender {
    _dontSendButton.hidden = NO;
    _sendButton.hidden = NO;
    _cripteaza.hidden = YES;
    [_textCypher resignFirstResponder];
    long length;
    unichar *buf;
    unsigned i;
    
    length = [_textCypher.text length];
    buf = malloc( (length + 1) * sizeof(unichar) );
    [_textCypher.text getCharacters:buf];
    buf[length] = (unichar)0;
    for (i = 0; i < length; i++) {
        if (buf[i] >= (unichar)'a' && buf[i] <= (unichar) 'z') {
            buf[i] -= 2;
            if (buf[i] > 'z') buf[i] %= 26 + 'A';
        } else if (buf[i] >= (unichar)'A' && buf[i] <= (unichar) 'Z') {
            buf[i] -= 2 ;
            if (buf[i] > 'Z') buf[i] %= 26 + 'A';
        }
    }
    _secondText.text = [NSString stringWithCharacters:buf length:length];
    free(buf);
}
- (IBAction)dontSend:(id)sender {
    _dontSendButton.hidden = YES;
    _sendButton.hidden = YES;
    _cripteaza.hidden = NO;
}

- (IBAction)send:(id)sender {
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:_secondText.text ,nil] applicationActivities:nil];
    
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact];
    [self presentViewController:activityViewController animated:YES completion:nil];
}
@end
