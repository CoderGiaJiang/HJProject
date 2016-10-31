//
//  NoDataView.h
//  PinkBox
//
//  Created by xuxiaoteng on 8/9/15.
//  Copyright (c) FenHe Information Technology Co,. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NoDataButtonDidClicked)();

@interface NoDataView : UIView

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *buttonTitle;
@property (nonatomic, copy) NoDataButtonDidClicked noDataButtonDidClicked;
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) CGFloat noDataViewOffset;

- (void)configNoDataSubViewForImage:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail buttonTitle:(NSString *)buttonTitle noDataButtonDidClicked:(NoDataButtonDidClicked)noDataButtonDidClicked;

+ (instancetype)nodataViewWithTitle:(NSString *)title superView:(UIView *)superView changeObject:(id)obj keyPath:(NSString *)keyPath;

+ (NoDataView *)configNoDataViewForImage:(NSString *)imageName
                                   title:(NSString *)title
                                  detail:(NSString *)detail
                             buttonTitle:(NSString *)buttonTitle
                               superView:(UIView *)superView
                  noDataButtonDidClicked:(NoDataButtonDidClicked)noDataButtonDidClicked;


- (void)showNoDataView:(BOOL)show animation:(BOOL)animation;

@end
