//
//  NSString+hrb.m
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import "NSString+hrb.h"

@implementation NSString (hrb)
- (void(^)(id target,SEL action))hrb_addListener{
    void(^a)(id target,SEL action) = ^(id target,SEL action){
        [NSNotificationCenter.defaultCenter addObserver:target selector:action name:self object:nil];
    };
    return a;
}
- (void(^)(id object))hrb_postToListener{
    void(^a)(id object) = ^(id object){
        [NSNotificationCenter.defaultCenter postNotificationName:self object:object userInfo:nil];
    };
    return a;
}
- (void(^)(id data))hrb_saveToUD{
    void(^a)(id data) = ^(id data){
        if (data) {
            [NSUserDefaults.standardUserDefaults setObject:data forKey:self];
            [NSUserDefaults.standardUserDefaults synchronize];
        }
    };
    return a;
}

- (void)hrb_clearOfUD{
    [NSUserDefaults.standardUserDefaults setObject:nil forKey:self];
    [NSUserDefaults.standardUserDefaults synchronize];
}
- (id)hrb_readFromUD{
    return [NSUserDefaults.standardUserDefaults objectForKey:self];
}
- (NSString *(^)(NSString *))hrb_append{
    NSString *(^a)(NSString *) = ^(NSString *b){
        if (!b) return self;
        return [self stringByAppendingString:b?:@""];
    };
    return a;
}
- (NSString *(^)(int))hrb_charForIndex{
    NSString *(^a)(int) = ^(int b){
        if (b > self.length) return @"";
        return [self substringWithRange:NSMakeRange(b, 1)];
    };
    return a;
}
-(NSArray<NSString *> *)numbers{
    NSArray * arr = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"."];
    if (self.length == 0) return @[];
    NSMutableArray *numbers = @[].mutableCopy;
    NSString *number = @"";
    for (int i = 0; i < self.length; i++) {
        NSString *str = self.hrb_charForIndex(i);
        if ([arr containsObject:str]) {
            number = number.hrb_append(str);
        }else{
            [numbers addObject:number.copy];
            number = @"";
        }
    }
    
    if (number.length > 0 && ![number isEqualToString:@"."]) {
        [numbers addObject:number.copy];
    }
    return numbers;
}
-(NSArray<NSString *> *)units{
    NSArray * arr = @[@"x",@"+",@"-",@"÷"];
    if (self.length == 0) return @[];
    NSMutableArray *numbers = @[].mutableCopy;
    for (int i = 0; i < self.length; i++) {
        NSString *str = self.hrb_charForIndex(i);
        if ([arr containsObject:str]) {
            [numbers addObject:str];
        }
    }
    return numbers;
}


NSDecimalNumber * _CountDecimal(id ot){
    NSDecimalNumber *otNum = nil;
    if ([ot isKindOfClass:NSString.class]) {
        otNum = [(NSString *)ot hrb_decimalNumer];
    }
    if ([ot isKindOfClass:NSNumber.class]) {
        otNum = [(NSNumber *)ot stringValue].hrb_decimalNumer;
    }
    if ([ot isKindOfClass:NSDecimalNumber.class]) {
        otNum = ot;
    }
    
    assert(otNum);
    
    return otNum;
}
- (NSString *(^)(id))hrb_jia{
    
    NSString *(^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_jia(_CountDecimal(ot)).stringValue;
    };
    return a;
}

- (NSString *(^)(id))hrb_jian{
    NSString *(^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_jian(_CountDecimal(ot)).stringValue;
    };
    return a;
}

- (NSString *(^)(id))hrb_cheng{
    NSString *(^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_cheng(_CountDecimal(ot)).stringValue;
    };
    return a;
}

- (NSString *(^)(id))hrb_chu{
    NSString *(^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_chu(_CountDecimal(ot)).stringValue;
    };
    return a;
}

- (BOOL(^)(id))hrb_daYu{
    BOOL (^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_daYu(_CountDecimal(ot));
    };
    return a;
}

- (BOOL(^)(id))hrb_xiaoYu{
    BOOL (^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_xiaoYu(_CountDecimal(ot));
    };
    return a;
}

- (BOOL(^)(id))hrb_dengYu{
    BOOL (^a)(id) = ^(id ot){
        return self.hrb_decimalNumer.hrb_dengYu(_CountDecimal(ot));
    };
    return a;
}
- (NSString *)hrb_half{
    return self.hrb_chu(@"2");
}

