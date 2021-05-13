//
//  LeoSwAppManager.m
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

#import "LeoSwAppManager.h"

//OC调用swift文件的隐藏头文件，xcode里隐藏了
#import "SwiftDemo-Swift.h"

@implementation LeoSwAppManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self testLeoSwAppManager];
    }
    return self;
}
-(void)testLeoSwAppManager{
    
    NSLog(@"-----");
    
    ViewController *v2 = [[ViewController alloc]init];
    
    
    
}
@end
