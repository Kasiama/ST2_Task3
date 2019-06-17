//
//  TableViewCell.h
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *tableImageView;
@property (strong, nonatomic) UILabel *urlLabel;
@end

NS_ASSUME_NONNULL_END
