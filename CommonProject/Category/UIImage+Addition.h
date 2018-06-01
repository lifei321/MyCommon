//
//  UIImage+Addition.h
//  loan
//
//  Created by ChenYanping on 12/11/15.
//  Copyright © 2015 renxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

/**
 *  UIIamge 带背景色
 *
 *  @param color 背景色
 *  @param size  画布大小
 *
 *  @return 新的UIImage
 */
- (UIImage *)drawImageWithBackgroudColor:(UIColor *)color withSize:(CGSize)size;

/**
 *  指定大小切图
   // Returns a copy of this image that is cropped to the given bounds.
   // The bounds will be adjusted using CGRectIntegral.
   // This method ignores the image's imageOrientation setting.

 *
 *  @param bounds
 *
 *  @return
 */
- (UIImage *)croppedImage:(CGRect)bounds;

/**
 *  图片默认背景图
 *
 *  @param size 大小
 *
 *  @return UIIamge
 */
+ (UIImage *)backgroundPlaceHolerView:(CGSize)size;

/**
 *  根据url 去下载图片 并且存储
 *
 *  @param url
 */
+ (void)saveImageWithURL:(NSString *)url;


/**
 *  根据url 去获取图片
 *
 *  @param fileURL
 *
 *  @return
 */
+ (UIImage *)getImageFromURL:(NSString *)fileURL ;

// Returns a rescaled copy of the image, taking into account its orientation
// The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

@end
