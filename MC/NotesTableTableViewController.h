//
//  NotesTableTableViewController.h
//  MC
//
//  Created by Tcacenco Daniel on 4/30/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesTableTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, strong) NSMutableArray *arrayNotes;

@end
