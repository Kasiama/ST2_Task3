//
//  ViewController.m
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

NSString * const cellReuseId = @"cellReuseId";
NSString * const sectionHeaderReuseId = @"sectionHeaderReuseId";

@interface ViewController ()
@property (strong, nonatomic)  UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Контакты";
    self.tableView = [UITableView new];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellReuseId];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    //self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
                                                  [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                                  [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                                  [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                                                  [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
                                                  ]
         ];
    
}


@end
