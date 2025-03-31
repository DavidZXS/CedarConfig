//
//  UIButton+hrb.h
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (hrb)
/// 复制 按钮的  字体颜色  选中字体颜色 字体大小  选中字体大小
-(UIButton *(^)(UIButton *))hrb_copy;
/// 设置选中状态
-(UIButton *(^)(BOOL))hrb_select;
///  选中状态 取反
- (UIButton *(^)(void))hrb_autoSelect;
///设置文字
-(UIButton *(^)(NSString *))hrb_text;
///设置选中的文字
-(UIButton *(^)(NSString *))hrb_text_s;
///设置字体
-(UIButton *(^)(UIFont *))hrb_font;
///设置 选中字体
-(UIButton *(^)(UIFont *))hrb_font_s;
///设置字体颜色
-(UIButton *(^)(UIColor *))hrb_textColor;
///设置选中字体的颜色
-(UIButton *(^)(UIColor *))hrb_textColor_s;
///设置背景色
-(UIButton *(^)(UIColor *))hrb_bgc;
///设置选中背景色
-(UIButton *(^)(UIColor *))hrb_bgc_s;
///设置图片
- (UIButton *(^)(NSString *))hrb_image;
///设置选中图片
- (UIButton *(^)(NSString *))hrb_image_s;
/// 设置边框颜色
- (UIButton *(^)(UIColor *))hrb_borderColor;
/// 设置 选中的边框颜色
- (UIButton *(^)(UIColor *))hrb_borderColor_s;
///设置显示模式 <0左 =0中 >0右
-(UIButton *(^)(CGFloat))hrb_alignment;
///设置点击事件
-(UIButton *(^)(id target,SEL select))hrb_action;
/// 设置关联 对象
-(UIButton *(^)(id obj))hrb_object;
/// 获取关联 对象
-(id)hrb_getObject;

/// 设置按钮倒计时 (60秒)
- (void)hrb_timeAction60WithFinish:(void(^)(void))finish;
/// 设置按钮倒计时
- (void)hrb_timeAction:(int)time finish:(void(^)(void))finish;
@end
NS_ASSUME_NONNULL_END
