//
//  VSContainerController.m
//  VogueShop
//
//  Created by wanming zhang on 9/22/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VSContainerController.h"
#import "VSProductImageController.h"

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
}

- (VSProductImageController *)viewControllerWithImage:(NSString *)productImage {
    VSProductImageController  * productImageVC;
    // Create a product image view controller showing product image
    // Image is hard coded for this prototype
    // TODO: Fetch image from server
    productImageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductImageScene"];
    productImageVC.imageID = productImage;
    
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
    NSMutableArray * mutablePages = [[NSMutableArray alloc] init];
    
    // Hard code an array of product images for the prototype
    // TODO: Determine the logic to display product images

    NSArray * productImages = @[@"Red_Sneaker", @"Black_Heels", @"Fashion_Show", @"Personal_Shopper"];
   
    for (NSUInteger index = 0; index < [productImages count]; index ++) {
        NSString * imageID = [productImages objectAtIndex:index];
        
        VSProductImageController * viewController = [self viewControllerWithImage:imageID];
        [mutablePages addObject:viewController];
        
    }
    
    self.pages = [mutablePages copy];
    
    UIViewController * firstController = [self.pages objectAtIndex:0];
    [self.pageViewController setViewControllers:@[firstController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
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
