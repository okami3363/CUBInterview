//
//  CUBInviteTableViewCell.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBInviteTableViewCell.h"
#import "CUBInviteModel.h"

@interface CUBInviteTableViewCell()

@property (nonatomic, strong) UIView *groupIndicator;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *inviteLabel;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *noButton;

@end

@implementation CUBInviteTableViewCell

- (void)setEntity:(id)entity {
    
    [super setEntity:entity];
    
    CUBInviteModel *model = nil;
    if (![entity isMemberOfClass:[CUBInviteModel class]]) {
        return;
    }
    else {
        model = (CUBInviteModel *)entity;
    }
    
    self.nameLabel.text = model.name;
    
    if (model.isLeader && model.isClose) {
        self.groupIndicator.hidden = NO;
    }
    else {
        self.groupIndicator.hidden = YES;
    }
    
}

-(void)setupUI {
    
    [super setupUI];
    
    self.contentView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.contentView.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    self.contentView.layer.shadowOpacity = 0.3f;
    self.contentView.layer.shadowRadius = 3.0f;
    
    CGFloat alpha = (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark)?0.1f:0.7f;
    
    self.groupIndicator = [[UIView alloc] init];
    self.groupIndicator.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
    self.groupIndicator.layer.cornerRadius = 10;
    self.groupIndicator.layer.masksToBounds = YES;
    self.groupIndicator.hidden = YES;
    [self.contentView addSubview:self.groupIndicator];
    
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
    self.view.layer.cornerRadius = 10;
    self.view.layer.masksToBounds = YES;
    [self.contentView addSubview:self.view];
    
    self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    [self.contentView addSubview:self.userImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    
    self.inviteLabel = [[UILabel alloc] init];
    self.inviteLabel.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f];
    self.inviteLabel.text = @"邀請你成為好友：）";
    [self.contentView addSubview:self.inviteLabel];
    
    self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.okButton setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.okButton];
    
    self.noButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.noButton setImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.noButton];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@70);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.left.equalTo(self.contentView.mas_left).with.offset(30);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-30);
        
    }];
    
    [self.groupIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@70);
        
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        
    }];
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.centerY.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-15);
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@22);
        
        make.top.equalTo(self.view.mas_top).with.offset(14);
        make.left.equalTo(self.userImageView.mas_right).with.offset(15);
        
    }];
    
    [self.inviteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@18);
        
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(2);
        make.left.equalTo(self.userImageView.mas_right).with.offset(15);
        
    }];
    
    [self.okButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.right.equalTo(self.noButton.mas_left).with.offset(-15);
        
    }];
    
    [self.noButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        
    }];
    
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
