//
//  LessonsTableViewController.m
//  Teza
//
//  Created by Tcacenco Daniel on 3/2/15.
//  Copyright (c) 2015 PlayerMDHD. All rights reserved.
//

#import "LessonsTableViewController.h"
#import "JSONLoader.h"
#import "Location.h"
#import "DetailsLessonViewController.h"
#import "SWRevealViewController.h"

@interface LessonsTableViewController (){
    NSArray *lessons;
}
@end

@implementation LessonsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"lessons" withExtension:@"json"];
    
    // Load the data on a background queue...
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        lessons = [jsonLoader locationsFromJSONFile:url];
        // Now that we have the data, reload the table data on the main UI thread
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
    self.title = @"Laboratoare";
   
    
    UIImage *image = [UIImage imageNamed:@"background1"];
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:image];
    
   

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
 tableView.separatorColor = [UIColor clearColor];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return lessons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Location *location = [lessons objectAtIndex:indexPath.row];
    cell.textLabel.text = location.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:17.0];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailsLessonViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    vc.location = [lessons objectAtIndex:indexPath.row];
}


@end
