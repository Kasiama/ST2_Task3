//
//  TableViewCell.h
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CustomTableViewCellDelegate <NSObject>

- (void)didTapImageAtIndex:(UIImage*)image toRow:(NSUInteger)row;
- (void) addLoadedImageToDetailView:(UIImage *)image toRow:(NSInteger)row;

@end

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *tableImageView;
@property (strong, nonatomic) UILabel *urlLabel;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, weak) id<CustomTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
