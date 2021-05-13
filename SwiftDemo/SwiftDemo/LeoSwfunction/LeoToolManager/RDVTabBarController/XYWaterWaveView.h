//
//  XYWaterWaveView.h
//  wateraa
//
//  Created by Yunnoy on 2020/5/19.
//  Copyright © 2020 肖雅. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYWaterWaveView : UIView

- (void)startWaveToPercent:(CGFloat)percent;

- (void)setGrowthSpeed:(CGFloat)growthSpeed;    // 设置上升速度
- (void)setGradientColors:(NSArray *)colors;   

@end

NS_ASSUME_NONNULL_END
