//
//  UILabel+hrb.m
//  MyTokenExch
//
//  Created by SZJ on 2022/7/20.
//

#import "UILabel+hrb.h"

@implementation UILabel (hrb)

-(UILabel *(^)(NSString *))hrb_text{
    UILabel *(^a)(NSString *) = ^(NSString *text){
        if (text == nil) text = @"";
        self.text = text;
        return self;
    };
    return  a;
}
-(UILabel *(^)(UIFont *))hrb_font{
    UILabel *(^a)(UIFont *) = ^(UIFont *font){
        self.font = font;
        return self;
    };
    return  a;
}
-(UILabel *(^)(UIColor *))hrb_textColor{
    UILabel *(^a)(UIColor *) = ^(UIColor *color){
        self.textColor = color;
        return self;
    };
    return  a;
}
-(UILabel *(^)(void))hrb_lineZero{
    UILabel *(^a)(void) = ^{
        self.numberOfLines = 0;
        return self;
    };
    return  a;
}

-(UILabel *(^)(CGFloat))hrb_lineSpace{
    UILabel *(^a)(CGFloat) = ^(CGFloat space){
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:space];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, self.text.length)];
        [self setAttributedText:attributedString1];
        return self;
    };
    return a;
}
-(UILabel *(^)(NSString *str,UIColor *,UIFont *))hrb_attrStr{
    UILabel *(^a)(NSString *str,UIColor *,UIFont *) = ^(NSString *str,UIColor *color,UIFont *font){
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        if (attrStr.string == nil) {
            attrStr = [[NSMutableAttributedString alloc] initWithString:self.text];
        }
        NSRange range = [self.text rangeOfString:str];
        if (range.location != NSNotFound) {
            if (color) {
                [attrStr addAttribute:NSForegroundColorAttributeName value:color range:range];
            }
            if (font) {
                [attrStr addAttribute:NSFontAttributeName value:font range:range];
            }
            self.attributedText = attrStr;
        }
        return self;
    };
    return a;
}
-(UILabel *(^)(CGFloat))hrb_alignment{
    UILabel *(^a)(CGFloat) = ^(CGFloat type){
        if (type < 0) {
            self.textAlignment = NSTextAlignmentLeft;
        }
        if (type == 0) {
            self.textAlignment = NSTextAlignmentCenter;
        }
        if (type > 0) {
            self.textAlignment = NSTextAlignmentRight;
        }
        return self;
    };
    return a;
}
- (UILabel *)hrb_scaleSizeToFit{
    self.adjustsFontSizeToFitWidth = YES;
    return self;
}
@end
