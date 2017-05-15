//
//  OpenCVUtilities.h
//  OpenCV3BookCodes
//
//  Created by Okaylens-Ares on 14/05/2017.
//  Copyright © 2017 Okaylens-Ares. All rights reserved.
//

#include <opencv2/core.hpp>
#import <Foundation/Foundation.h>

using namespace cv;

@interface OpenCVUtilities : NSObject

- (Mat)cvMatFromUIImage:(UIImage *)image;
- (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;

@end
