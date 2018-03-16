//
//  ViewController.m
//  Tools
//
//  Created by He on 2018/3/16.
//  Copyright © 2018年 He. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //参数:1.观察者2.接到通知后调用的方法3.通知的名称4.接受哪个发送者的通知(nil代表接受所有发送者的通知)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(net:) name:@"monitorNetWorking" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)net:(NSNotification*)notification {
    
    //实现收到通知的响应事件
    UIAlertController* al = [UIAlertController alertControllerWithTitle:@"提示" message:@"请检查网络" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [al addAction:ac];
    [self presentViewController:al animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{   //移除监听者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
