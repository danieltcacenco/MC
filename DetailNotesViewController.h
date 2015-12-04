//
//  DetailNotesViewController.h
//  MC
//
//  Created by Tcacenco Daniel on 5/4/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notes.h"

@interface DetailNotesViewController : UIViewController<UITextViewDelegate>

@property (weak, nonatomic) Notes *notes;
@property (strong, nonatomic) IBOutlet UITextView *textNotes;
@property(nonatomic) NSManagedObject *textObject;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

- (IBAction)post:(id)sender;
@end
