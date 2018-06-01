//
//  UIImage+Addition.m
//  loan
//
//  Created by ChenYanping on 12/11/15.
//  Copyright © 2015 renxin. All rights reserved.
//

#import "UIImage+Addition.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"


@implementation UIImage (Addition)


- (UIImage *)drawImageWithBackgroudColor:(UIColor *)color withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);

    CGRect newImageRect = CGRectMake(size.width / 2 - self.size.width / 2, (size.height - self.size.height) / 2, self.size.width, self.size.height);

    UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
    [color set];
    UIRectFill(CGRectMake(0.0, 0.0, temp.size.width, temp.size.height));
    [self drawInRect:newImageRect];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

// Returns a copy of this image that is cropped to the given bounds.
// The bounds will be adjusted using CGRectIntegral.
// This method ignores the image's imageOrientation setting.
- (UIImage *)croppedImage:(CGRect)bounds {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], bounds);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];

    CGImageRelease(imageRef);
    return croppedImage;
}

+ (UIImage *)backgroundPlaceHolerView:(CGSize)size {
    UIImage *image = [UIImage imageNamed:@"default_image"];
    return [image drawImageWithBackgroudColor:[UIColor grayColor] withSize:size];
}

//存图片
+ (void)saveImageWithURL:(NSString *)url {
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString *urlString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet whitespaceCharacterSet]];
    [manager downloadImageWithURL:[NSURL URLWithString:urlString] options:SDWebImageRetryFailed | SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
 
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        __block UIImage *image2;
        if (!image) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                
                //通知主线程刷新
                dispatch_async(dispatch_get_main_queue(), ^{
                    image2 = [UIImage imageWithData:data];
                    [[SDImageCache sharedImageCache] storeImage:image2 forKey:urlString];
                });
            });
        }
    }];
}

//取图片 必须是urlEncode过的链接
+ (UIImage *)getImageFromURL:(NSString *)fileURL {
    NSString *urlString = [fileURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet whitespaceCharacterSet]];
    return [[SDImageCache sharedImageCache ] imageFromMemoryCacheForKey:urlString];
}

// Returns a rescaled copy of the image, taking into account its orientation
// The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality {
    BOOL drawTransposed;
    
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            drawTransposed = YES;
            break;
            
        default:
            drawTransposed = NO;
    }
    
    return [self resizedImage:newSize
                    transform:[self transformForOrientation:newSize]
               drawTransposed:drawTransposed
         interpolationQuality:quality];
}


- (UIImage *)resizedImage:(CGSize)newSize
                transform:(CGAffineTransform)transform
           drawTransposed:(BOOL)transpose
     interpolationQuality:(CGInterpolationQuality)quality {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGRect transposedRect = CGRectMake(0, 0, newRect.size.height, newRect.size.width);
    CGImageRef imageRef = self.CGImage;
    //NSLog(@"%f %f",newRect.size.width,newRect.size.height);
    // Build a context that's the same dimensions as the new size
    //CGColorSpaceRef genericColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                newRect.size.width,
                                                newRect.size.height,
                                                CGImageGetBitsPerComponent(imageRef), (4 * newRect.size.width),
                                                //,
                                                //0,
                                                CGImageGetColorSpace(imageRef),
                                                kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst
                                                );
    
    // Rotate and/or flip the image if required by its orientation
    CGContextConcatCTM(bitmap, transform);
    
    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(bitmap, quality);
    
    // Draw into the context; this scales the image
    CGContextDrawImage(bitmap, transpose ? transposedRect : newRect, imageRef);
    
    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(bitmap);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    // Clean up
    CGContextRelease(bitmap);
    CGImageRelease(newImageRef);
    
    return newImage;
}


// Returns an affine transform that takes into account the image orientation when drawing a scaled image
- (CGAffineTransform)transformForOrientation:(CGSize)newSize {
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:           // EXIF = 3
        case UIImageOrientationDownMirrored:   // EXIF = 4
            transform = CGAffineTransformTranslate(transform, newSize.width, newSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:           // EXIF = 6
        case UIImageOrientationLeftMirrored:   // EXIF = 5
            transform = CGAffineTransformTranslate(transform, newSize.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:          // EXIF = 8
        case UIImageOrientationRightMirrored:  // EXIF = 7
            transform = CGAffineTransformTranslate(transform, 0, newSize.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:     // EXIF = 2
        case UIImageOrientationDownMirrored:   // EXIF = 4
            transform = CGAffineTransformTranslate(transform, newSize.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:   // EXIF = 5
        case UIImageOrientationRightMirrored:  // EXIF = 7
            transform = CGAffineTransformTranslate(transform, newSize.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        default:
            break;
    }
    
    return transform;
}

@end
