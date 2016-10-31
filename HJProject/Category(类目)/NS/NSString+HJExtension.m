//
//  NSString+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "NSString+HJExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HJExtension)

/**
 *  获取两个字符串之间的字符串
 *
 *  @param frontStr  前面的字符串
 *  @param behindStr 后面的字符串
 *
 *  @return 中间的字符串
 */
- (NSString *)hj_stringBetweenFrontString: (NSString *)frontStr
                             behindString: (NSString *)behindStr
{
    NSString *string = [self substringFromIndex:[self rangeOfString:frontStr].location + frontStr.length];
    string = [string stringByReplacingOccurrencesOfString:[string substringFromIndex:[string rangeOfString:behindStr].location] withString:@""];
    
    return string;
}

/**
 *  删除字符串中的空格
 *
 *  @return 删除空格之后的字符串
 */
- (NSString *)hj_deleteBlankSpaceFromString
{
    NSString *string = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return string;
}

/**
 *  删除首尾空格的字符串
 *
 *  @return 删除首尾空格后的字符串
 */
- (NSString *)hj_deleteBlankFromTheBeginAndEndOfString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 *  删除首尾指定的字符集
 *
 *  @param str 指定的字符集
 *
 *  @return 删除指定字符集后的字符串
 */
- (NSString *)hj_deleteBeginAndEndToString:(NSString *)str
{
    id cs= [NSCharacterSet characterSetWithCharactersInString:str];
    return [self stringByTrimmingCharactersInSet:cs];
}

/**
 *  删除指定的字符集
 *
 *  @param str 指定的字符集
 *
 *  @return 删除指定字符集后的字符串
 */
- (NSString *)hj_deleteTheSpecifiedCharacterSet:(NSString *)str
{
    NSCharacterSet *cs= [NSCharacterSet characterSetWithCharactersInString:str];
    NSMutableString *theString=[NSMutableString stringWithString:self];
    
    NSRange range2;
    
    do {
        
        range2=[theString rangeOfCharacterFromSet:cs options:NSLiteralSearch];
        
        if (range2.location!=NSNotFound) {
            
            [theString deleteCharactersInRange:range2];
            
            //            [theString replaceCharactersInRange:range2 withString:@"*"];
            
        }
        
    } while (range2.location!=NSNotFound);
    
    
    return [[NSString alloc] initWithString:theString];
    
}


/**
 *  过滤特殊字符串
 *
 *  @return 返回过滤后的字符串
 */
- (NSString *)hj_filterSpecialStrings
{
    // 定义一个特殊字符的集合
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:
                           @"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    // 过滤字符串的特殊字符
    NSString *newString = [self stringByTrimmingCharactersInSet:set];
    return newString;
}

/**
 *  替换掉图片名的后缀 方便更换高清图片
 *
 *  @param suffix 图片后缀名
 *
 *  @return 返回替换的图片名称
 */
- (NSString*)hj_stringByReplaceImageSuffix: (NSString*)suffix
{
    //修改后缀的图片
    NSArray *arrSuffix = @[@".jpg",@".png",@".jpeg",@".gif"];
    
    for (int i = 0 ; i<[arrSuffix count]; i++) {
        NSRange rang = [self rangeOfString:[arrSuffix objectAtIndex:i]];
        if (rang.location!=NSNotFound) {
            NSString *contentString = [self substringWithRange:NSMakeRange(0, rang.location)];
            NSString *newImageName = [NSString stringWithFormat:@"%@%@%@",contentString,suffix,[arrSuffix objectAtIndex:i]];
            return newImageName;
        }
    }
    //找不到类型返回原本的图片
    return self;
}

#pragma mark - MD5

/**
 *  MD5 加密字符串
 *
 *  @return MD5 加密后的字符串
 */
- (NSString *)hj_MD5Encryption
{
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (unsigned)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return hash;
}

/**
 *  MD5 加密小写字符串
 *
 *  @return MD5 加密后的小写字符串
 */
- (NSString *)hj_MD5LowerCaseEncryption;
{
    return [[self hj_MD5Encryption] lowercaseString];
}

/**
 *  MD5 加密大写字符串
 *
 *  @return MD5 加密后的大写字符串
 */
