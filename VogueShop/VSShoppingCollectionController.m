//
//  VSShoppingCollectionController.m
//  VogueShop
//
//  Created by wanming zhang on 9/24/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VSShoppingCollectionController.h"
#import "UIImage+VSAdditions.h"
#import "VSShoppingCollectionCell.h"
#import "VSProduct.h"

#define FEATURED_SECTION @"Featured"
#define COMMON_SECTION @"Common"

#define MAGiCIAN_HAT @"Magician Hat"
#define SNEAKERS_A @"Red Sneaker"
#define SHOES_B @"Black_Heels"
#define DRESS_A  @"Polka Dot Dress"
#define DRESSS_B @"Floral Dress"
#define SALE_TAG @"SaleTag"

#define MARGIN 20.0

@interface VSShoppingCollectionController ()

@property (strong, nonatomic) NSDictionary * sectionData;
@property (strong, nonatomic) NSArray<VSProduct *> * items;
@end

@implementation VSShoppingCollectionController

static NSString * const reuseIdentifier = @"CollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[VSShoppingCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"VSShoppingCollectionCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    [self setupTableviewDataSource];
}

-(void) setupTableviewDataSource {
    // TODO: setup collecton view data source
    // TODO: get product information through API calls
    NSMutableDictionary * mutableData = [[NSMutableDictionary alloc] init];
    VSProduct * featured = [[VSProduct alloc] init];
    featured.productDescription = MAGiCIAN_HAT;
    featured.imageID = MAGiCIAN_HAT;
    featured.price = [NSNumber numberWithFloat:39.0];
    [mutableData setObject:featured forKey:FEATURED_SECTION];
    
    VSProduct * sneakerA = [[VSProduct alloc] init];
    sneakerA.productDescription = @"Sneakers A";
    sneakerA.imageID = SNEAKERS_A;
    sneakerA.price = [NSNumber numberWithDouble:49.95];
    
    VSProduct * shoesB = [[VSProduct alloc] init];
    shoesB.productDescription = @"Shoes B";
    shoesB.imageID = SHOES_B;
    shoesB.price = [NSNumber numberWithDouble:79.95];
    
    VSProduct * dressA = [[VSProduct alloc] init];
    dressA.productDescription = @"Dress A";
    dressA.imageID = DRESS_A;
    dressA.price = [NSNumber numberWithDouble:99.0];
    
    VSProduct * dressB = [[VSProduct alloc] init];
    dressB.productDescription = @"Dress B";
    dressB.imageID = DRESSS_B;
    dressB.price = [NSNumber numberWithDouble:89.0];
    
    self.items = @[sneakerA, shoesB, dressA, dressB];
    [mutableData setObject:self.items forKey:COMMON_SECTION];
    
    self.sectionData = [mutableData copy];
}

-(void) setupNavigationBar {
    UIImage * rightIcon = [UIImage imageNamed:@"Shopping_Cart"];
    
    UIImage * resizedRightIcon = [rightIcon resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                   interpolationQuality:kCGInterpolationHigh];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:resizedRightIcon style:UIBarButtonItemStylePlain target:self action:nil];
    
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSArray * sections = [self.sectionData allKeys];
    return [sections count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger numberOfRows = 1;
    NSArray * sections = [self.sectionData allKeys];
    
    if ([[sections objectAtIndex:section] isEqualToString:COMMON_SECTION]) {
        numberOfRows = [self.items count];
    }
    return numberOfRows;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VSShoppingCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    static BOOL nibLoaded = NO;
    if (!nibLoaded) {
        UINib * nib = [UINib nibWithNibName:@"VSShoppingCollectionCell" bundle: nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
        nibLoaded = YES;
    }
    // Configure the cell
    [self configureProductCollectionCell:(VSShoppingCollectionCell *)cell AtIndexPath:indexPath];
    return cell;
}

- (void) configureProductCollectionCell:(VSShoppingCollectionCell *)cell AtIndexPath:(NSIndexPath *)indexpath {
    NSArray * sections = [self.sectionData allKeys];
    if ([[sections objectAtIndex:indexpath.section] isEqualToString:FEATURED_SECTION]) {
        VSProduct * featured = [self.sectionData objectForKey:FEATURED_SECTION];
        cell.descriptionLabel.text = [NSString stringWithFormat:@"Featured Item:  %@", featured.productDescription];
        cell.productImage.image = [UIImage imageNamed:featured.imageID];
        cell.saleTagImage.image = [UIImage imageNamed:SALE_TAG];
        cell.priceLabel.text = [NSString stringWithFormat:@"$%@", featured.price];
    }
    else {
        VSProduct * product = [self.items objectAtIndex:indexpath.row];
        cell.descriptionLabel.text = product.productDescription;
        cell.productImage.image = [UIImage imageNamed:product.imageID];
        cell.priceLabel.text = [NSString stringWithFormat:@"$ %@", product.price];
    }
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 180;
    CGFloat width = collectionView.frame.size.width - 2 * MARGIN;
    NSArray * sections = [self.sectionData allKeys];
    if ([[sections objectAtIndex:indexPath.section] isEqualToString:COMMON_SECTION]) {
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
