//
//  Chapter1VC.m
//  OpenCV3BookCodes
//
//  Created by Okaylens-Ares on 14/05/2017.
//  Copyright © 2017 Okaylens-Ares. All rights reserved.
//

#include <opencv2/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/videoio/cap_ios.h>
#include <opencv2/imgproc/imgproc.hpp>
#import <UIKit/UIKit.h>
#import "Chapter1VC.h"
#import "OpenCVUtilities.h"

using namespace cv;

@interface Chapter1VC () <CvVideoCameraDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) UIImage *imageToUse;
@property (strong, nonatomic) OpenCVUtilities *tools;
@property (strong, nonatomic) CvVideoCamera *videoCamera;

@end

@implementation Chapter1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tools = [[OpenCVUtilities alloc] init];
    self.imageToUse = [UIImage imageNamed:@"Android-vs-iOS-3D-battle.jpg"];
//    [self erodeImage];
//    [self blurImage];
//    [self cannyImage];
    [self videoStart];
}

- (void)erodeImage {
    Mat srcImage = [self.tools cvMatFromUIImage:self.imageToUse];
    Mat element = getStructuringElement(MORPH_RECT, Size2i(15, 15));
    Mat dstImage;
    erode(srcImage, dstImage, element);
    self.imageView1.image = self.imageToUse;
    self.imageView2.image = [self.tools UIImageFromCVMat:dstImage];
}

- (void)blurImage {
    Mat srcImage = [self.tools cvMatFromUIImage:self.imageToUse];
    Mat dstImage;
    blur(srcImage, dstImage, Size2i(7, 7));
    self.imageView1.image = self.imageToUse;
    self.imageView2.image = [self.tools UIImageFromCVMat:dstImage];
}

- (void)cannyImage {
    Mat srcImage = [self.tools cvMatFromUIImage:self.imageToUse];
    Mat dstImage, edge, grayImage;
    dstImage.create(srcImage.size(), srcImage.type());
    cvtColor(srcImage, grayImage, COLOR_BGR2GRAY);
    blur(grayImage, edge, Size2i(3, 3));
    Canny(edge, edge, 3, 9.3);
    self.imageView1.image = self.imageToUse;
    self.imageView2.image = [self.tools UIImageFromCVMat:edge];
}

- (void)videoStart {
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:self.imageView1];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    
    [self.videoCamera start];
}

#pragma mark - Protocol CvVideoCameraDelegate

- (void)processImage:(cv::Mat &)image {
    // Do some OpenCV stuff with the image
    Mat image_copy;
    cvtColor(image, image_copy, COLOR_BGR2GRAY);
//    // invert image
//    bitwise_not(image_copy, image_copy);
//    //Convert BGR to BGRA (three channel to four channel)
//    Mat bgr;
//    cvtColor(image_copy, bgr, COLOR_GRAY2BGR);
//    cvtColor(bgr, image, COLOR_BGR2BGRA);
    blur(image_copy, image_copy, Size2i(7, 7));
    Canny(image_copy, image, 30, 30);
}

@end
