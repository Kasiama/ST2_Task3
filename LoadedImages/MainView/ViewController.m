//
//  ViewController.m
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ImageUrlModel.h"
#import "DetailViewController.h"

NSString * const cellReuseId = @"cellReuseId";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,CustomTableViewCellDelegate>

@property (strong, nonatomic)  UITableView *tableView;
@property (strong, nonatomic) NSArray *imageUrlModels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Downloaded Images";
    self.tableView = [UITableView new];
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
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.estimatedRowHeight = 140;
    self.tableView.allowsSelection = NO;
    NSArray *contentArray = @[@"https://images.wallpapersden.com/image/download/snowboard-snow-mountains_22528_7680x4320.jpg",@"https://images.wallpapersden.com/image/download/snowboarding-trick-jump_22385_7680x4320.jpg",@"https://wallpapershome.ru/images/wallpapers/the-fourth-phase-7680x4320-5k-4k-8k-trevis-rays-sneg-gori-snoubording-8206.jpg",@"https://wallpaperaccess.com/full/212746.jpg",@"https://images.techhive.com/images/article/2013/06/fm5-01-xbox-reveal-2013-05-21-100041230-orig.jpg",@"http://spellbound.nu/wp-content/uploads/2011/10/IF-1.jpg",@"https://s1.1zoom.ru/big3/262/Need_for_Speed_Ferrari_445965.jpg",@"https://img1.akspic.com/image/22783-ocean-atmosphere-horizon-coast-shore-3840x2160.jpg",@"https://www.pixel4k.com/wp-content/uploads/2018/09/brooklyn-bridge-blue-sky-buildings-8k_1538069344.jpg",@"https://wallpaperstudio10.com/static/wpdb/wallpapers/3840x2160/192098.jpg",@"https://img1.akspic.com/image/20841-promontory-horizon-dawn-drawing-morning-3840x2160.jpg",@"https://img1.akspic.com/image/20927-capital_city-macbook_pro-tower-skyscraper-horizon-5120x2880.jpg",@"https://img4.goodfon.com/original/10000x5625/2/1d/cold-embrace-starkiteck-kosmos-art.jpg",@"https://wallpapercave.com/wp/wp3837811.jpg", @"https://wallbox.ru/wallpapers/main2/201717/abstrakcia-uzor-svecenie-grafika-figura-3d.jpg", @"https://img1.akspic.com/image/22183-energy-atmosphere-earth-water_resources-water-5120x2880.jpg", @"https://wallpaperaccess.com/full/212746.jpg", @"https://pp.userapi.com/c543103/v543103522/30526/3C1ihzj8d40.jpg", @"https://wallpapercave.com/wp/wp1848541.jpg", @"https://pp.userapi.com/c543103/v543103522/3052f/axm4Rf9YVFc.jpg", @"https://pp.userapi.com/c543103/v543103522/30538/RCE3LjS-W6o.jpg", @"https://pp.userapi.com/c543103/v543103522/30f04/nfHoWCKAEmw.jpg", @"https://pp.userapi.com/c543103/v543103522/30efb/oU-z5R0uICo.jpg", @"https://wallpapercave.com/wp/wp1848554.jpg", @"https://pp.userapi.com/c543103/v543103522/30ef2/qAdoaLDAjgs.jpg", @"https://pp.userapi.com/c543101/v543101522/28e4a/ifD0qQucd0A.jpg", @"https://sun1-86.userapi.com/c543101/v543101522/28e30/zwL_FvlVHPE.jpg", @"https://pp.userapi.com/c836137/v836137037/4d4cd/B_EPRGbXXzg.jpg",@"https://pp.userapi.com/c543101/v543101522/28e53/W97gjCGkqL0.jpg",  @"https://pixelz.cc/wp-content/uploads/2017/11/pynx-nebula-uhd-8k-wallpaper.jpg", @"https://sun9-1.userapi.com/c836137/v836137037/4d4d7/K9q1JZbIM0I.jpg", @"https://pp.userapi.com/c836137/v836137037/4d4e1/82qkXuvA4YQ.jpg", @"https://pp.userapi.com/c543100/v543100522/273b6/lAvtgEoKZL8.jpg", @"https://img2.akspic.com/image/25280-space-universe-atmosphere-cosmos-earth-7680x4320.jpg", @"https://pp.userapi.com/c543100/v543100522/273be/zL1noyD7n_A.jpg", @"https://pp.userapi.com/c543100/v543100522/273c6/I0x7aodqbDY.jpg", @"https://pp.userapi.com/c543103/v543103522/2e1a9/ZpWpu5LmhTA.jpg",  @"https://sun1-29.userapi.com/c543103/v543103522/2e1a1/7HWelc2m-ig.jpg", @"https://pp.userapi.com/c543103/v543103522/2e171/LGcMARWD_I4.jpg",  @"https://pp.userapi.com/c543103/v543103522/2e191/dROgZeOhpQY.jpg", @"https://pp.userapi.com/c543103/v543103522/2e199/I_fIb15xB9w.jpg", @"https://sun1-29.userapi.com/c543103/v543103522/2e181/gq96dSgcSzQ.jpg",  @"https://sun1.beltelecom-by-minsk.userapi.com/c543101/v543101522/2a01b/ygFyNZGhxAk.jpg", @"https://pp.userapi.com/c543108/v543108172/dd65/5Du7h4JVMUA.jpg",  @"https://pp.userapi.com/c543108/v543108554/1502b/rjVqePYOI4Y.jpg", @"https://pp.userapi.com/c543101/v543101787/36813/ObltXsSC2oE.jpg", @"https://pp.userapi.com/c543101/v543101833/19bf1/S8tEAL7xRmg.jpg", @"https://pp.userapi.com/c543101/v543101787/3681c/AYaVZ7Xam4g.jpg",   @"https://pp.userapi.com/wO3RGr8Abl6XBoa72TpRG1CQFbT5h8F792Cfdw/g9N2NNp7Oo4.jpg", @"https://pp.userapi.com/c636825/v636825533/b15a/QNLNBLCVRx0.jpg",  @"https://pp.userapi.com/c543100/v543100522/292a4/eWc4I4pg6oU.jpg", @"https://sun1.beltelecom-by-minsk.userapi.com/c543100/v543100522/29292/9ajVJbJOriM.jpg", @"https://pp.userapi.com/c543100/v543100522/29289/Lfopu2o59FQ.jpg",  @"https://sun1.beltelecom-by-minsk.userapi.com/c543100/v543100522/2929b/Y7-yiL21odc.jpg", @"https://sun2.beltelecom-by-minsk.userapi.com/c543103/v543103522/21ff7/6SRmo_fHRV8.jpg",  @"https://sun1.beltelecom-by-minsk.userapi.com/c543103/v543103522/21fee/I7086MVXdZ8.jpg", @"https://pp.userapi.com/c543103/v543103522/21fe5/fslXjzZU4GU.jpg", @"https://pp.userapi.com/c543103/v543103522/22000/Z-baKP-ZVL0.jpg",  @"https://pp.userapi.com/c849428/v849428683/f7ec5/dH1y20Yf58U.jpg", @"https://pp.userapi.com/c845216/v845216622/173480/5D3y0WwC6Rs.jpg"];
    
    
    
    NSMutableArray *arr = [NSMutableArray new];
    for (NSString *url in contentArray) {
        ImageUrlModel *imageUrlModel = [ImageUrlModel new];
        imageUrlModel.urlString = url;
        imageUrlModel.image = [UIImage imageNamed:@"noImage"];
        [arr addObject:imageUrlModel];
    }
    self.imageUrlModels = arr;
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageUrlModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = (TableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellReuseId forIndexPath:indexPath];
        ImageUrlModel *model = self.imageUrlModels[indexPath.row];
         cell.urlLabel.text = model.urlString;
        cell.row = indexPath.row;
     cell.delegate = self;
    cell.tableImageView.image = model.image;
    if([cell.tableImageView.image isEqual: [UIImage imageNamed:@"noImage"]]){
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            NSURL *url = [NSURL URLWithString:model.urlString];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                if (image) {
                    if ([cell.urlLabel.text isEqualToString:model.urlString]) {
                        cell.tableImageView.image = image;
                    }
                    model.image = image;
                      [self addLoadedImageToDetailView:image toRow:indexPath.row];
                    }
            });
        });
    }
    
    return cell;
}
-(void)didTapImageAtIndex:(UIImage*)image toRow:(NSUInteger)row
{
    
    DetailViewController *vc2  = [[DetailViewController alloc] init];
    vc2.image = image;
    vc2.row = row;
    [self.navigationController pushViewController:vc2 animated:NO];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]
                     atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
}

- (void)addLoadedImageToDetailView:(UIImage *)image toRow:(NSInteger )row{
    if ( [[[self.navigationController topViewController] class] isEqual:[DetailViewController class]]){
        DetailViewController *vc2  = [self.navigationController topViewController];
        if(vc2.row == row){
            vc2.image = image;
            [vc2.imageView removeFromSuperview];
            [vc2 viewDidLoad];
        }
    }
}



@end
