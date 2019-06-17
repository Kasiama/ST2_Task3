//
//  ImageUrlModel.h
//  LoadedImages
//
//  Created by Иван on 6/17/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ImageUrlModel : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *urlString;
@end

NS_ASSUME_NONNULL_END
