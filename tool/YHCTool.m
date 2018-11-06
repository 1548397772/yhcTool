

//
//  YHCTool.m
//  angerConstellation
//
//  Created by yhc on 2018/10/10.
//  Copyright © 2018年 yhc. All rights reserved.
//

#import "YHCTool.h"
#import"SVProgressHUD.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#define YHC_LivePath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/livePhoto"]


@implementation YHCTool

/**
 *  @brief 创建返回按钮
 */
+(UIButton*)CreateBackItem
{
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 0, 11, 15)];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    
    return backBtn;
}
/**
 *  @brief 创建右上角导航按钮
 */
+(UIButton*)CreateRightMoreItem
{
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backBtn setImage:[UIImage imageNamed:@"icon-more"] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 11, 0, 15)];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    
    return backBtn;
}

+ (NSString *)getBundleVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *woodv = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return woodv;
}

+ (NSString *)getBundleID {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *woodb = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return woodb;
}

/**
 *  @brief 相机权限
 */
+(BOOL)allowCamera
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        return NO;
    }else  return YES;
}

/// 添加模糊效果
+ (UIVisualEffectView *)YHC_addVisualEffectViewToView:(UIView *)view{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    blurView.frame = view.bounds;
    blurView.alpha = 0.6;
    blurView.layer.cornerRadius = 5;
    blurView.layer.masksToBounds = YES;
    blurView.tag = 999;
    [view addSubview:blurView];
    
    return blurView;
}





+ (void)YHC_checkSizeWithSize:(NSUInteger)size comple:(void (^)(NSString *tosize))comple{
    if (size<1000) {
        comple([NSString stringWithFormat:@"%ldB",size]);
    }else if (size/1000.f<1000){
        comple([NSString stringWithFormat:@"%.2fKB",size/1000.f]);
    }else if (size/1000000.f<1000){
        comple([NSString stringWithFormat:@"%.2fMB",size/1000000.f]);
    }else if (size/1000000000.f<1000){
        comple([NSString stringWithFormat:@"%.2fGB",size/1000000000.f]);
    }else if (size/1000000000000.f<1000){
        comple([NSString stringWithFormat:@"%.2fTB",size/1000000000000.f]);
    }
}


+ (NSString *)YHC_getLivePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:YHC_LivePath]) {
        BOOL isCreateSuccess = [manager createDirectoryAtPath:YHC_LivePath withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"创建文件夹 %d",isCreateSuccess);
    }
    return YHC_LivePath;
}
+ (void)YHC_cleanLiveData {
    NSFileManager *manmager = [NSFileManager defaultManager];
    if ([manmager fileExistsAtPath:YHC_LivePath]) {
        [manmager removeItemAtPath:YHC_LivePath error:nil];
    }
}
+ (void)YHC_cleanLiveTmpData {
    NSFileManager *manmager = [NSFileManager defaultManager];
    NSString *tmpPath = [NSHomeDirectory() stringByAppendingPathComponent:@"/tmp"];
    NSDirectoryEnumerator *enumerator = [manmager enumeratorAtPath:tmpPath];
    for (NSString *fileName in enumerator) {
        [manmager removeItemAtPath:[tmpPath stringByAppendingPathComponent:fileName] error:nil];
    }
}


+ (long long)YHC_liveFolderSize {
    return [self folderSizeAtPath:YHC_LivePath];
}

//遍历文件夹获得文件夹大小，返回字节
+ (long long)folderSizeAtPath:(NSString*)folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])
        return 0;
    NSString* fileName = [folderPath copy];
    long long folderSize = 0;
    
    BOOL isdir;
    [manager fileExistsAtPath:fileName isDirectory:&isdir];
    if (isdir != YES) {
        return [self fileSizeAtPath:fileName];
    }
    else
    {
        NSArray * items = [manager contentsOfDirectoryAtPath:fileName error:nil];
        for (int i =0; i<items.count; i++) {
            BOOL subisdir;
            NSString* fileAbsolutePath = [fileName stringByAppendingPathComponent:items[i]];
            
            [manager fileExistsAtPath:fileAbsolutePath isDirectory:&subisdir];
            if (subisdir==YES) {
                folderSize += [self folderSizeAtPath:fileAbsolutePath]; //文件夹就递归计算
            }
            else
            {
                folderSize += [self fileSizeAtPath:fileAbsolutePath];//文件直接计算
            }
        }
    }
    return folderSize;
}
//单个文件的大小
+ (long long)fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}


+ (NSString *)YHC_parseTimeWithStr:(NSString *)timeStr {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd/MM/yyyy"];
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:[timeStr doubleValue]];
    return [formater stringFromDate:detailDate];
}


+ (NSString *)hi_getLivePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:YHC_LivePath]) {
        BOOL isCreateSuccess = [manager createDirectoryAtPath:YHC_LivePath withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"创建文件夹 %d",isCreateSuccess);
    }
    return YHC_LivePath;
}

+(CGFloat)CalculationLabelWidthWithiOS7LaterMethod:(NSString *)labelText labelHeight:(CGFloat)labelHeight font:(CGFloat)fontSize isBold:(BOOL)bold
{
    UIFont *textFont;
    if (bold == YES) {
        textFont = [UIFont boldSystemFontOfSize:fontSize];
    }else{
        textFont = [UIFont systemFontOfSize:fontSize];
    }
    return [labelText boundingRectWithSize:CGSizeMake(MAXFLOAT, labelHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: textFont} context:nil].size.width;
}

+(CGFloat)CalculationLabelHeightWithiOS7LaterMethod:(NSString *)labelText labelWidth:(CGFloat)labelWidth font:(CGFloat)fontSize isBold:(BOOL)bold
{
    UIFont *textFont;
    if (bold == YES) {
        textFont = [UIFont boldSystemFontOfSize:fontSize];
    }else{
        textFont = [UIFont systemFontOfSize:fontSize];
    }
    return [labelText boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: textFont} context:nil].size.height;
}


//  AES 128 解密
+ (NSString*)YHC_decryptUseAES:(NSString *)str{
    NSData *cipherData = [[NSData alloc] initWithBase64EncodedString:str options:0];
    unsigned char buffer[1024 * 100];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          [@"ft54d7a8q8n97a87" UTF8String],
                                          kCCKeySizeAES128,
                                          [@"1234567890123456" UTF8String],
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024 * 100,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}




@end
