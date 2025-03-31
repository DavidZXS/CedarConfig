//
//  UIView+hrb.h
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (hrb)
- (__kindof UIView *(^)(BOOL))hrb_subViewsHidden;
- (__kindof UIView *(^)(UIColor *))hrb_bgColor;
- (__kindof UIView* (^)(void(^)(CALayer *)))hrb_layer;
- (__kindof UIView* (^)(BOOL))hrb_hidden;
- (__kindof UIView * (^)(BOOL))hrb_canClip;
- (__kindof UIView *(^)(CGFloat))hrb_borderW;
/// 切圆
- (__kindof UIView *(^)(void))hrb_circular;
- (__kindof UIView *(^)(float cor,BOOL force))hrb_circular_custom;
- (__kindof UIView *(^)(int))hrb_tag;
- (__kindof UIView *(^)(int))hrb_tagv;
- (UIView *)hrb_lastSubview;
- (void)hrb_removeAllSubviews;

- (__kindof UIView *(^)(CGFloat,CGFloat,CGFloat,CGFloat))hrb_frame;
- (UIImage *)hrb_2Image;
@end

NS_ASSUME_NONNULL_END
