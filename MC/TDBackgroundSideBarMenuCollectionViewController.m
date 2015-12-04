//
//  TDBackgroundSideBarMenuCollectionViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "TDBackgroundSideBarMenuCollectionViewController.h"
#import "DetailSideBarMenuViewController.h"

@interface TDBackgroundSideBarMenuCollectionViewController ()
@property (nonatomic) NSArray *imageMenu;

@end

@implementation TDBackgroundSideBarMenuCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   _imageMenu = [NSArray arrayWithObjects:@"bgMenu1",@"bgMenu2",@"bgMenu3",@"bgMenu4",@"bgMenu5", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 DetailSideBarMenuViewController *dSBV = segue.destinationViewController;
 NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
 dSBV.imageGet = [UIImage imageNamed:[_imageMenu objectAtIndex:indexPath.row]];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  _imageMenu.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:30];
    image.image = [UIImage imageNamed:[_imageMenu objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
