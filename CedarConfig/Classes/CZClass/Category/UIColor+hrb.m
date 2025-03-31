//
//  UIColor+hrb.m
//  KunPengOS
//
//  Created by SZJ on 2024/12/9.
//

#import "UIColor+hrb.h"

@implementation UIColor (hrb)
-(UIColor *(^)(CGFloat))hrb_alpha{
    return ^(CGFloat a){
        return [self colorWithAlphaComponent:a];
    };
}
@end
