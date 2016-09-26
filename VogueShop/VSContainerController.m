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
@property (weak, nonatomic) IBOutlet UIButton * shopButton;

@property (weak, nonatomic) IBOutlet UIButton * eventButton;
@property (weak, nonatomic) IBOutlet UIButton * ShopperButton;
@property (weak, nonatomic) IBOutlet UIImageView * tagImageView;
@property (weak, nonatomic) IBOutlet UIImageView * loyaltyImageView;
@property (weak, nonatomic) IBOutlet UILabel * loyaltyPointsLabel;

@property (strong, nonatomic) NSData * responseData;
@end

@implementation VSContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // TODO: Update title font to custom font.
    self.navigationItem.title = @"Vogue Store";
    // Setup page view controller
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    // Fetch loyalty points and display in UI
    [self fetchLoyaltyPoints];
    
    [self updatePageViewControllerDataSource];
    
    [self setupNavigationBar];
    [self setupButtons];
}

-(void) setupNavigationBar {
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

//  TODO: Remove hard coding.
- (void) setupButtons {
    // TODO: TO subclass UIButton to get the appropriate UI
    float leftInset = 20;
    float rightInset = self.view.bounds.size.width / 2;
    
    UIImage * shopIcon = [UIImage imageNamed:@"Shopping_Cart"];
    
    UIImage * resizedShopIcon = [shopIcon resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                   interpolationQuality:kCGInterpolationHigh];
    [self.shopButton setTitle:@"Shop" forState:UIControlStateNormal];
    [self.shopButton setImage:resizedShopIcon forState:UIControlStateNormal];
    [self.shopButton setImageEdgeInsets:UIEdgeInsetsMake(0, leftInset, 0, rightInset + 50)];
    
    UIImage * calendar = [UIImage imageNamed:@"Calendar"];
    
    UIImage * resizedCalendar = [calendar resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                 interpolationQuality:kCGInterpolationHigh];
    [self.eventButton setTitle:@"Events" forState:UIControlStateNormal];
    [self.eventButton setImage:resizedCalendar forState:UIControlStateNormal];
    [self.eventButton setImageEdgeInsets:UIEdgeInsetsMake(0, leftInset, 0, rightInset + 45)];
    
    UIImage * shopBag = [UIImage imageNamed:@"ShopBag"];
    
    UIImage * resizedBag = [shopBag resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(30, 30)
                                                 interpolationQuality:kCGInterpolationHigh];
    [self.ShopperButton setTitle:@"Book Personal Shopper" forState:UIControlStateNormal];
    [self.ShopperButton setImage:resizedBag forState:UIControlStateNormal];
    [self.ShopperButton setImageEdgeInsets:UIEdgeInsetsMake(0, leftInset, 0, rightInset / 2)];
}

- (VSProductImageController *)viewControllerWithImage:(NSString *)productImage imageType:(ImageType)type {
    VSProductImageController  * productImageVC;
    // Create a product image view controller showing product image
    // Image is hard coded for this prototype
    // TODO: Fetch image from server
    productImageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductImageScene"];
    productImageVC.imageID = productImage;
    productImageVC.imageType = type;
    return productImageVC;
}

#pragma mark - Network connection
- (void)fetchLoyaltyPoints {
    // http://54.191.35.66:8181/pfchang/api/buy username=Michael&grandTotal=0
    NSString * customerName = @"Michael";
    NSString * total = @"0";
    
    NSString * urlString = @"http://54.191.35.66:8181/pfchang/api/buy";
    NSString * bodyString = [NSString stringWithFormat:@"username=%@&grandTotal=%@",customerName,total];
    
    NSURL * url = [NSURL URLWithString:urlString];

    // Create and configure the request
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    // Set method
    [request setHTTPMethod:@"POST"];
    
    // Set headers
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    // Set body
    [request setHTTPBody:[bodyString dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Create url connection and fire request
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSLog(@"%@", [connection description]);
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    self.responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    self.responseData = data;
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSError * error = nil;
    NSDictionary * content = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&error]; // TODO: handle errors
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    } else {
        NSString * points = [content objectForKey:@"rewardPoints"];
        NSLog(@"%@", [content description]);
        self.loyaltyPointsLabel.text = [NSString stringWithFormat:@"%@ pts", points];
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
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
    VSProductImageController * viewController1 = [self viewControllerWithImage:@"Red Sneaker" imageType:kVSImageTypeProduct];
    VSProductImageController * viewController2 = [self viewControllerWithImage:@"Black_Heels" imageType:kVSImageTypeProduct];
    VSProductImageController * viewController3 = [self viewControllerWithImage:@"Fashion_Show" imageType:kVSImageTypeEvent];
    VSProductImageController * viewController4 = [self viewControllerWithImage:@"Personal_Shopper" imageType:kVSImageTypeShopper];
    
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
