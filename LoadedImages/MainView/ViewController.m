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
    self.tableView.estimatedRowHeight = 140;
    NSArray *contentArray = @[@"https://psv4.userapi.com/c848136/u113494084/docs/d14/46db6f8bd708/8K_Ultra_187.jpg?extra=U70R7vsemmk78iSf8JI6NJ7SSpgjWDdvHuq7sP6EeSVewCNaPngQr4g5BLIMPD8pIEYJ66exTWeBzGcWegU3CCg8E3LegxxPWtgePSBaAExDu-G3nx-RBgNpkq5G80ARv70h_ziZAPVaA-Hrqt6H2_0",
                              @"https://99px.ru/sstorage/53/2017/11/mid_212524_541981.jpg",
                              @"https://avatars.mds.yandex.net/get-pdb/875592/6f37fac8-bf0f-4dd3-9d5a-7f96dfc45f94/orig",
                              @"https://oboitut.com/uploads/posts/oboitut.com_2104.jpg",
                              @"https://apod.nasa.gov/apod/image/1906/N00172886_92_beltramini.jpg",
                              @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23268_hires.jpg",
                              @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23273_hires.jpg",
                              @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA22948_hires.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1522251890RT650bronzeholows.jpg",
                              @"https://static9.depositphotos.com/1064045/1188/i/450/depositphotos_11889482-stock-photo-butterfly.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg",
                              @"https://fr.wikipedia.org/wiki/Géomorphologie#/media/Fichier:Earth_surface_NGDC_2000.jpg",
                              @"https://klike.net/uploads/posts/2019-03/medium/1551512888_2.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/1/13/Large_clematis_%28red%29.JPG",
                              @"https://upload.wikimedia.org/wikipedia/commons/c/c4/Ferrofluid_large_spikes.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/4/4e/Mammillaria_prolifera20100407_076.jpg",
                              @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUpO_H66DVzAjA_eWn8FJ1Ohq96fzHJx5XYchlhDs2PsKkmEDFdw",
                              @"https://cdn.humoraf.ru/wp-content/uploads/2018/09/dobryj-den-kartinki-krasivye-humoraf.ru-98.jpg",
                              @"https://zasmeshi.ru/data/caricature/big/4416-Kogda-reshil-otkryt-svoj-biznes.jpg",
                              @"https://thumbs.dreamstime.com/t/%D0%B7%D0%B0%D1%80%D0%B5%D0%B2%D0%BE-%D1%83%D1%82%D1%80%D0%B0-46258043.jpg",
                              @"https://img1.akspic.com/fit/127194-gorodskoj_rajon-chikago-manhetten-metropoliya-zdanie-x750.jpg",
                              @"https://img2.akspic.com/fit/18390-zdanie-metropoliya-dnevnoe_vremya-gorodskoj_pejzazh-chikago-x750.jpg",
                              @"https://img1.akspic.com/fit/18558-orientir-gorodskoj_rajon-neboskreb-empajr_stejt_bilding-gorodskoj_pejzazh-x750.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/7/72/Spilanthes-closeup-large.jpg",
                              @"https://bipbap.ru/wp-content/uploads/2017/09/0_1b7c09_506f1271_XL.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1522161415CuMgcoredwire.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1512388027rautomeadcathodemelting.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1512123485rautomeadRMTbilletcastingsilverbandsaw.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1512122971rautomeadRS25008mmbrasswire.jpg",
                              @"https://www.rautomead.com/uploads/images/gallery/1512122354rautomeadgoldbondingwirerod99.999.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/5/5f/Adenium_obesum_%28Kyoto_Botanical_Garden%29.JPG",
                              @"https://loremflickr.com/cache/resized/65535_33744143688_3cac5ed48c_320_240_g.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/1/1f/Bush2.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/c/c0/Alyxia.oliviformis1web.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/8/81/Vincetoxicum_nigrum_03_ies.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/d/dc/Cerbera_odollam.jpg",
                              @"https://loremflickr.com/cache/resized/201_442017130_5b94c644c9_320_240_nofilter.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/4/42/Mimulopsis_violacea%2C_a_characteristic_plant_of_the_upper_forest_in_Equatorial_Africa.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/a/ac/Systema_Naturae_cover.jpg",
                              @"https://upload.wikimedia.org/wikipedia/commons/f/fd/Beli-hibiskus.jpg",
                              @"https://img1.akspic.com/fit/48325-sneg-alpy-oblako-zamorazhivanie-gornyj_relef-x750.jpg",
                              @"https://img1.akspic.com/fit/127583-vysokij_korabl-korablekrushenie-more-galeon-parusnik-x750.jpg",
                              @"https://img1.akspic.com/fit/127533-pervyj_kurs-burya-manilskij_galeon-tryum_polnyj-parusnaya_shlyupka-x750.jpg",
                              @"https://img3.akspic.com/fit/93920-brig-brigantina-barka-parusnik-yahta-x750.jpg",
                              @"https://img2.akspic.com/fit/125576-elektronnoe_ustrojstvo-tehnologia-microsoft_poverhnost-svet-kabel-x750.jpg",
                              @"https://img2.akspic.com/fit/125379-iskusstvo-krug-art-dizajn-vizualnoe_iskusstvo-x750.jpg",
                              @"https://loremflickr.com/cache/resized/65535_33744143688_3cac5ed48c_320_240_g.jpg",
                              @"https://loremflickr.com/cache/resized/7879_46612728145_91f14bd25c_320_240_g.jpg",
                              @"https://img1.akspic.com/fit/125448-macbook-apple_masvook_pro-krasnyj_cvet-tekstura-plamya-x750.jpg",
                              @"https://img3.akspic.com/image/3373-koshki-kotenok-porody_sobak-koshki_sfinksy-koshki_i_sobaki-2048x1536.jpg",
                              @"https://cdn.eso.org/images/screen/eso1907b.jpg",
                              @"https://v-kosmose.com/wp-content/uploads/2015/01/M104_ngc4594_sombrero_galaxy_hi-res.jpg",
                              @"https://img2.akspic.com/image/9929-velsh_springer_spaniel-spaniel_klamber-anglijskij_koker_spaniel-anglijskij_springer_spaniel-novoshotlandskij_retriver-2048x1536.jpg",
                              @"https://img1.akspic.com/image/78600-amerikanskij_koker_spaniel-pes-porody_gruppy_sobak-zivotnoe-rozhdestvenskij_den-2048x1536.jpg",
                              @"https://img2.akspic.com/image/32372-privlekatelnost-meh-morda-usy-kotenok-2048x1536.jpg",
                              @"https://img2.akspic.com/image/95406-alyaskinskij_malamut-husky-alyaskinskij_haski-labrador-ezdovaya_sobaka-2048x1536.jpg",
                              @"https://img3.akspic.com/image/32308-usy-morda-sobaka-pes-shhenok-2048x1536.jpg",
                              @"https://loremflickr.com/cache/resized/7879_32371004727_b45f061741_320_240_nofilter.jpg",
                              @"https://loremflickr.com/cache/resized/7871_46491920275_fcc6b968dd_n_320_240_nofilter.jpg",
                              @"https://loremflickr.com/cache/resized/65535_47709833542_5efac91d69_320_240_nofilter.jpg"
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
        cell.tableImageView.image = model.image;
    
    return cell;
}
-(void)didTapImageAtIndex:(UIImage*)image toRow:(NSUInteger)row
{
    
    DetailViewController *vc2  = [[DetailViewController alloc] init];
    vc2.image = image;
    vc2.row = row;
    [self.navigationController pushViewController:vc2 animated:NO];
}

- (void)addLoadedImageToDetailView:(UIImage *)image toRow:(NSInteger )row{
    if ( [[[self.navigationController topViewController] class] isEqual:[DetailViewController class]]){
        DetailViewController *vc2  = [self.navigationController topViewController];
        if(vc2.row == row){
            vc2.image = image;
            [vc2 viewDidLoad];
        }
    }
}

@end
