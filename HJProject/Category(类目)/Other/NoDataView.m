//
//  NoDataView.m
//  PinkBox
//
//  Created by xuxiaoteng on 8/9/15.
//  Copyright (c) FenHe Information Technology Co,. Ltd. All rights reserved.
//

#import "NoDataView.h"
#import "UIColor+HJExtension.h"
//#import "UtilitiesFunc.h"

@interface NoDataView ()

@property (nonatomic)NoDataView *nodataView;
@property (nonatomic, strong) id observer;
@end

@implementation NoDataView

- (void)dealloc
{
    if (self.observer) {
        [self.observer removeObserver:self forKeyPath:@"array" context:nil];
    }
}

- (void)configNoDataSubViewForImage:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail buttonTitle:(NSString *)buttonTitle noDataButtonDidClicked:(NoDataButtonDidClicked)noDataButtonDidClicked
{
    [self setImageName:imageName];
    [self setTitle:title];
    [self setDetail:detail];
    [self setButtonTitle:buttonTitle];
    [self setNoDataButtonDidClicked:noDataButtonDidClicked];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:self.imageName]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-150.0);
    }];
    
    UILabel *nothingLabel = [[UILabel alloc] init];
    [nothingLabel setText:self.title];
    
    [nothingLabel setTextColor:TEXTGRAYCOLOR];
    //    if (IS_IPHONE_5_OR_LESS) {
    //        [nothingLabel setFont:[UIFont systemFontOfSize:14]];
    //    }
    [nothingLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:nothingLabel];
    [nothingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(imageView.mas_bottom).offset(20.0);
    }];
    
    UILabel *pickLabel = [[UILabel alloc] init];
    [pickLabel setText:self.detail];
    [pickLabel setTextAlignment:NSTextAlignmentCenter];
    [pickLabel setFont:[UIFont systemFontOfSize:14.0]];
    [pickLabel setTextColor:[UIColor grayColor]];
    [self addSubview:pickLabel];
    [pickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(nothingLabel.mas_bottom).offset(5.0);
    }];
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    
    if ([detail isEqualToString:@""]) {
        
        [goButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal]; //[UIImage imageNamed:@"green_light"] forState:UIControlStateNormal]
        
    }else {
        [goButton setBackgroundImage:[UIImage imageNamed:@"green_light"] forState:UIControlStateNormal];
    }
    
    [goButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [goButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [goButton addTarget:self action:@selector(noDataButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:goButton];
    [goButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100.0, 25.0));
        make.top.equalTo(pickLabel.mas_bottom).offset(20);
    }];
}

- (void)noDataButtonDidClicked:(UIButton *)button
{
    if (self.noDataButtonDidClicked) {
        self.noDataButtonDidClicked();
    }
}

+ (instancetype)nodataViewWithTitle:(NSString *)title
                          superView:(UIView *)superView
                       changeObject:(id)obj
                            keyPath:(NSString *)keyPath
{
    NoDataView *nodataView = [NoDataView new];
//    nodataView.backgroundColor = GRAYBACKGROUNDCOLOR;
    [superView addSubview :nodataView];
    [nodataView setHidden:YES];
    [nodataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(superView.mas_width);
        make.height.equalTo(superView.mas_height);
        make.centerX.equalTo(superView.mas_centerX);
        make.centerY.equalTo(superView.mas_centerY);
    }];
    
    // 102 图片 20 间隔 17
    // 图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"CRM_NoData"]];
    [nodataView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(nodataView.mas_centerX);
        make.centerY.equalTo(nodataView.mas_centerY).offset(-70);
    }];
    
    // 文字
    UILabel *nothingLabel = [[UILabel alloc] init];
    [nothingLabel setText:title];
    [nothingLabel setTextColor:TEXTGRAYCOLOR];
    [nothingLabel setTextAlignment:NSTextAlignmentCenter];
    [nodataView addSubview:nothingLabel];
    [nothingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(imageView.mas_bottom).offset(20.0);
    }];
    
    [obj addObserver:nodataView forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    nodataView.observer = obj;
    return nodataView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([[object valueForKeyPath:keyPath] isKindOfClass:[NSArray class]]) {
        NSArray *arr = [object valueForKeyPath:keyPath];
        if (arr.count == 0) {
            [self show:YES animation:YES];
        }
        else{
            [self show:NO animation:YES];
        }
    }
}

- (void)show:(BOOL)show animation:(BOOL)animation
{
    if (self) {
        if (animation) {
            if (show) {
                [self setAlpha:0.0];
            } else {
                [self setAlpha:1.0];
            }
            [UIView animateWithDuration:0.3 animations:^{
                if (show) {
                    [self setAlpha:1.0];
                } else {
                    [self setAlpha:0.0];
                }
            } completion:^(BOOL finished) {
                [self setHidden:!show];
            }];
        } else {
            [self setAlpha:1.0];
            [self setHidden:!show];
        }
    }
    [super bringSubviewToFront:self];
}


+ (NoDataView *)configNoDataViewForImage:(NSString *)imageName
                                   title:(NSString *)title
                                  detail:(NSString *)detail
                             buttonTitle:(NSString *)buttonTitle
                               superView:(UIView *)superView
                  noDataButtonDidClicked:(NoDataButtonDidClicked)noDataButtonDidClicked
{
    NoDataView *nodataView = [[NoDataView alloc] init];
    //    self->nodataView = nodataView;
    [nodataView configNoDataSubViewForImage:imageName title:title
                                     detail:detail
                                buttonTitle:buttonTitle
                     noDataButtonDidClicked:noDataButtonDidClicked];
//    [nodataView setBackgroundColor:GRAYBACKGROUNDCOLOR];
    
    [superView addSubview:nodataView];
    //    [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_topLayoutGuide).offset(0);
    //            make.bottom.equalTo(self.mas_bottomLayoutGuide);
    //        make.left.right.equalTo(self.view).offset(0);
    //    }];
    
    nodataView.frame = CGRectMake(0,0, SCREEN_WIDTH, superView.height);
    return nodataView;
}

- (void)showNoDataView:(BOOL)show animation:(BOOL)animation
{
    if (self) {
        if (animation) {
            if (show) {
                [self.nodataView setAlpha:0.0];
            } else {
                [self.nodataView setAlpha:1.0];
            }
            [UIView animateWithDuration:0.3 animations:^{
                if (show) {
                    [self.nodataView setAlpha:1.0];
                } else {
                    [self.nodataView setAlpha:0.0];
                }
            } completion:^(BOOL finished) {
                [self.nodataView setHidden:!show];
            }];
        } else {
            [self.nodataView setAlpha:1.0];
            [self.nodataView setHidden:!show];
        }
    }
    [super bringSubviewToFront:self];
}

@end
