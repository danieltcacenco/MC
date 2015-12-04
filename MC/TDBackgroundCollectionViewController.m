//
//  TDBackgroundCollectionViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/19/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "TDBackgroundCollectionViewController.h"
#import "DetailBackgroundViewController.h"

@interface TDBackgroundCollectionViewController ()
@property (nonatomic) NSArray *backgroundArray;

@end

@implementation TDBackgroundCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
     _backgroundArray = [NSArray arrayWithObjects:@"background1",@"background2",@"background3",@"background4",@"background5", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 DetailBackgroundViewController *dBV = segue.destinationViewController;
 NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
 dBV.imageGet = [UIImage imageNamed:[_backgroundArray objectAtIndex:indexPath.row]];
 }

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _backgroundArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:20];
    image.image = [UIImage imageNamed:[_backgroundArray objectAtIndex:indexPath.row]];
    
    return cell;
}
@end
