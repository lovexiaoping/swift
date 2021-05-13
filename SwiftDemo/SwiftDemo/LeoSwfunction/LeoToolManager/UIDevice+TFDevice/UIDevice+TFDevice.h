//
//  UIDevice+TFDevice.h
//  demo
//
//  Created by admin on 2020/7/21.
//  Copyright © 2020 hedgehog. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (TFDevice)
/**
 * @interfaceOrientation 输入要强制转屏的方向
 */
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;
@end

NS_ASSUME_NONNULL_END
