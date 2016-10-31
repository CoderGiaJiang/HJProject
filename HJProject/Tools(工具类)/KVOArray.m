//
//  KVOArray.m
//  CRM
//
//  Created by User on 16/8/23.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "KVOArray.h"

@interface KVOArray ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation KVOArray

- (void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index
{
    [self.array insertObject:object atIndex:index];
}

- (void)removeObjectFromArrayAtIndex:(NSUInteger)index
{
    [self.array removeObjectAtIndex:index];
}


- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}


@end
