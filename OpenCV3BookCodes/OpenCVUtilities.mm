//
//  OpenCVUtilities.m
//  OpenCV3BookCodes
//
//  Created by Okaylens-Ares on 14/05/2017.
//  Copyright © 2017 Okaylens-Ares. All rights reserved.
//

#include <opencv2/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#import <UIKit/UIKit.h>
#import "OpenCVUtilities.h"

using namespace cv;
using namespace std;

@implementation OpenCVUtilities

#pragma mark - Darwing Methods

- (void)drawEllipse:(Mat)image angle:(double)angle imageFrameWidth:(float)imageFrameWidth {
    int thickness = 2;
    int lineType = 8;
    
    ellipse(image,
            Point_<float>(imageFrameWidth / 2, imageFrameWidth / 2),
            Size_<float>(imageFrameWidth / 4, imageFrameWidth / 16),
            angle,
            0,
            360,
            Scalar(255, 129, 0),
            thickness,
            lineType);
}

- (void)drawFilledCircle:(Mat)image center:(Point_<float>)center imageFrameWidth:(float)imageFrameWidth {
    int thickness = -1;
    int lineType = 8;
    
    circle(image,
           center,
           imageFrameWidth / 32,
           Scalar(0, 0, 255),
           thickness,
           lineType);
}

- (void)drawPolygon:(Mat)image imageFrameWidth:(float)imageFrameWidth {
    int lineType = 8;
    
    Point_<float> rookPoints[1][20];
}

#pragma mark - Image Convert

- (Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    return cvMat;
}

- (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
    CGColorSpaceRef colorSpace;
    
    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(cvMat.cols,                                 //width
                                        cvMat.rows,                                 //height
                                        8,                                          //bits per component
                                        8 * cvMat.elemSize(),                       //bits per pixel
                                        cvMat.step[0],                            //bytesPerRow
                                        colorSpace,                                 //colorspace
                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
                                        provider,                                   //CGDataProviderRef
                                        NULL,                                       //decode
                                        false,                                      //should interpolate
                                        kCGRenderingIntentDefault                   //intent
                                        );
    
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return finalImage;
}

@end
