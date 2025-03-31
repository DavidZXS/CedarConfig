//
//  UIButton+hrb.m
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import "UIButton+hrb.h"

@implementation UIButton (hrb)
-(UIButton *(^)(UIButton *))hrb_copy{
    UIButton *(^a)(UIButton *) = ^(UIButton *button){
        self.hrb_textColor([button titleColorForState:UIControlStateNormal]);
        self.hrb_textColor_s([button titleColorForState:UIControlStateSelected]);
        self.hrb_font(button.normalFont?:button.titleLabel.font);
        self.hrb_font_s(button.selectFont?:self.normalFont);
        self.hrb_bgc(button.normalBgc);
        self.hrb_bgc_s(button.selectBgc?:button.normalBgc);
        self.hrb_borderColor(button.normalBorderColor);
        self.hrb_borderColor_s(button.selectBorderColor?:button.normalBorderColor);
        return self;
    };
    return  a;
}
-(UIButton *(^)(NSString *))hrb_text{
    UIButton *(^a)(NSString *) = ^(NSString *text){
        if (text == nil) text = @"";
        [self setTitle:text forState:(UIControlStateNormal)];
        return self;
    };
    return  a;
}
-(UIButton *(^)(NSString *))hrb_text_s{
    UIButton *(^a)(NSString *) = ^(NSString *text){
        if (text == nil) text = @"";
        [self setTitle:text forState:(UIControlStateSelected)];
        return self;
    };
    return  a;
}

static NSString *_hrb_button_object = @"_hrb_button_object";

- (void)setBO:(id)obj{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_button_object), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)bo{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_button_object));
}

static NSString *_hrb_normal_font = @"_hrb_normal_font";
static NSString *_hrb_select_font = @"_hrb_select_font";
static NSString *_hrb_normal_bgc = @"_hrb_normal_bgc";
static NSString *_hrb_select_bgc = @"_hrb_select_bgc";
static NSString *_hrb_normal_borderColor = @"_hrb_normal_borderColor";
static NSString *_hrb_select_borderColor = @"_hrb_select_borderColor";

- (void)setNormalFont:(UIFont *)normalFont{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_normal_font), normalFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIFont *)normalFont{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_normal_font));
}
- (void)setSelectFont:(UIFont *)selectFont{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_select_font), selectFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIFont *)selectFont{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_select_font));
}


- (void)setNormalBgc:(UIColor *)normalBgc{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_normal_bgc), normalBgc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)normalBgc{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_normal_bgc));
}
- (void)setSelectBgc:(UIColor *)selectBgc{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_select_bgc), selectBgc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)selectBgc{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_select_bgc));
}

- (void)setNormalBorderColor:(UIColor *)normalBorderColor{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_normal_borderColor), normalBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)normalBorderColor{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_normal_borderColor));
}
- (void)setSelectBorderColor:(UIColor *)selectBorderColor{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_select_borderColor), selectBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)selectBorderColor{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_hrb_select_borderColor));
}


- (UIButton *(^)(void))hrb_autoSelect{
    return ^{
        return self.hrb_select(!self.selected);
    };
}

