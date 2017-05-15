//
//  MainTableViewController.m
//  OpenCV3BookCodes
//
//  Created by Okaylens-Ares on 12/05/2017.
//  Copyright © 2017 Okaylens-Ares. All rights reserved.
//

#import "MainTableViewController.h"
#import "Chapter1VC.h"

@interface MainTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *tableAry;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableAry];
}

- (void)initTableAry {
    NSMutableArray *initAry = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<10; i++) {
        NSString *tableStr = [NSString stringWithFormat:@"CH%ld", (long)i+1];
        [initAry addObject:tableStr];
    }
    self.tableAry = [NSArray arrayWithArray:initAry];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.tableAry[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.chapter = indexPath.row;
    switch (self.chapter) {
        case Chapter1:
            [self performSegueWithIdentifier:@"chapter1" sender:Chapter1];
            break;
        case Chapter2:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter3:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter4:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter5:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter6:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter7:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter8:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter9:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
        case Chapter10:
            [self performSegueWithIdentifier:@"" sender:Chapter1];
            break;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    switch ((NSInteger)sender) {
//        case Chapter1:
//            if ([segue.identifier isEqualToString:@"chapter1"]) {
//                Chapter1VC *vc = segue.destinationViewController;
//            }
//            break;
//            
//        default:
//            break;
//    }
}


@end
