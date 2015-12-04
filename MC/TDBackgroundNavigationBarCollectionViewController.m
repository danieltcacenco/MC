//
//  TDBackgroundNavigationBarCollectionViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "TDBackgroundNavigationBarCollectionViewController.h"
#import "DetailNavigationBarViewController.h"

@interface TDBackgroundNavigationBarCollectionViewController ()
@property (nonatomic) NSArray *imageHeader;

@end

@implementation TDBackgroundNavigationBarCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
   _imageHeader = [NSArray arrayWithObjects:@"header1",@"header2",@"header3",@"header4",@"header5", nil];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSData* imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundHeader"];
    UIImage *image = [UIImage imageWithData:imageData];
    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 DetailNavigationBarViewController *dNVC = segue.destinationViewController;
 NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
 dNVC.imageGet = [UIImage imageNamed:[_imageHeader objectAtIndex:indexPath.row]];
 }

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageHeader.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:10];
    image.image = [UIImage imageNamed:[_imageHeader objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
