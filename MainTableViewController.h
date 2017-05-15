//
//  MainTableViewController.h
//  OpenCV3BookCodes
//
//  Created by Okaylens-Ares on 12/05/2017.
//  Copyright © 2017 Okaylens-Ares. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Chapter) {
    Chapter1,
    Chapter2,
    Chapter3,
    Chapter4,
    Chapter5,
    Chapter6,
    Chapter7,
    Chapter8,
    Chapter9,
    Chapter10,
};

@interface MainTableViewController : UITableViewController

@property (nonatomic) Chapter chapter;

@end
