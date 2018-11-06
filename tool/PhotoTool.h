//
//  PhotoTool.h
//  ceshi
//
//  Created by yhc on 2018/11/6.
//  Copyright © 2018 yhc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^ResultPath)( NSString *filePath, NSString *fileName);

@interface PhotoTool : NSObject

+ (void)yhc1getVideoPathFromPHAsset:(PHAsset *)asset Complete:(ResultPath)result;

/**
 普通的截图   该API仅可以在未使用layer和OpenGL渲染的视图上使用   @return 截取的图片
 */
+ (UIImage *)YHC_nomalSnapshotImage:(UIView *)view;

/**
 针对有用过OpenGL渲染过的视图截图  @return 截取的图片
 */
+ (UIImage *)YHC_openglSnapshotImage:(UIView *)view;

+ (void)YHC_savePhoto:(UIImage *)image;

/**
 *  用来处理图片翻转90度
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;

#pragma mark - 判断人脸
+ (NSArray *)leftEyePositionsWithImage:(UIImage *)sImage;

@end

NS_ASSUME_NONNULL_END
