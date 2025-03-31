//
//  UIView+hrb.m
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import "UIView+hrb.h"

@implementation UIView (hrb)
- (__kindof UIView *(^)(BOOL))hrb_subViewsHidden{
    return ^(BOOL s){
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.hidden = s;
        }];
        return self;
    };
}

- (__kindof UIView *(^)(UIColor *))hrb_bgColor{
    __kindof UIView*(^a)(UIColor *) = ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
    return a;
}
- (__kindof UIView *(^)(CGFloat,CGFloat,CGFloat,CGFloat))hrb_frame{
    __kindof UIView*(^a)(CGFloat,CGFloat,CGFloat,CGFloat) = ^(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
    return a;
}
- (__kindof UIView* (^)(void(^)(CALayer *)))hrb_layer{
    __kindof UIView*(^a)(void(^)(CALayer *)) = ^(void(^b)(CALayer *)){
        CALayer *layer = self.layer;
        b(&layer);
        return self;
    };
    return a;
}

- (__kindof UIView* (^)(BOOL))hrb_hidden{
    __kindof UIView*(^a)(BOOL) = ^(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
    return a;
}
- (__kindof UIView * (^)(BOOL))hrb_canClip{
    __kindof UIView*(^a)(BOOL) = ^(BOOL canClip){
        self.userInteractionEnabled = canClip;
        return self;
    };
    return a;
}
- (__kindof UIView *(^)(void))hrb_circular{
    __kindof UIView *(^a)(void) = ^{
        [self layoutIfNeeded];
        self.layer.cornerRadius = self.frame.size.width / 2.0;
        self.layer.masksToBounds = true;
        return self;
    };
    return a;
}
- (__kindof UIView *(^)(float cor,BOOL force))hrb_circular_custom{
    __kindof UIView *(^a)(float cor,BOOL force) = ^(float cor,BOOL force){
        self.layer.cornerRadius = cor;
        self.layer.masksToBounds = force;
        return self;
    };
    return a;
}
- (__kindof UIView *(^)(int))hrb_tag{
    __kindof UIView *(^a)(int) = ^(int tag){
        self.tag = tag;
        return self;
    };
    return a;
}
- (__kindof UIView *(^)(int))hrb_tagv{
    __kindof UIView *(^a)(int) = ^(int tag){
        
        return [self viewWithTag:tag];
    };
    return a;
}
- (__kindof UIView *(^)(CGFloat))hrb_borderW{
    return ^(CGFloat w){
        self.layer.borderWidth = w;
        return self;
    };
}
- (UIView *)hrb_lastSubview{
    UIView *view = nil;
    if (self.subviews.count >= 2) {
        view = self.subviews[self.subviews.count - 2];
        if (view == nil) view = self;
    }
    return view;
}
- (void)hrb_removeAllSubviews{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}
- (UIImage *)hrb_2Image{
    UIImage *imageRet = nil;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    //获取图像
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageRet;
}
@end
