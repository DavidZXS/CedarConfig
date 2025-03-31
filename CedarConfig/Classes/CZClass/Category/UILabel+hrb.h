//
//  UILabel+hrb.h
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (hrb)

///设置文字
-(UILabel *(^)(NSString *))hrb_text;
///设置字体
-(UILabel *(^)(UIFont *))hrb_font;
///设置字体颜色
-(UILabel *(^)(UIColor *))hrb_textColor;
///设置自动换行
-(UILabel *(^)(void))hrb_lineZero;
///设置行间距
-(UILabel *(^)(CGFloat))hrb_lineSpace;
///设置高亮
-(UILabel *(^)(NSString *str,UIColor *,UIFont *))hrb_attrStr;
///设置显示模式 <0左 =0中 >0右
-(UILabel *(^)(CGFloat))hrb_alignment;
/// 宽度不够 就缩小字体
- (UILabel *)hrb_scaleSizeToFit;
@end

NS_ASSUME_NONNULL_END
