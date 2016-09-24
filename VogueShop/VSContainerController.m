//
//  VSContainerController.m
//  VogueShop
//
//  Created by wanming zhang on 9/22/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VSContainerController.h"
#import "VSProductImageController.h"
#import "UIImage+VSAdditions.h"

@interface VSContainerController ()

@property (strong, nonatomic) UIPageViewController * pageViewController;
@property (strong, nonatomic) NSArray<UIViewController *> * pages;

@end

@implementation VSContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // TODO: Update title font to custom font.
    self.navigationItem.title = @"Vogue Store";
    // Setup page view controller
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    [self updatePageViewControllerDataSource];
    
    [self setupNavigationBarAppearance];
}

-(void) setupNavigationBarAppearance {
    //TODO: Implement left and right bar button items.
    
    UIImage * leftIcon = [UIImage imageNamed:@"ListIcon"];
    
    UIImage * resizedLeftIcon = [leftIcon resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                 interpolationQuality:kCGInterpolationHigh];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:resizedLeftIcon style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIImage * rightIcon = [UIImage imageNamed:@"UserIcon"];
    
    UIImage * resizedRightIcon = [rightIcon resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                 interpolationQuality:kCGInterpolationHigh];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:resizedRightIcon style:UIBarButtonItemStylePlain target:self action:nil];

}

- (VSProductImageController *)viewControllerWithImage:(NSString *)productImage isProduct:(BOOL)product {
    VSProductImageController  * productImageVC;
    // Create a product image view controller showing product image
    // Image is hard coded for this prototype
    // TODO: Fetch image from server
    productImageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductImageScene"];
    productImageVC.imageID = productImage;
    productImageVC.isProduct = product;
    return productImageVC;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger currentIndex = [self.pages indexOfObject:viewController];
    NSInteger previousIndex = (currentIndex - 1) % [self.pages count];
    
    return self.pages[previousIndex];
    
 
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger currentIndex  = [self.pages indexOfObject:viewController];
    NSInteger nextIndex = ((currentIndex + 1) % [self.pages count]);
    
    return self.pages[nextIndex];
    
}


- (void)updatePageViewControllerDataSource {
    
    // Hard code an array of product images for the prototype
    // TODO: Determine the logic to display product images
    VSProductImageController * viewController1 = [self viewControllerWithImage:@"Red_Sneaker" isProduct:YES];
    VSProductImageController * viewController2 = [self viewControllerWithImage:@"Black_Heels" isProduct:YES];
    VSProductImageController * viewController3 = [self viewControllerWithImage:@"Fashion_Show" isProduct:NO];
    VSProductImageController * viewController4 = [self viewControllerWithImage:@"Personal_Shopper" isProduct:NO];
    
    self.pages = @[viewController1, viewController2, viewController3, viewController4];
    [self.pageViewController setViewControllers:@[viewController1] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
}

// The number of items reflected in the page indicator.
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.pages count];
}

// The selected item reflected in the page indicator.
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ContainerEmbedSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[UIPageViewController class]]) {
            UIPageViewController * pageVC = (UIPageViewController *)segue.destinationViewController;
            self.pageViewController = pageVC;
        }
    }
}

@end
