//
//  VSShoppingCollectionController.m
//  VogueShop
//
//  Created by wanming zhang on 9/24/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VSShoppingCollectionController.h"
#import "UIImage+VSAdditions.h"
//#import "VSShoppingCollectionCell.xib"

#define FEATURED_SECTION @"Featured"
#define COMMON_SECTION @"Common"
#define MARGIN 20.0

@interface VSShoppingCollectionController ()

@property (strong, nonatomic) NSArray<NSString *> * sections;
@property (strong, nonatomic) NSArray<NSString *> * items;
@end

@implementation VSShoppingCollectionController

static NSString * const reuseIdentifier = @"CollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"VSShoppingCollectionCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    [self setupTableviewDataSource];
}

-(void) setupTableviewDataSource {
    // TODO: setup collecton view data source
    self.sections = @[FEATURED_SECTION, COMMON_SECTION];
    self.items = @[@"Red_Sneaker", @"Black_Heels", @"PolkaDotDress", @"FloralDress"];
}

-(void) setupNavigationBar {
    UIImage * rightIcon = [UIImage imageNamed:@"Shopping_Cart"];
    
    UIImage * resizedRightIcon = [rightIcon resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                   interpolationQuality:kCGInterpolationHigh];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:resizedRightIcon style:UIBarButtonItemStylePlain target:self action:nil];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return [self.sections count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSInteger numberOfRows = 1;
    
    if ([[self.sections objectAtIndex:section] isEqualToString:COMMON_SECTION]) {
        numberOfRows = [self.items count];
    }
    
    return numberOfRows;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 180;
    CGFloat width = collectionView.frame.size.width - 2 * MARGIN;
    
    if ([[self.sections objectAtIndex:indexPath.section] isEqualToString:COMMON_SECTION]) {
        width = (width - MARGIN) / 2;
    }
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(MARGIN, MARGIN, MARGIN, MARGIN);
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
