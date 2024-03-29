//
//  CUBNoFriendTableViewCell.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBNoFriendTableViewCell.h"

@interface CUBNoFriendTableViewCell()

@property (nonatomic, strong) UIImageView *noFriendImageView;
@property (nonatomic, strong) UILabel *noFriendLabel;
@property (nonatomic, strong) UIButton *addButton;

@end

@implementation CUBNoFriendTableViewCell

- (void)setupUI {
    
    [super setupUI];
    
    self.noFriendImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noFriend"]];
    [self.contentView addSubview:self.noFriendImageView];
    
    self.noFriendLabel = [[UILabel alloc] init];
    self.noFriendLabel.text = @"就從加好友開始吧：）";
    self.noFriendLabel.textAlignment = NSTextAlignmentCenter;
    self.noFriendLabel.font = [UIFont boldSystemFontOfSize:21];
    [self.contentView addSubview:self.noFriendLabel];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setTitle:@"加好友" forState:UIControlStateNormal];
    [self.addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    self.addButton.layer.cornerRadius = 20;
    self.addButton.layer.masksToBounds = YES;
    self.addButton.titleEdgeInsets = UIEdgeInsetsMake(0, -27, 0, 0);
    self.addButton.imageEdgeInsets = UIEdgeInsetsMake(0, 160, 0, 0);
    [self.contentView addSubview:self.addButton];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.noFriendImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@245);
        make.height.equalTo(@172);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(40);
        make.centerX.equalTo(self.contentView);
        
    }];
    
    [self.noFriendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@29);
        
        make.top.equalTo(self.noFriendImageView.mas_bottom).with.offset(41);
        make.centerX.equalTo(self.contentView);
        
    }];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@192);
        make.height.equalTo(@40);

        make.top.equalTo(self.noFriendLabel.mas_bottom).with.offset(70);
        make.centerX.equalTo(self.contentView);
        
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
        
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
        
        [self.addButton layoutIfNeeded];
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.addButton.bounds;
        gradient.startPoint = CGPointMake(0, 0.5);
        gradient.endPoint = CGPointMake(1, 0.5);
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[[UIColor colorWithRed:68/255.0f green:179/255.0f blue:11/255.0f alpha:1.0f] CGColor],
                           (id)[[UIColor colorWithRed:166/255.0f green:204/255.0f blue:66/255.0f alpha:1.0f] CGColor],
                           nil];
        [self.addButton.layer insertSublayer:gradient atIndex:0];
        
    });
    
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
