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
    
    
    VSProductImageController * imageVC = [self viewControllerWithImage:@""];
    [self.pageViewController setViewControllers:@[imageVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    ;
    
}

- (VSProductImageController *)viewControllerWithImage:(NSString *)productImage {
    VSProductImageController  * productImageVC;
    // Create a product image view controller showing product image
    // Image is hard coded for this prototype
    // TODO: Fetch image from server
    productImageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductImageScene"];
    
    
    return productImageVC;
}

#pragma mark - UIPageViewControllerDataSource

// For gesture-initiated transitions, the page view controller obtains view controllers via these methods, so use of setViewControllers:direction:animated:completion: is not required.
//- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
//    
//}
//
//- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    
//}

//- (void)updatePageViewControllerDataSource {
//    NSArray <NSString *> * documentTypes = [self.session.currentRepair documentsForESignFlow];
//    NSMutableArray * mutablePages = [[NSMutableArray alloc] init];
//    
//    for (NSUInteger index = 0; index < [documentTypes count]; index ++) {
//        NSString * type = [documentTypes objectAtIndex:index];
//        
//        RIWAandTACWebViewController * viewController;
//        
//        if ([type isEqualToString:kConfirmationDoc]) {
//            viewController = [self viewControllerWithDocType:RCWorkDocumentTypeConfirmation];
//            [mutablePages safeAddObject:viewController];
//            [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
//        }
//        else if ([type isEqualToString:kWorkAuthDoc]) {
//            viewController = [self viewControllerWithDocType:RCWorkDocumentTypeAuthorization];
//            [mutablePages safeAddObject:viewController];
//            [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
//        }
//        else if ([type isEqualToString:kLoanerDoc]) {
//            viewController = [self viewControllerWithDocType:RCWorkDocumentTypeLoaner];
//            [mutablePages safeAddObject:viewController];
//        }
//        else if ([type isEqualToString:kTermsConditionsDoc]) {
//            viewController = [self viewControllerWithDocType:RCWorkDocumentTypeTermsAndConditions];
//            [mutablePages safeAddObject:viewController];
//        }
//        
//    }
//    self.pages = [mutablePages copy];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
