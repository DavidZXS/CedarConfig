//
//  UIColor+hrb.h
//  KunPengOS
//
//  Created by SZJ on 2024/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (hrb)
-(UIColor *(^)(CGFloat))hrb_alpha;
@end

NS_ASSUME_NONNULL_END
