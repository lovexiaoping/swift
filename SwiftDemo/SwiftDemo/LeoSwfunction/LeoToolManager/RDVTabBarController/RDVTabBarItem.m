// RDVTabBarItem.h
// RDVTabBarController
//
// Copyright (c) 2013 Robert Dimitrov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RDVTabBarItem.h"

@interface RDVTabBarItem () {
    NSString *_title;
    UIOffset _imagePositionAdjustment;
    NSDictionary *_unselectedTitleAttributes;
    NSDictionary *_selectedTitleAttributes;
}

@property UIImage *unselectedBackgroundImage;
@property UIImage *selectedBackgroundImage;
@property UIImage *unselectedImage;
@property UIImage *selectedImage;


@property (nonatomic, strong) CALayer *imgBackLayer;

@end

@implementation RDVTabBarItem

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)commonInitialization {
    // Setup defaults

    self.backgroundColor = [UIColor clearColor];
    
    _title = @"";
    _titlePositionAdjustment = UIOffsetZero;
    _imgLayer = [CALayer layer];
    _imgBackLayer = [CALayer layer];
    [self.layer addSublayer:_imgBackLayer];
    [_imgBackLayer addSublayer:_imgLayer];
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        _unselectedTitleAttributes = @{
                                       NSFontAttributeName: [UIFont systemFontOfSize:12],
                                       NSForegroundColorAttributeName: [UIColor blackColor],
                                       };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        _unselectedTitleAttributes = @{
                                       UITextAttributeFont: [UIFont systemFontOfSize:12],
                                       UITextAttributeTextColor: [UIColor blackColor],
                                       };
#endif
    }
    
    _selectedTitleAttributes = [_unselectedTitleAttributes copy];
//    _badgeBackgroundColor = RGBA_COLOR(0, 0, 0, 0);
    _badgeTextColor = [UIColor whiteColor];
    _badgeTextFont = [UIFont systemFontOfSize:12];
    _badgePositionAdjustment = UIOffsetZero;
}
#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

- (void)drawRect:(CGRect)rect {

    self.layer.masksToBounds = YES;
    
    CGSize frameSize = self.frame.size;
    CGSize imageSize = CGSizeZero;
    CGSize titleSize = CGSizeZero;
    NSDictionary *titleAttributes = nil;
    UIImage *backgroundImage = nil;
    UIImage *image = nil;
    CGFloat imageStartingY = 0.0f;
    
    if ([self isSelected]) {
        image = [self selectedImage];
        backgroundImage = [self selectedBackgroundImage];
        titleAttributes = [self selectedTitleAttributes];
        
        if (!titleAttributes) {
            titleAttributes = [self unselectedTitleAttributes];
        }
    } else {
        image = [self unselectedImage];
        backgroundImage = [self unselectedBackgroundImage];
        titleAttributes = [self unselectedTitleAttributes];
    }
    
    imageSize = CGSizeMake(38, 38);
    if (IS_IPHONE_X) {
        imageSize = CGSizeMake(40, 40);
    }
    if (self.frame.size.height == 80 || self.frame.size.height == 105) {
        imageSize = CGSizeMake(55, 55);
    }
    if (_reSizeScale) {
//        imageSize = CGSizeMake(imageSize.height*1.8, imageSize.height);
        imageSize = CGSizeMake(40, 40);

    }

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    [backgroundImage drawInRect:self.bounds];
    
    if (![_title length]) {
        _imgLayer.contents = (id)image.CGImage;
        _imgBackLayer.frame = CGRectMake(roundf(frameSize.width / 2 - imageSize.width / 2) + _imagePositionAdjustment.horizontal,
                                   imageStartingY + _imagePositionAdjustment.vertical,
                                   imageSize.width,
                                   imageSize.height);
        _imgBackLayer.cornerRadius = imageSize.width/2;
        
        _imgLayer.frame = CGRectMake(4 , 4, imageSize.width-8, imageSize.height-8);
    } else {
        titleSize = [_title boundingRectWithSize:CGSizeMake(frameSize.width, 20)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:titleAttributes
                                         context:nil].size;
        
        imageStartingY = roundf((frameSize.height - imageSize.height - titleSize.height) / 2);
        if (IS_IPHONE_X) {
            imageStartingY = imageStartingY-10;
        }
        
        _imgLayer.contents = (id)image.CGImage;
        _imgBackLayer.frame = CGRectMake(roundf(frameSize.width / 2 - imageSize.width / 2) + _imagePositionAdjustment.horizontal,
                                         imageStartingY + _imagePositionAdjustment.vertical,
                                         imageSize.width,
                                         imageSize.height);
        _imgBackLayer.cornerRadius = imageSize.width/2;
        
        _imgLayer.frame = CGRectMake(4, 4, imageSize.width-8, imageSize.height-8);
        
        CGContextSetFillColorWithColor(context, [titleAttributes[NSForegroundColorAttributeName] CGColor]);
        
        if (self.frame.size.height == 80 || self.frame.size.height == 105) {
            imageStartingY = imageStartingY - 1;
            _imgLayer.cornerRadius = (imageSize.width - 8)/2;
            _imgLayer.masksToBounds = YES;
            
//            UIImage *img = IMAGE4_DOCUMENT(@"Btabbar_middle");
//            _imgBackLayer.contents = (id)img.CGImage;
        }
        
        CGFloat ty = IS_IPHONE_X ? self.frame.size.height - 36 : self.frame.size.height - 20;
        
        [_title drawInRect:CGRectMake(roundf(frameSize.width / 2 - titleSize.width / 2) + _titlePositionAdjustment.horizontal+1,  ty, titleSize.width, titleSize.height)
            withAttributes:titleAttributes];
    }
    
    // Draw badges
    
    if ([[self badgeValue] integerValue] != 0) {
        CGSize badgeSize = CGSizeZero;
        
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
            badgeSize = [_badgeValue boundingRectWithSize:CGSizeMake(frameSize.width, 20)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName: [self badgeTextFont]}
                                                  context:nil].size;
        } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
            badgeSize = [_badgeValue sizeWithFont:[self badgeTextFont]
                                constrainedToSize:CGSizeMake(frameSize.width, 20)];
