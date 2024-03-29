//
//  DetailViewController.h
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property UIImageView *imageView;
@property UIImage *image;
@property (assign,nonatomic) NSInteger row;
@end

NS_ASSUME_NONNULL_END
