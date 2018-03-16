//
//  CYTools.m
//  Tools
//
//  Created by He on 2018/3/16.
//  Copyright © 2018年 He. All rights reserved.
//

#import "CYTools.h"
#import "AFNetworking.h"
@implementation CYTools
+ (void)monitorNetWorking {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
                NSLog(@"未知");
                break;
            case 0:
                NSLog(@"网络未达");
                //参数1通知名,2object(当添加观察者方法的object参数为nil时,可用于传值,当不为nil时,只有两个方法的object值一样才能接收通知),3(传递的数据,是字典)
                [[NSNotificationCenter defaultCenter] postNotificationName:@"monitorNetWorking" object:nil userInfo:nil];
                break;
            case 1:
                NSLog(@"移动网络");
                break;
            case 2:
                NSLog(@"wifi");
                break;
            default:
                break;
        }
        
    }];
}
@end
