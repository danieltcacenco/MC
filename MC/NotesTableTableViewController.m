//
//  NotesTableTableViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 4/30/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "NotesTableTableViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "Notes.h"
#import "DetailNotesViewController.h"

@interface NotesTableTableViewController ()

@end

@implementation NotesTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.title = @"Notițe";
}


#pragma Core Data
-(NSManagedObjectContext *)manageObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSManagedObjectContext *managedObjectContext = [self manageObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Notes"];
    self.arrayNotes = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    [self.tableView reloadData];
    NSData* imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundHeader"];
    UIImage *image = [UIImage imageWithData:imageData];
    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    NSData *imageDataBacgkorund = [[NSUserDefaults standardUserDefaults]objectForKey:@"background"];
    UIImage *imageBacgkround = [UIImage imageWithData:imageDataBacgkorund];
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:imageBacgkround];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayNotes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cellNotes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    
    Notes *notes = (Notes *)[_arrayNotes objectAtIndex:indexPath.row];
    cell.textLabel.text = notes.text;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObjectContext *context = [self manageObjectContext];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [context deleteObject:[_arrayNotes objectAtIndex:indexPath.row]];
       NSError *error = nil;
        if (![context save:&error]) {
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
    
    [self.arrayNotes removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"segueNotes"]) {
        NSManagedObject *selectItem = [self.arrayNotes objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
        DetailNotesViewController *createNotes =  segue.destinationViewController;
        createNotes.textObject = selectItem;
    }
}

@end
