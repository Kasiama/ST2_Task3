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
    NSArray *contentArray = @[@"https://images.wallpapersden.com/image/download/snowboarding-trick-jump_22385_7680x4320.jpg",@"https://wallpapershome.ru/images/wallpapers/the-fourth-phase-7680x4320-5k-4k-8k-trevis-rays-sneg-gori-snoubording-8206.jpg",
                              @"https://rp-wow.ru/upload/000/u85/a2/44/i-6.jpg",
                              @"https://i.pinimg.com/236x/93/f6/9c/93f69c3f9411322ee501fde855f92e4a.jpg",
                              @"https://i.ytimg.com/vi/1toAzHTqdkk/mqdefault.jpg",
                              @"https://img2.akspic.com/fit/125379-iskusstvo-krug-art-dizajn-vizualnoe_iskusstvo-x750.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/1/1f/Bush2.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/c/c0/Alyxia.oliviformis1web.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/8/81/Vincetoxicum_nigrum_03_ies.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/d/dc/Cerbera_odollam.jpg",
                              @"https://pp.userapi.com/c543103/v543103522/22000/Z-baKP-ZVL0.jpg", @"https://pp.userapi.com/c543103/v543103522/21fd3/KdyvF6rEYm4.jpg", @"https://pp.userapi.com/c543103/v543103522/21fdc/hkZVRrUkmBw.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1522161415CuMgcoredwire.jpg",
                              @"https://img3.akspic.com/fit/124066-drop-handheld_devices-water-apple-apples-x750.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1512388027rautomeadcathodemelting.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1512123485rautomeadRMTbilletcastingsilverbandsaw.jpg",
                              @"https://pp.userapi.com/c543100/v543100522/273be/zL1noyD7n_A.jpg", @"https://pp.userapi.com/c543100/v543100522/273c6/I0x7aodqbDY.jpg", @"https://pp.userapi.com/c543103/v543103522/2e1a9/ZpWpu5LmhTA.jpg",
                              @"https://img1.akspic.com/fit/133241-texture-nature-daytime-painting-day-x750.jpg", @"https://img1.akspic.com/image/78600-amerikanskij_koker_spaniel-pes-porody_gruppy_sobak-zivotnoe-rozhdestvenskij_den-2048x1536.jpg",
                              @"https://img2.akspic.com/image/95406-alyaskinskij_malamut-husky-alyaskinskij_haski-labrador-ezdovaya_sobaka-2048x1536.jpg",
                              @"https://img3.akspic.com/image/32308-usy-morda-sobaka-pes-shhenok-2048x1536.jpg",
                              @"https://img2.akspic.com/fit/125379-iskusstvo-krug-art-dizajn-vizualnoe_iskusstvo-x750.jpg",
                              @"https://img1.akspic.com/fit/125448-macbook-apple_masvook_pro-krasnyj_cvet-tekstura-plamya-x750.jpg",
                              @"https://img3.akspic.com/image/3373-koshki-kotenok-porody_sobak-koshki_sfinksy-koshki_i_sobaki-2048x1536.jpg",
                              @"https://cdn.eso.org/images/screen/eso1907b.jpg",
                              @"https://img1.akspic.com/fit/127194-gorodskoj_rajon-chikago-manhetten-metropoliya-zdanie-x750.jpg",
                              @"https://img2.akspic.com/fit/18390-zdanie-metropoliya-dnevnoe_vremya-gorodskoj_pejzazh-chikago-x750.jpg",
                              @"https://img1.akspic.com/fit/18558-orientir-gorodskoj_rajon-neboskreb-empajr_stejt_bilding-gorodskoj_pejzazh-x750.jpg",
                              @"https://img2.akspic.com/fit/131685-wedding_invitation-helmet-pearl-lace-earring-x750.jpg",
                              @"https://pp.userapi.com/c543101/v543101787/36813/ObltXsSC2oE.jpg", @"https://pp.userapi.com/c543101/v543101833/19bf1/S8tEAL7xRmg.jpg", @"https://pp.userapi.com/c543101/v543101787/3681c/AYaVZ7Xam4g.jpg",  @"https://pp.userapi.com/wO3RGr8Abl6XBoa72TpRG1CQFbT5h8F792Cfdw/g9N2NNp7Oo4.jpg", @"https://pp.userapi.com/c636825/v636825533/b15a/QNLNBLCVRx0.jpg",  @"https://pp.userapi.com/c543100/v543100522/292a4/eWc4I4pg6oU.jpg", @"https://sun1.beltelecom-by-minsk.userapi.com/c543100/v543100522/29292/9ajVJbJOriM.jpg", @"https://pp.userapi.com/c543100/v543100522/29289/Lfopu2o59FQ.jpg",  @"https://sun1.beltelecom-by-minsk.userapi.com/c543100/v543100522/2929b/Y7-yiL21odc.jpg", @"https://sun2.beltelecom-by-minsk.userapi.com/c543103/v543103522/21ff7/6SRmo_fHRV8.jpg", @"http://lookw.ru/1/519/1402242539-008.jpg", @"https://sun1.beltelecom-by-minsk.userapi.com/c543103/v543103522/21fee/I7086MVXdZ8.jpg", @"https://pp.userapi.com/c543103/v543103522/21fe5/fslXjzZU4GU.jpg",  @"https://pp.userapi.com/c543103/v543103522/22000/Z-baKP-ZVL0.jpg", @"https://pp.userapi.com/c543103/v543103522/21fd3/KdyvF6rEYm4.jpg", @"https://pp.userapi.com/c543103/v543103522/21fdc/hkZVRrUkmBw.jpg",  @"https://pp.userapi.com/c849428/v849428683/f7ec5/dH1y20Yf58U.jpg", @"https://pp.userapi.com/c845216/v845216622/173480/5D3y0WwC6Rs.jpg",
                              @"https://pp.userapi.com/c543100/v543100522/273be/zL1noyD7n_A.jpg", @"https://pp.userapi.com/c543100/v543100522/273c6/I0x7aodqbDY.jpg", @"https://pp.userapi.com/c543103/v543103522/2e1a9/ZpWpu5LmhTA.jpg",  @"https://sun1-29.userapi.com/c543103/v543103522/2e1a1/7HWelc2m-ig.jpg", @"https://pp.userapi.com/c543103/v543103522/2e171/LGcMARWD_I4.jpg",  @"https://pp.userapi.com/c543103/v543103522/2e191/dROgZeOhpQY.jpg", @"https://pp.userapi.com/c543103/v543103522/2e199/I_fIb15xB9w.jpg", @"https://sun1-29.userapi.com/c543103/v543103522/2e181/gq96dSgcSzQ.jpg",  @"https://sun1.beltelecom-by-minsk.userapi.com/c543101/v543101522/2a01b/ygFyNZGhxAk.jpg", @"https://pp.userapi.com/c543108/v543108172/dd65/5Du7h4JVMUA.jpg"
                              ];
    
    
    
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