- (NSString *)hj_MD5UpperCaseEncryption
{
    return [[self hj_MD5Encryption] uppercaseString];
}

#pragma mark - 时间处理

/**
 *  时间字符串转 NSDate
 *
 *  @param dateFormat 时间格式字符串
 *
 *  @return NSDate
 */
- (NSDate *)hj_dateFromStringWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];//@"yyyy-MM-dd HH:mm:ss"
    return [dateFormatter dateFromString:self];
}

/**
 *  获取当前时间
 *
 *  @param dateFormat 传入时间格式
 *
 *  @return 当前时间字符串
 */
+ (NSString *)hj_stringFromNowTimeWithFormat:(NSString *)dateFormat
{
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateStyle:NSDateFormatterMediumStyle];
    [dateformatter setTimeStyle:NSDateFormatterShortStyle];
    [dateformatter setDateFormat:dateFormat];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

/**
 *  时间戳转时间
 *
 *  @param dateFormat 时间格式
 *
 *  @return 时间字符串
 */
- (NSString *)hj_timeStampWithFormat:(NSString *)dateFormat
{
    //    NSTimeInterval time=[self doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    NSTimeInterval time=[self doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    //yyyy-MM-dd HH:mm:ss
    [dateFormatter setDateFormat:dateFormat];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    return currentDateStr;
}

/**
 *  时间转时间戳
 *
 *  @param dateFormat 时间格式
 *
 *  @return 时间戳
 */
- (NSInteger)hj_TimeToTimeStampWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormat];
    //    YYYY-MM-dd HH:mm:ss
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:self]; //------------将字符串按formatter转成nsdate
    
    //    时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return [timeSp integerValue];
}


/**
 *  获取到的时间戳展现成 分钟前 小时前 天前
 *
 *  @return 返回距离传入时间的时间间隔
 */
- (NSString *)hj_timeStampToTurnBackTime
{
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[self integerValue]];
    
    NSDate *d = [date dateFromString:[date stringFromDate:confromTimesp]];
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    NSString *timeString = @"";
    NSTimeInterval cha = now-late;
    //    发表在一小时之内
    if (cha/3600<1) {
        if (cha/60<1) {
            timeString = @"1";
        }
        else
        {
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            timeString = [timeString substringToIndex:timeString.length-7];
        }
        
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    }
    //    在一小时以上24小以内
    else if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    //    发表在24以上10天以内
    else if (cha/86400>1&&cha/17200<1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    //    发表时间大于10天
    else
    {
        //        timeString = [NSString stringWithFormat:@"%d-%"]
        NSArray *array = [self componentsSeparatedByString:@" "];
        //        return [array objectAtIndex:0];
        timeString = [array objectAtIndex:0];
    }
    return timeString;
}



#pragma mark - 计算尺寸
/**
 *  计算字符串的高度
 *
 *  @param size 限制尺寸
 *  @param font 字体大小
 *
 *  @return 自适应高度
 */
- (CGFloat)hj_caclulateHeightBaseLimitSize:(CGSize)size font:(CGFloat)font
{
    //设置格式
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    //计算实际frame大小，并将label的frame变成实际大小
    CGRect labelrect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return labelrect.size.height;
}

/**
 *  计算字符串的宽度度
 *
 *  @param size 限制尺寸
 *  @param font 字体大小
 *
 *  @return 自适应宽度
 */
- (CGFloat)hj_caclulateWidthBaseLimitSize:(CGSize)size font:(CGFloat)font
{
    //设置格式
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    //计算实际frame大小，并将label的frame变成实际大小
    CGRect labelrect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return labelrect.size.width;
}

#pragma mark - 其他

/**
 计算总文件夹所占内存大小
 
 @return 内存大小
 */
- (unsigned long long)hj_caculateFileSize
{
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    
    if (isDirectory) { // 文件夹
        // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    } else { // 文件
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}

/**
 *  字符串转类
 *
 *  @return 类
 */
- (Class)hj_classFromString
{
    const char *className = [self cStringUsingEncoding:NSASCIIStringEncoding];
    // From string to class
    Class newClass = objc_getClass(className);
    if (!newClass)
    {    // Creat a class
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        // Register class
        objc_registerClassPair(newClass);
    }
    return newClass;
}

@end