- (NSString *)hrb_OneThird{
    return self.hrb_chu(@"3");
}

- (NSString *)hrb_quarter{
    return self.hrb_chu(@"4");
}
- (NSDecimalNumber *)hrb_decimalNumer{
    return [NSDecimalNumber decimalNumberWithString:self];
}

-(UIColor *)hrb_color{
    UIColor *color = [UIColor colorNamed:self];
    if(!color){
        color = HRB_HEX(self);
    }
    return color;
}

- (NSString *)hrb_abs{
    if (self.hrb_daYu(@-1)) {
        return self;
    }else{
        return self.hrb_cheng(@-1);
    }
}

-(NSString *)hrb_phoneXX{
    if(self.length != 11)return self;
    return [self stringByReplacingCharactersInRange:(NSRange){3,4} withString:@"****"];
}

- (NSString *(^)(NSInteger))hrb_accuracy{
    return ^(NSInteger accuraacy){
        if (isinf(self.floatValue)) {
            return self;
        }
        NSString *formatStr = [NSString stringWithFormat:@"%%.%ldf",accuraacy];
        return [NSString stringWithFormat:formatStr,self.floatValue];
    };
}

- (NSString *)hrb_htmlStrCSS{
   return [NSString stringWithFormat:
                      @"<html><head>"
                      "<meta charset=\"UTF-8\" />"
                      "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"/>"
                      "<style type=\"text/css\">"
                      "body{"
                         "background-color:#FFFFFF;"
                      "font-family:'PingFangSC-Regular';"
                      "}"
                      "p{"
                        "word-break:break-all"
                      "}"
                      "img{width:100%%}"
                      "</style></head>"
                      "<body>%@</body>"
                      "</html>", self];
}

// 判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)aStr{
    if (!aStr){
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]){
        return YES;
    }
    if (!aStr.length){
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length){
        return YES;
    }
    return NO;
}

@end


@implementation NSDecimalNumber (hrb)
/// 别看  看就是两个数 相加
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_jia{
    NSDecimalNumber *(^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        return [self decimalNumberByAdding:ot];
    };
    return a;
}
/// 别看  看就是两个数 相减
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_jian{
    NSDecimalNumber *(^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        return [self decimalNumberBySubtracting:ot];
    };
    return a;
}
/// 别看  看就是两个数 相乘
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_cheng{
    NSDecimalNumber *(^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                           decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                           scale:8
                                           raiseOnExactness:NO
                                           raiseOnOverflow:NO
                                           raiseOnUnderflow:NO
                                           raiseOnDivideByZero:YES];
        return [[self decimalNumberByMultiplyingBy:ot] decimalNumberByRoundingAccordingToBehavior:roundUp];
    };
    return a;
}
/// 别看  看就是两个数 相除
- (NSDecimalNumber *(^)(NSDecimalNumber *))hrb_chu{
    NSDecimalNumber *(^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                           decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                           scale:2
                                           raiseOnExactness:NO
                                           raiseOnOverflow:NO
                                           raiseOnUnderflow:NO
                                           raiseOnDivideByZero:YES];
        if (ot.doubleValue == 0) {
            return [[NSDecimalNumber alloc] initWithInt:0];
        }
        return [[self decimalNumberByDividingBy:ot] decimalNumberByRoundingAccordingToBehavior:roundUp];
    };
    return a;
}
/// 别看  看就是前边是不是大于后边
- (BOOL(^)(NSDecimalNumber *))hrb_daYu{
    BOOL (^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        return (BOOL)([self compare:ot] == NSOrderedDescending);
    };
    return a;
}
/// 别看  看就是前边是不是小于后边
- (BOOL(^)(NSDecimalNumber *))hrb_xiaoYu{
    BOOL (^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        return (BOOL)([self compare:ot] == NSOrderedAscending);
    };
    return a;
}
/// 别看  看就是前边是不是等于后边
- (BOOL(^)(NSDecimalNumber *))hrb_dengYu{
    BOOL (^a)(NSDecimalNumber *) = ^(NSDecimalNumber *ot){
        return (BOOL)([self compare:ot] == NSOrderedSame);
    };
    return a;
}

@end
