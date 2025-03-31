//
//  NSString+hrb.h
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (hrb)
/// 添加通知
- (void(^)(id target,SEL action))hrb_addListener;
/// 发送通知
- (void(^)(id object))hrb_postToListener;
/// 存储到 userDefault
- (void(^)(id data))hrb_saveToUD;
/// 从 userDefault 取出
- (id)hrb_readFromUD;
/// 从 userDefault 删除
- (void)hrb_clearOfUD;
/// 字符串拼接
- (NSString *(^)(NSString *))hrb_append;
/// 获取字符串的某一个字符
- (NSString *(^)(int))hrb_charForIndex;
/// 字符串里面的数字数组
- (NSArray <NSString *>*)numbers;
/// 字符串里面的计算符号
- (NSArray<NSString *> *)units;
/// 别问  问就是两个数 相加
/// 可传 NSString、NSNumber、NSDecimalNumber
- (NSString *(^)(id))hrb_jia;
/// 别问  问就是两个数 相减
/// 可传 NSString、NSNumber、NSDecimalNumber
- (NSString *(^)(id))hrb_jian;
/// 别问  问就是两个数 相乘
/// 可传 NSString、NSNumber、NSDecimalNumber
- (NSString *(^)(id))hrb_cheng;
/// 别问  问就是两个数 相除
/// 可传 NSString、NSNumber、NSDecimalNumber
- (NSString *(^)(id))hrb_chu;
/// 别问  问就是前边是否大于后边
/// 可传 NSString、NSNumber、NSDecimalNumber
- (BOOL(^)(id))hrb_daYu;
/// 别问  问就是前边是否小于后边
/// 可传 NSString、NSNumber、NSDecimalNumber
- (BOOL(^)(id))hrb_xiaoYu;
/// 别问  问就是前边是否等于后边
/// 可传 NSString、NSNumber、NSDecimalNumber
- (BOOL(^)(id))hrb_dengYu;
/// 别问  问就是二分之一
- (NSString *)hrb_half;
/// 别问  问就是三分之一
- (NSString *)hrb_OneThird;
/// 别问  问就是四分之一
- (NSString *)hrb_quarter;
/// 生成颜色
- (UIColor *)hrb_color;

- (NSString *)hrb_abs;

- (NSString *)hrb_phoneXX;

- (NSString *)hrb_htmlStrCSS;

- (NSString *(^)(NSInteger))hrb_accuracy;

/// 判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)aStr;
@end

@interface NSDecimalNumber (hrb)
/// 别看  看就是两个数 相加
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_jia;
/// 别看  看就是两个数 相减
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_jian;
/// 别看  看就是两个数 相乘
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_cheng;
/// 别看  看就是两个数 相除
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_chu;
/// 别看  看就是前边是否大于后边
- (BOOL(^)(NSDecimalNumber *))hrb_daYu;
/// 别看  看就是前边是否小于后边
- (BOOL(^)(NSDecimalNumber *))hrb_xiaoYu;
/// 别看  看就是前边是否等于后边
- (BOOL(^)(NSDecimalNumber *))hrb_dengYu;
@end
NS_ASSUME_NONNULL_END
