//
//  YHCTool.h
//  angerConstellation
//
//  Created by yhc on 2018/10/10.
//  Copyright © 2018年 yhc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN
@interface YHCTool : NSObject
+(BOOL)allowCamera;
+ (NSString *)getBundleID;
+ (NSString *)getBundleVersion;
+(CGFloat)CalculationLabelWidthWithiOS7LaterMethod:(NSString *)labelText labelHeight:(CGFloat)labelHeight font:(CGFloat)fontSize isBold:(BOOL)bold;
+(CGFloat)CalculationLabelHeightWithiOS7LaterMethod:(NSString *)labelText labelWidth:(CGFloat)labelWidth font:(CGFloat)fontSize isBold:(BOOL)bold;


/// 添加模糊效果
+ (UIVisualEffectView *)YHC_addVisualEffectViewToView:(UIView *)view;

+ (long long)YHC_liveFolderSize;

+ (void)YHC_checkSizeWithSize:(NSUInteger)size comple:(void (^)(NSString *tosize))comple;

+ (NSString *)YHC_getLivePath;

+ (void)YHC_cleanLiveData;

+ (void)YHC_cleanLiveTmpData;

+ (NSString *)YHC_parseTimeWithStr:(NSString *)timeStr;

+ (NSString *)hi_getLivePath;

+ (NSString*)YHC_decryptUseAES:(NSString *)str;






@end

NS_ASSUME_NONNULL_END
