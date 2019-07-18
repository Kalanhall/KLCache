//
//  KLViewController.m
//  KLCache
//
//  Created by Kalanhall@163.com on 07/18/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"
#import <KLCache/KLCache.h>

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *cacheName = @"cacheName";
    NSDictionary *value = @{@"Value" : @"For Key"};
    NSString *key = @"key";
    
    KLCache *cache = [KLCache cacheWithName:cacheName];
    [cache.memoryCache setCountLimit:50];       // 内存最大缓存数据个数
    [cache.memoryCache setCostLimit:1*1024];    // 内存最大缓存开销 目前这个毫无用处
    [cache.diskCache setCostLimit:10*1024];     // 磁盘最大缓存开销
    [cache.diskCache setCountLimit:50];         // 磁盘最大缓存数据个数
    [cache.diskCache setAutoTrimInterval:60];   // 设置磁盘lru动态清理频率 默认 60秒
	
    // TODO: - 同步操作
    // 根据key写入缓存value
    [cache setObject:value forKey:key];
    // 判断缓存是否存在
    BOOL isExist = [cache containsObjectForKey:key];
    NSLog(@"containsObject : %@", isExist ? @"YES" : @"NO");
    // 根据key读取数据
    id vuale = [cache objectForKey:key];
    NSLog(@"value : %@",vuale);
    // 根据key移除缓存
    [cache removeObjectForKey:key];
    // 移除所有缓存
    [cache removeAllObjects];
    NSLog(@"removeAllObjects sucess");
    
    // TODO: - 异步操作
    // 根据key写入缓存value
    [cache setObject:value forKey:key withBlock:^{
        NSLog(@"setObject sucess");
    }];
    // 判断缓存是否存在
    [cache containsObjectForKey:key withBlock:^(NSString * _Nonnull key, BOOL contains) {
        NSLog(@"containsObject : %@", contains?@"YES":@"NO");
    }];
    
    // 根据key读取数据
    [cache objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        NSLog(@"objectForKey : %@",object);
    }];
    
    // 根据key移除缓存
    [cache removeObjectForKey:key withBlock:^(NSString * _Nonnull key) {
        NSLog(@"removeObjectForKey %@",key);
    }];
    
    // 移除所有缓存
    [cache removeAllObjectsWithBlock:^{
        NSLog(@"removeAllObjects sucess");
    }];
    
    // 移除所有缓存带进度
    [cache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
        NSLog(@"removeAllObjects removedCount :%d  totalCount : %d",removedCount,totalCount);
    } endBlock:^(BOOL error) {
        if(!error){
            NSLog(@"removeAllObjects sucess");
        } else {
            NSLog(@"removeAllObjects error");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
