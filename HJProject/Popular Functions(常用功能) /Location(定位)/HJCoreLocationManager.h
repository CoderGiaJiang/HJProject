//
//  HJCoreLocationManager.h
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface HJLocationModel : NSObject

@property (nonatomic, strong) NSString *name;// 完整定位地址
@property (nonatomic, strong) NSString *thoroughfare;// 道路
@property (nonatomic, strong) NSString *subThoroughfare;// 城市附加信息
@property (nonatomic, strong) NSString *locality;// 城市
@property (nonatomic, assign) CGFloat longitude;// 经度
@property (nonatomic, assign) CGFloat latitude;// 纬度
@property (nonatomic, assign) CGFloat speed;// 速度

@end

typedef void(^HJLocationModelBlock)(HJLocationModel *model);

@interface HJCoreLocationManager : NSObject<CLLocationManagerDelegate>

/**
 *  定位信息回调
 */
@property (nonatomic, copy) HJLocationModelBlock didUpdataBlock; //

/**
 *  创建单例对象，并且定位一次
 *
 *  @return 单例对象
 */
+ (instancetype)hj_standardCoreLoactionManager;

/**
 *  开始定位
 */
- (void)hj_startUpdatingLocation;

/**
 *  停止定位
 */
- (void)hj_stopUpdatingLocation;

/**
 *  计算两个经纬度之间的距离
 *
 *  @param fromLocation 源经纬度
 *  @param toLocation   目的地经纬度
 *
 *  @return 经纬度之间的距离
 */
- (CLLocationDistance)distanceFromLocation:(HJLocationModel *)fromLocation toLocation:(HJLocationModel *)toLocation;


@end
