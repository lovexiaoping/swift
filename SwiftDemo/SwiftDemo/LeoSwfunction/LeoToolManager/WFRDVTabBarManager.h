//
//  WFRDVTabBarManager.h
//  WuFunApp
//
//  Created by 丁浪平 on 2019/12/26.
//

#import <Foundation/Foundation.h>
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRDVTabBarManager : NSObject<RDVTabBarControllerDelegate>{
 
    NSArray *tabInfoList;
    
    NSArray *tabWebImageList;
   
    RDVTabBarController *tabBarController;
    
    BOOL isContailFightSDK;
   
    NSUInteger fightTabIndex;
   
    CLLocationManager *locationManager;


}
@property(nonatomic, strong)NSArray *VCS;

@property(nonatomic, strong)NSArray *tabInfoList;

@property(nonatomic, strong)NSArray *tabWebImageList;

@property(nonatomic, strong)RDVTabBarController *tabBarController;

@property(nonatomic, assign)__block BOOL isContailFightSDK;

@property(nonatomic, assign)__block NSUInteger fightTabIndex;

@property (strong, nonatomic) CLLocationManager *locationManager;


+ (instancetype)sharedInstance;

- (void)loadApplicationRootViewController;

+ (void)hidden_rdv_tabBar:(UIViewController*)VC :(BOOL)isHidden;

//更新中间tabbar的图标
- (void)updateMiddleTabbarItemImg;

//下载的水波纹
- (void)showWaterWaves;

- (void)hideWaterWaves;

@end

NS_ASSUME_NONNULL_END
