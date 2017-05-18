//
//  Chapter2VC.m
//  OpenCV3BookCodes
//
//  Created by Okaylens-Ares on 15/05/2017.
//  Copyright © 2017 Okaylens-Ares. All rights reserved.
//
#include <opencv2/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#import "Chapter3VC.h"
#import "OpenCVUtilities.h"

using namespace cv;

const int g_nMaxAlphaValue = 100;
int g_nAlphaSlider;
double g_dAlphaValue;
double g_dBetaValue;

Mat g_SrcImage1;
Mat g_SrcImage2;
Mat g_DstImage;
Mat croppedImage;
Mat imgROI;

@interface Chapter3VC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *srcImage1;
@property (strong, nonatomic) UIImage *srcImage2;
@property (strong, nonatomic) OpenCVUtilities *tools;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation Chapter3VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fromThreeOrFour];
    self.slider.value = 0.0;

}

- (void)fromThreeOrFour {
    if (self.threeOfFour == Three) {
        self.srcImage1 = [UIImage imageNamed:@"keyhole"];
        self.srcImage2 = [UIImage imageNamed:@"wordpress"];
        self.imageView.image = self.srcImage2;
        self.tools = [[OpenCVUtilities alloc] init];
        g_SrcImage1 = [self.tools cvMatFromUIImage:self.srcImage1];
        g_SrcImage2 = [self.tools cvMatFromUIImage:self.srcImage2];
        //    cvtColor(g_SrcImage1, g_SrcImage1, COLOR_BGR2GRAY);
        //    cvtColor(g_SrcImage2, g_SrcImage2, COLOR_BGR2GRAY);
        
        // croppe image
        //    croppedImage = g_SrcImage2(Rect_<float>(0, 0, 290, 290));
        //    imgROI = g_SrcImage1(Rect_<float>(10, 10, g_SrcImage2.cols - 10, g_SrcImage2.rows - 10));
    }else {
        self.slider.hidden = YES;
    }
}

- (IBAction)sliderValuechanged:(UISlider *)sender {
    g_dAlphaValue = (double)(sender.value * 100) / g_nMaxAlphaValue;
    g_dBetaValue = (1.0 - g_dAlphaValue);
    
    [self addWeighted:g_dBetaValue];
}

- (void)addWeighted:(double)betaValue {
    addWeighted(g_SrcImage1, g_dAlphaValue, g_SrcImage2, g_dBetaValue, 0.0, g_DstImage);
    self.imageView.image = [self.tools UIImageFromCVMat:g_DstImage];
}

@end
