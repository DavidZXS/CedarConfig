//
//  CZMacro.h
//  TestAdd
//
//  Created by Cedar on 2025/3/31.
//

#ifndef CZMacro_h
#define CZMacro_h

#define CZ_YES @"yes"
#define CZ_NO @"no"

#define CZ_UID [NSUserDefaults.standardUserDefaults objectForKey:@"CZ_UID"]

#define CZ_UID_SAVE(x)\
[NSUserDefaults.standardUserDefaults setObject:x forKey:@"CZ_UID"];\
[NSUserDefaults.standardUserDefaults synchronize];\

#define CZ_TOKEN [NSUserDefaults.standardUserDefaults objectForKey:@"CZ_TOKEN"]

#define CZ_TOKEN_SAVE(x)\
[NSUserDefaults.standardUserDefaults setObject:x forKey:@"CZ_TOKEN"];\
[NSUserDefaults.standardUserDefaults synchronize];\

#define CZ_FONT(x)  [UIFont systemFontOfSize:x]

#define CZ_BOLD(x)  [UIFont boldSystemFontOfSize:x]

#define CZ_MEDIUM(x)  [UIFont systemFontOfSize:x weight:(UIFontWeightMedium)]

#define LOAD_IMG(imgName)   [UIImage imageNamed:imgName]

#define CZ_RGB(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define CZ_HEX(f) [UIColor colorWithHexString:f]

#define CZColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

#define WhiteColor             CZColor(0xffffff)
#define BlackColor             CZColor(0x000000)
#define TextColor              CZColor(0x222222)
#define BgColor                CZColor(0xf5f5f5)
#define ThemeColor             CZColor(0xFD5C20)

#define X_TABBAR(f) [AdapterForXIB cc_FrameForX:(f)]

#define CZ_NAV(f) [AdapterForXIB cc_FrameForNavX:(f)]

#define W(f) ((f) * [UIScreen mainScreen].bounds.size.width / 375)

#define CZ_COLOR(f) [UIColor colorNamed:f]

#ifdef DEBUG
#define LC_LOG(format, ...) printf("\n\n------富强、民主、文明、和谐、自由、平等\n\n🇨🇳类: <%p %s:(%d) >🇨🇳\n🇨🇳方法: %s 🇨🇳\n🇨🇳打印内容:\n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:( format @"                         \n🇨🇳\n------公正、法治、爱国、敬业、诚信、友善\n"), ##__VA_ARGS__] UTF8String] )
#else
#define LC_LOG(format, ...)
#endif


#define HRB_GET_PHOTO \
void(^getImage)(UIImagePickerControllerSourceType type) = ^(UIImagePickerControllerSourceType type){\
    \
    dispatch_async(dispatch_get_main_queue(), ^{\
        UIImagePickerController *imageVC = [[UIImagePickerController alloc]init];\
        imageVC.sourceType = type;\
        imageVC.delegate = self;\
        imageVC.allowsEditing = NO;\
        if (@available(iOS 11, *)) {\
            UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;\
        }\
        if (@available(iOS 13,*)) {\
            imageVC.modalPresentationStyle = UIModalPresentationFullScreen;\
        }\
        dispatch_async(dispatch_get_main_queue(), ^{\
            [self presentViewController:imageVC animated:NO completion:nil];\
        });\
    });\
};\
\
\
UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];\
UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {\
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {\
        if (granted){\
            AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];\
            if (videoAuthStatus == AVAuthorizationStatusNotDetermined) {\
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {\
                    if (granted){\
                        getImage(UIImagePickerControllerSourceTypeCamera);\
                    }\
                }];\
            }else if(videoAuthStatus == AVAuthorizationStatusRestricted || videoAuthStatus == AVAuthorizationStatusDenied) {\
            }else{\
                getImage(UIImagePickerControllerSourceTypeCamera);\
            }\
        }else {\
        }\
    }];\
}];\
UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {\
    PHAuthorizationStatus photoAuthStatus = [PHPhotoLibrary authorizationStatus];\
    if (photoAuthStatus == PHAuthorizationStatusNotDetermined) {\
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {\
            if(status == PHAuthorizationStatusAuthorized) {\
                getImage(UIImagePickerControllerSourceTypePhotoLibrary);\
            }\
        }];\
    }else if(photoAuthStatus == PHAuthorizationStatusRestricted || photoAuthStatus == PHAuthorizationStatusDenied) { }else{\
        getImage(UIImagePickerControllerSourceTypePhotoLibrary);\
    }\
}];\
\
UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {\
    \
}];\
[alert addAction:action1];\
[alert addAction:action2];\
\
[alert addAction:action3];\
\
[self presentViewController:alert animated:YES completion:nil];



/*
   格式  yyyy-MM-dd-HH-mm-ss
 */
 /// xxxx
static NSString * _Nonnull HRBTimeFormat_Y =  @"yyyy";
/// xxxx-xx
static NSString * _Nonnull HRBTimeFormat_YM =  @"yyyy-MM";
///  xxxx-xx-xx
static NSString * _Nonnull HRBTimeFormat_YMD = @"yyyy-MM-dd";
/// xxxx-xx-xx xx
static NSString * _Nonnull HRBTimeFormat_YMD_H = @"yyyy-MM-dd HH";
///xxxx-xx-xx xx:xx
static NSString * _Nonnull HRBTimeFormat_YMD_HM = @"yyyy-MM-dd HH:mm";
///xxxx-xx-xx xx:xx:xx
static NSString * _Nonnull HRBTimeFormat_YMD_HMS = @"yyyy-MM-dd HH:mm:ss";
///xx:xx
static NSString * _Nonnull HRBTimeFormat_HM = @"HH:mm";
/// xx-xx
static NSString * _Nonnull HRBTimeFormat_MD = @"MM-dd";
///xx-xx xx:xx
static NSString * _Nonnull HRBTimeFormat_MD_HM = @"MM-dd HH:mm";
///xxxx年
static NSString * _Nonnull HRBTimeFormat_CN_Y = @"yyyy年";
///xxxx年xx月
static NSString * _Nonnull HRBTimeFormat_CN_YM = @"yyyy年MM月";
///xxxx年xx月xx日
static NSString * _Nonnull HRBTimeFormat_CN_YMD = @"yyyy年MM月dd日";
///xxxx年xx月xx日 xx时
static NSString * _Nonnull HRBTimeFormat_CN_YMD_H = @"yyyy年MM月dd日 HH时";
///xxxx年xx月xx日 xx时xx分
static NSString * _Nonnull HRBTimeFormat_CN_YMD_HM = @"yyyy年MM月dd日 HH时mm分";
///xxxx年xx月xx日 xx时xx分xx秒
static NSString * _Nonnull HRBTimeFormat_CN_YMD_HMS = @"yyyy年MM月dd日 HH时mm分ss秒";

#endif /* CZMacro_h */