-(UIButton *(^)(BOOL))hrb_select{
    UIButton *(^a)(BOOL) = ^(BOOL select){
        self.selected = select;
        if (select) {
            if(self.selectFont){
                self.titleLabel.font = self.selectFont;
            }
            if (self.selectBgc) {
                self.backgroundColor = self.selectBgc;
            }
            if (self.selectBorderColor){
                self.layer.borderColor = self.selectBorderColor.CGColor;
            }
        }else{
            if(self.normalFont){
                self.titleLabel.font = self.normalFont;
            }
            if (self.normalBgc) {
                self.backgroundColor = self.normalBgc;
            }
            if (self.normalBorderColor) {
                self.layer.borderColor = self.normalBorderColor.CGColor;
            }
        }
        return self;
    };
    return a;
}
-(UIButton *(^)(UIFont *))hrb_font{
    UIButton *(^a)(UIFont *) = ^(UIFont *font){
        if (!self.isSelected) {
            self.titleLabel.font = font;
        }
        self.normalFont = font;
        return self;
    };
    return  a;
}
-(UIButton *(^)(UIFont *))hrb_font_s{
    UIButton *(^a)(UIFont *) = ^(UIFont *font){
        if (self.isSelected) {
            self.titleLabel.font = font;
        }
        self.selectFont = font;
        return self;
    };
    return  a;
}
-(UIButton *(^)(UIColor *))hrb_bgc{
    UIButton *(^a)(UIColor *) = ^(UIColor *color){
        if (!self.isSelected) {
            self.backgroundColor = color;
        }
        self.normalBgc = color;
        return self;
    };
    return  a;
}
-(UIButton *(^)(UIColor *))hrb_bgc_s{
    UIButton *(^a)(UIColor *) = ^(UIColor *color){
        if (self.isSelected) {
            self.backgroundColor = color;
        }
        self.selectBgc = color;
        return self;
    };
    return  a;
}
-(UIButton *(^)(UIColor *))hrb_borderColor{
    UIButton *(^a)(UIColor *) = ^(UIColor *color){
        if (!self.isSelected) {
            self.layer.borderColor = color.CGColor;
        }
        self.normalBorderColor = color;
        return self;
    };
    return  a;
}
-(UIButton *(^)(UIColor *))hrb_borderColor_s{
    UIButton *(^a)(UIColor *) = ^(UIColor *color){
        if (self.isSelected) {
            self.layer.borderColor = color.CGColor;
        }
        self.selectBorderColor = color;
        return self;
    };
    return  a;
}
- (UIButton *(^)(NSString *))hrb_image{
    UIButton *(^a)(NSString *) = ^(NSString *image){
        [self setImage:HRB_IMG(image) forState:(UIControlStateNormal)];
        return self;
    };
    return a;
}
- (UIButton *(^)(NSString *))hrb_image_s{
    UIButton *(^a)(NSString *) = ^(NSString *image){
        [self setImage:HRB_IMG(image) forState:(UIControlStateSelected)];
        return self;
    };
    return a;
}

-(UIButton *(^)(UIColor *))hrb_textColor{
    UIButton *(^a)(UIColor *) = ^(UIColor *color){
        [self setTitleColor:color forState:(UIControlStateNormal)];
        return self;
    };
    return  a;
}
-(UIButton *(^)(UIColor *))hrb_textColor_s{
    UIButton *(^a)(UIColor *) = ^(UIColor *color){
        [self setTitleColor:color forState:(UIControlStateSelected)];
        return self;
    };
    return  a;
}



-(UIButton *(^)(id target,SEL select))hrb_action{
    UIButton *(^a)(id target,SEL select) = ^(id target,SEL select){
        [self addTarget:target action:select forControlEvents:(UIControlEventTouchUpInside)];
        return self;
    };
    return  a;
}

-(UIButton *(^)(CGFloat))hrb_alignment{
    UIButton *(^a)(CGFloat) = ^(CGFloat type){
        if (type < 0) {
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        if (type == 0) {
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        }
        if (type > 0) {
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        }
        return self;
    };
    return a;
}


-(UIButton *(^)(id obj))hrb_object{
    return ^(id obj){
        [self setBO:obj];
        return self;
    };
}

-(id)hrb_getObject{
    return [self bo];
}


- (void)hrb_timeAction60WithFinish:(void(^)(void))finish{
    [self hrb_timeAction:61 finish:finish];
}

- (void)hrb_timeAction:(int)time finish:(void(^)(void))finish{
    if (time == 0){
        if (finish) {
            finish();
        }
        return;
    }
    if (time == 61) {
        [self changeTime:time];
    }
    __weak typeof(self) _self = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(_self) self = _self;
        if (!self) return;
        [self hrb_timeAction:[self changeTime:time] finish:finish];
    });
}

- (CGFloat)changeTime:(int)time{
    time--;
    [self setTitle:time ? [NSString stringWithFormat:@"%dS",time] : @"重新获取" forState:UIControlStateNormal];
    [self setUserInteractionEnabled:(time == 0)];
    return time;
}
@end
