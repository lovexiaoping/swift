//
//  WFRDVTabBarManager.m
//  WuFunApp
//
//  Created by 丁浪平 on 2019/12/26.
//

#import "WFRDVTabBarManager.h"

#import "XYWaterWaveView.h"

@interface WFRDVTabBarManager ()

@property (nonatomic, strong) XYWaterWaveView *waterWaveView;

@end

@implementation WFRDVTabBarManager

+ (instancetype)sharedInstance{
    static WFRDVTabBarManager* shardInstance = nil;
    static dispatch_once_t  pred;
    dispatch_once(&pred, ^{
        shardInstance = [WFRDVTabBarManager new];
    });
    return shardInstance;
}

- (void)loadApplicationRootViewController{
    [self loadRootView];
}

-(void)loadRootView{
    [[[UIApplication  sharedApplication].delegate window] setRootViewController:[self setupRootViewControllers]];
    
    [self customizeTabBarForController:self.tabBarController];
    //B面本地对战的定位
    [self openApplicationLocation];
}

#pragma mark - Methods

- (UIViewController*)setupRootViewControllers {
    
    self.fightTabIndex = -1;
    UIViewController *VC1           = [[UIViewController alloc] init];
    UIViewController *VC2  = [[UIViewController alloc] init];
    UIViewController* VC3 = [[UIViewController alloc] init];
    UIViewController* VC41 = [[UIViewController alloc] init];
    UIViewController *VC5 = [[UIViewController alloc] init];
    NSMutableDictionary *vcnames =[NSMutableDictionary dictionary];
    [vcnames addEntriesFromDictionary:@{@"hometab":VC1,
                                        @"findtab":VC2,
                                        @"playtab":VC3,
                                        @"fighttab":VC41,
                                        @"Minetab":VC5}];
   __block NSMutableArray *vcArray1 = [NSMutableArray arrayWithCapacity:1];
    [self.tabInfoList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *tabInfo = obj;
        NSString *tabtag = tabInfo[@"tabTag"];
        if ([tabtag isEqual:@"fighttab"]) {
            self.isContailFightSDK = YES;
            self.fightTabIndex  = idx;
        }
        UIViewController *VC_Class = vcnames[tabtag];
        [vcArray1 addObject:VC_Class];
        
    }];
    
    int i=0;
    NSMutableArray *vcArray = [NSMutableArray arrayWithCapacity:1];
    for (UIViewController* VC in vcArray1) {
       NSString *tabName =  self.tabInfoList[i][@"tabName"];
       VC.title = tabName;
       UINavigationController* nav_1 = [[UINavigationController alloc] initWithRootViewController:VC];
           
       [vcArray addObject:nav_1];
       i++;
    }
    
    _VCS = (NSArray*)vcArray;
    
    self.tabBarController = [[RDVTabBarController alloc] init];
    [self.tabBarController setViewControllers:vcArray];
    [self.tabBarController setDelegate:self];
    
    return self.tabBarController;
}


//- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController :(NSArray*)tabinfo {
////    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
////    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
//
//    NSInteger index = 0;
//    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
////        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
//
//        NSDictionary *Info = tabinfo[index];
//        BOOL isLocal = NO;
//        if ([Info.allKeys containsObject:@"isLocal"]) {
//            if ([Info[@"isLocal"] boolValue]) {
//                isLocal = YES;
//            }
//        }
//
//        NSString *unSleImg = Info[@"unSleImg"];
//        NSString *sleImg   = Info[@"sleImg"];
//        if (isLocal) {
//
//
//            UIImage *selectedimage   = [UIImage imageNamed: sleImg];
//            UIImage *unselectedimage = [UIImage imageNamed:unSleImg];
//
////            UIImage *selectedimage   = IMAGE_TABBAR_DOCUMENT(sleImg);
////            UIImage *unselectedimage = IMAGE_TABBAR_DOCUMENT(unSleImg);
//            if (index == 2) {
//                if ([unSleImg containsString:@"http"]) {
//                    if (1) {
//                        unselectedimage = [UIImage imageNamed:@"wf_tabbar_03_sel"];
////                        unselectedimage = IMAGE_TABBAR_DOCUMENT(@"wf_tabbar_03_sel.png");
//                    }else{
//
//                        unselectedimage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:unSleImg]]];
//                        unselectedimage = [self circleImageWithName:unselectedimage borderWidth:0 borderColor:[UIColor clearColor]];                    }
//                }
//            }
//
//            [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
//        }
//
//        index++;
//    }
//}
- (UIImage*)circleImageWithName:(UIImage *)oldImage1 borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = oldImage1;
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 8.结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)updateMiddleTabbarItemImg {
   
}

