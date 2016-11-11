//
//  HJCoreLocationManager.m
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "HJCoreLocationManager.h"

@implementation HJLocationModel

@end

@interface HJCoreLocationManager ()

@property(nonatomic, retain) CLLocationManager *mgr;

@end

@implementation HJCoreLocationManager


/**
 *  创建单例对象，并且定位一次
 *
 *  @return 单例对象
 */
+ (instancetype)hj_standardCoreLoactionManager
{
    static HJCoreLocationManager *obj = nil;
    @synchronized([HJCoreLocationManager class])
    {
        if(!obj)
            obj = [[HJCoreLocationManager alloc] init];
        [obj hj_setUpManager];
    }
    return obj;
}

/**
 *  开始定位
 */
- (void)hj_startUpdatingLocation
{
    [self.mgr startUpdatingLocation];
}

/**
 *  停止定位
 */
- (void)hj_stopUpdatingLocation
{
    [self.mgr stopUpdatingLocation];
}

/**
 *  计算两个经纬度之间的距离
 *
 *  @param fromLocation 源经纬度
 *  @param toLocation   目的地经纬度
 *
 *  @return 经纬度之间的距离
 */
- (CLLocationDistance)distanceFromLocation:(HJLocationModel *)fromLocation toLocation:(HJLocationModel *)toLocation
{
    
    CLLocation *fromLocat = [[CLLocation alloc]initWithLatitude:fromLocation.latitude longitude:fromLocation.longitude ] ;
    CLLocation *toLocat = [[CLLocation alloc]initWithLatitude:toLocation.latitude longitude:toLocation.longitude ];
    
    return [fromLocat distanceFromLocation:toLocat];
}

#pragma mark - 第三步 创建定位管理器
- (void)hj_setUpManager
{
    _mgr = [[CLLocationManager alloc] init];
    _mgr.delegate = self;
    _mgr.desiredAccuracy =  kCLLocationAccuracyBestForNavigation;
    // 隔一段时间定位一次(单位为米）
    _mgr.distanceFilter = 10;
    
    if ([[UIDevice currentDevice].systemVersion doubleValue]>=8.0) {
        //        到Plist文件中增加：
        //        NSLocationWhenInUseDescription//使用app时是否允许app使用定位的提示语
        //        NSLocationAlwaysUsageDescription//不使用app时是否允许app使用定位的提示语
        //  手动授权
        //  主动请求前后台授权
        [self.mgr requestAlwaysAuthorization];
        //  主动请求前台授权
        [self.mgr requestWhenInUseAuthorization];
    }else{
        //  开始定位
        [self.mgr startUpdatingLocation];
    }
}

#pragma mark -- CLLocationManagerDelegate
/**
 *  获取授权状态
 *
 *  @param manager CLLocationManager
 *  @param status  授权状态
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    //    判断状态来开启定位
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.mgr startUpdatingLocation];
        
    }
}

/**
 *  获取定位信息
 *
 *  @param manager   CLLocationManager
 *  @param locations 定位信息
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //    获取我当前的位置
    CLLocation *newLocation = [locations lastObject];
    //    获取经纬度
    CLLocationCoordinate2D coord = newLocation.coordinate;
    //    float la = coord.latitude;
    //    float lo = coord.longitude;
    float sp = newLocation.speed;
    //位置反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    // 定位信息
    HJLocationModel *locationModel = [HJLocationModel new];
    locationModel.speed = sp;
    locationModel.longitude = coord.longitude;
    locationModel.latitude = coord.latitude;
    
    //使用位置反编码对象获取位置信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *pl in placemarks)
        {
            locationModel.name = pl.name;
            locationModel.thoroughfare = pl.thoroughfare;
            locationModel.subThoroughfare = pl.subThoroughfare;
            locationModel.locality = pl.locality;
            if (_didUpdataBlock) {
                // 定位信息回调
                _didUpdataBlock(locationModel);
            }
        }
    }];
}


@end
