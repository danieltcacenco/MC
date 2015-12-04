//
//  SidebarTableViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"

@interface SidebarTableViewController ()

@end

@implementation SidebarTableViewController {
    NSArray *menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuItems = @[@"title", @"news", @"chat",@"notes",@"setting",@"info" ];
    UIImage *image = [UIImage imageNamed:@"bgMenu1"];
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:image];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSData *imageDataBacgkorund = [[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundMenu"];
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
    // Return the number of rows in the section.
    return menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
   
}


@end