- (void)showWaterWaves {
    RDVTabBarItem *item = [[self.tabBarController tabBar] items][2];
    
    if (!_waterWaveView) {
        _waterWaveView = [[XYWaterWaveView alloc] initWithFrame:CGRectMake(4, 4, item.imgLayer.frame.size.width, item.imgLayer.frame.size.height)];
        _waterWaveView.clipsToBounds = YES;
        _waterWaveView.layer.cornerRadius = item.imgLayer.frame.size.width/2;
        [item addSubview:_waterWaveView];
    }
    _waterWaveView.hidden = NO;
    [_waterWaveView startWaveToPercent:1];
}

- (void)hideWaterWaves {
    _waterWaveView.hidden = YES;
}


- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages_sel = @[@"wf_tabbar_01_sel.png", @"wf_tabbar_02_sel.png", @"wf_tabbar_03_sel.png", @"wf_tabbar_04_sel.png", @"wf_tabbar_05_sel.png"];
    NSArray *tabBarItemImages_unsel = @[@"wf_tabbar_01_unsel.png", @"wf_tabbar_02_unsel.png", @"wf_tabbar_03_unsel.png", @"wf_tabbar_04_unsel.png", @"wf_tabbar_05_unsel.png"];

    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed: tabBarItemImages_sel[index]];
        UIImage *unselectedimage = [UIImage imageNamed:tabBarItemImages_unsel[index]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
}
 

/**
 * Asks the delegate whether the specified view controller should be made active.
 */
- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

/**
 * Tells the delegate that the user selected an item in the tab bar.
 */

- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}

/*
 * Tells the delegate that the user tap on the selected item in the tab bar.
 */
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectItemAtIndex:(NSInteger)index{
    //NSLog(@"RDVTabBarController: didSelectItemAtIndex : %ld",index);
}
- (void)tabBarController:(RDVTabBarController *)tabBarController selectItemAtIndex:(NSInteger)index{
    //NSLog(@"RDVTabBarController: selectItemAtIndex : %ld",index);
    
    if (_VCS) {
        NSLog(@"RDVTabBarController: viewController : %@",_VCS[index]);
    }

 

    
}

-(void)resetFightData{
    
  
}

+ (void)hidden_rdv_tabBar:(UIViewController*)VC :(BOOL)isHidden {
    
    
    [[VC rdv_tabBarController] setTabBarHidden:isHidden animated:YES];
    
//    UIWindow* mainWindow = [[[UIApplication sharedApplication] delegate] window];
//    RDVTabBarController *TA = (RDVTabBarController*)[mainWindow rootViewController];
//     //  [TA setSelectedIndex:0];
//    TA.tabBarHidden;
//    NSLog(@"隐藏:  %ld",TA.tabBarHidden);
    
}



//开启定位权限 ios13获取局域网wifi名称需要配置该
-(void)openApplicationLocation{
    
       NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
         CGFloat version = [phoneVersion floatValue];
         // 如果是iOS13 未开启地理位置权限 需要提示一下
        if ( version >= 13) {
            if (([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)||
                ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)||
                ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted)){
                 self.locationManager = [[CLLocationManager alloc] init];
                 [self.locationManager requestWhenInUseAuthorization];
            }
         }
}
@end