#endif
        }
        
        CGFloat textOffset = 2.0f;
        
        if (badgeSize.width < badgeSize.height) {
            badgeSize = CGSizeMake(badgeSize.height, badgeSize.height);
        }
        
        CGRect badgeBackgroundFrame = CGRectMake(roundf(frameSize.width / 2 + (image.size.width / 2) * 0.9) +
                                                 [self badgePositionAdjustment].horizontal,
                                                 textOffset + [self badgePositionAdjustment].vertical,
                                                 badgeSize.width + 2 * textOffset, badgeSize.height + 2 * textOffset);
        
        if ([self badgeBackgroundColor]) {
            CGContextSetFillColorWithColor(context, [[self badgeBackgroundColor] CGColor]);
            
            CGContextFillEllipseInRect(context, badgeBackgroundFrame);
        } else if ([self badgeBackgroundImage]) {
            [[self badgeBackgroundImage] drawInRect:badgeBackgroundFrame];
        }
        
        CGContextSetFillColorWithColor(context, [[self badgeTextColor] CGColor]);
        
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
            NSMutableParagraphStyle *badgeTextStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
            [badgeTextStyle setLineBreakMode:NSLineBreakByWordWrapping];
            [badgeTextStyle setAlignment:NSTextAlignmentCenter];
            
            NSDictionary *badgeTextAttributes = @{
                                                  NSFontAttributeName: [self badgeTextFont],
                                                  NSForegroundColorAttributeName: [self badgeTextColor],
                                                  NSParagraphStyleAttributeName: badgeTextStyle,
                                                  };
            
            [[self badgeValue] drawInRect:CGRectMake(CGRectGetMinX(badgeBackgroundFrame) + textOffset,
                                                     CGRectGetMinY(badgeBackgroundFrame) + textOffset,
                                                     badgeSize.width, badgeSize.height)
                withAttributes:badgeTextAttributes];
        } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
            [[self badgeValue] drawInRect:CGRectMake(CGRectGetMinX(badgeBackgroundFrame) + textOffset,
                                                     CGRectGetMinY(badgeBackgroundFrame) + textOffset,
                                                     badgeSize.width, badgeSize.height)
                                 withFont:[self badgeTextFont]
                            lineBreakMode:NSLineBreakByTruncatingTail
                                alignment:NSTextAlignmentCenter];
#endif
        }
    }
    
    CGContextRestoreGState(context);
}

- (void)setNeedFlip:(BOOL)needFlip {
    if (needFlip) {
        CABasicAnimation *waitAnimation = [CABasicAnimation animation];
        waitAnimation.toValue = [NSNumber numberWithFloat:1.0];
        waitAnimation.duration = 3.f;
        waitAnimation.beginTime = 3.f;
        
        CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
        rotationAnimation.duration = 1.f;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.duration = 4.f;
        group.repeatCount = CGFLOAT_MAX;
        group.removedOnCompletion = NO;
        
        [group setAnimations:@[waitAnimation, rotationAnimation]];
        
        [_imgLayer addAnimation:group forKey:@"bindCardImageViewAnimation"];
    }else{
        [_imgLayer removeAnimationForKey:@"bindCardImageViewAnimation"];
    }
}

#pragma mark - Image configuration

- (UIImage *)finishedSelectedImage {
    return [self selectedImage];
}

- (UIImage *)finishedUnselectedImage {
    return [self unselectedImage];
}

- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage {
    if (selectedImage && (selectedImage != [self selectedImage])) {
        [self setSelectedImage:selectedImage];
    }
    
    if (unselectedImage && (unselectedImage != [self unselectedImage])) {
        [self setUnselectedImage:unselectedImage];
    }
    
    [self drawRect:self.bounds];
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    
    [self setNeedsDisplay];
}

#pragma mark - Background configuration

- (UIImage *)backgroundSelectedImage {
    return [self selectedBackgroundImage];
}

- (UIImage *)backgroundUnselectedImage {
    return [self unselectedBackgroundImage];
}

- (void)setBackgroundSelectedImage:(UIImage *)selectedImage withUnselectedImage:(UIImage *)unselectedImage {
    if (selectedImage && (selectedImage != [self selectedBackgroundImage])) {
        [self setSelectedBackgroundImage:selectedImage];
    }
    
    if (unselectedImage && (unselectedImage != [self unselectedBackgroundImage])) {
        [self setUnselectedBackgroundImage:unselectedImage];
    }
}

#pragma mark - Accessibility

- (NSString *)accessibilityLabel{
    return @"tabbarItem";
}

- (BOOL)isAccessibilityElement
{
    return YES;
}


@end
