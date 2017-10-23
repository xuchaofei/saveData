//
//  ViewController.m
//  SaveDataFirst
//
//  Created by HaiRuiGao on 16-5-17.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //NSUserDefaults: 数据本地存储的第一种方式, 可以存储一些NSString, NSArray, NSDictionary, NSData, NSValue, NSNumber等数据.
    //注意: 一般存储一些数据量小的数据.
    //类似于字典的功能, 但是比字典更强大, 可以直接存储基本数据类型.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:@"bool"];
    [ud setInteger:100 forKey:@"int"];
    [ud setFloat:1.4 forKey:@"float"];
    [ud synchronize];
    
    //输出该应用程序的沙盒路径
    NSLog(@"%@",NSHomeDirectory());
    
    //通过该方式存储的数据, 默认保存在Library/Prefences/文件夹中.
    
}
- (IBAction)saveStringBtn:(id)sender {
    
    NSString *str = @"zhangsan";
    //1. 获取NSUserDefaults的单例对象, 该类的对象整个应用程序只创建了一次, 不管在哪个地方使用, 都是同一个对象.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    //2. 通过单例对象, 进行存储数据.
    [ud setObject:str forKey:@"name"];

    //3. 进行本地沙盒文件的同步
    [ud synchronize];
    
}
- (IBAction)readStringBtn:(id)sender
{
    //把保存好的字符串从本独读取出来使用.
    //1. 获取单例对象
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    //2. 根据键获取值
    NSString *receivedString = [ud objectForKey:@"name"];
    NSLog(@"receivedString = %@",receivedString);
    
}
- (IBAction)saveArrayBtn:(id)sender {
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:array forKey:@"array"];
    [ud synchronize];
    
}
- (IBAction)readArrayBtn:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSArray *receivedArray = [ud objectForKey:@"array"];
    NSLog(@"array = %@",receivedArray);
    
}
- (IBAction)saveDictBtn:(id)sender {
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"jian1",@"zhi1",@"jian2",@"zhi2",@"jian3",@"zhi3", nil];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:dict forKey:@"dict"];
    [ud synchronize];
    
}
- (IBAction)readDictBtn:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [ud objectForKey:@"dict"];
    NSLog(@"dict = %@",dict);
    
}
- (IBAction)saveDataBtn:(id)sender {
    
    NSData *data = [NSData data];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:data forKey:@"data"];
    [ud synchronize];
}
- (IBAction)readDataBtn:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [ud objectForKey:@"data"];
    NSLog(@"data = %@",data);
}
- (IBAction)deleteBtn:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:@"data"];
    [ud synchronize];
}

@end
