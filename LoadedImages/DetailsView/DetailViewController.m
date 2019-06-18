//
//  DetailViewController.m
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    self.imageView.image = self.image;
     self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    [self.view  addSubview: self.imageView];
   
    [NSLayoutConstraint activateConstraints:@[[self.imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10],
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
                                              [self.view.safeAreaLayoutGuide.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:10],
                                              [self.view.safeAreaLayoutGuide.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:10]]];
}

- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
