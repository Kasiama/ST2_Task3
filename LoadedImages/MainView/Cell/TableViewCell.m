//
//  TableViewCell.m
//  LoadedImages
//
//  Created by Иван on 6/15/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tableImageView = [UIImageView new];
        [self addSubview:self.tableImageView];
        self.tableImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.tableImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20],
                                                  [self.tableImageView.heightAnchor constraintEqualToConstant:100],
                                                  [self.tableImageView.widthAnchor constraintEqualToConstant:200],
                                                  [self.tableImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                                  [self.heightAnchor constraintGreaterThanOrEqualToAnchor:self.tableImageView.heightAnchor multiplier:1.0 constant:40],
                                                  ]
         ];
        
        self.urlLabel = [UILabel new];
        self.urlLabel.numberOfLines = 0;
        [self addSubview:self.urlLabel];
        self.urlLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.urlLabel.leadingAnchor constraintEqualToAnchor:self.tableImageView.trailingAnchor constant:20],
                                                  [self.urlLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20],
                                                  [self.urlLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:20],
                                                  [self.urlLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-20]
                                                  ]
         ];
        
        
        
        
        
        
        
         [self.tableImageView setUserInteractionEnabled:YES];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(didTapImage:)];
        tapGesture.numberOfTapsRequired = 1;
        [self.tableImageView addGestureRecognizer:tapGesture];
        
        
        
    }
    return self;
}
- (void)didTapImage:(UITapGestureRecognizer *)gesture
{
    if (_delegate) {
        [_delegate didTapImageAtIndex:self.tableImageView.image toRow:self.row];
        
    }
}

@end
