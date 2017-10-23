//
//  ViewController.m
//  SaveDataSecondTest
//
//  Created by HaiRuiGao on 16-5-17.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%@",NSHomeDirectory());
    
    //数据存储的第二种方式: 写文件.

}
- (IBAction)saveStringBtn:(id)sender {
    
    NSString *string = @"123";
    
    
    /*
     参数: 1.文件写入的位置.要存储的路径.
     2. 原子性操作, 是否允许在多线程环境下, 同时进行写入的操作.
     3. 编码方式.
     4. 写入文件的错误信息.
     */
    //把字符串存放在Documents文件夹下.
    //NSHomeDirectory(): 沙盒的文件路径.沙盒中一共包含3个文件夹.
    
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]: 获取沙盒文件夹中的Documents文件夹.
    //string.plist: 沙盒中要保存的数据的文件名.
    
    //.plist: 只是相当于指定了以哪一种应用程序打开这个文件.(如果是plist文件, 默认的应用程序是xcode. 如果是txt文件, 默认的应用程序就是文本编辑. 如果是png文件, 默认的是图片预览的应用程序)
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/string.plist"];
    
    NSError *error = nil;
    BOOL isSeccussed = [string writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&error];
    
    if (isSeccussed == NO) {
        
        //写入文件失败
        NSLog(@"写入文件失败 error = %@",error);
    }else{
        
        //写入文件成功
        NSLog(@"写入文件成功 %@",error);
    }
    
}
- (IBAction)readStringBtn:(id)sender {
    
    
    /*
     参数1: 要读取的字符串的文件路径
     参数2: 编码格式
     参数3: 读取失败的原因
     */
    //1. 获取文件的路径
    NSString *stringPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/string.plist"];
    
    //2. 根据路径还原字符串内容
    NSError *error = nil;
    NSString *resultString = [[NSString alloc] initWithContentsOfFile:stringPath encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(@"string = %@ error = %@",resultString,error);
    
}
- (IBAction)saveArrayBtn:(id)sender {
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"张三",@"李四",@"王二",@"麻子", nil];
    
    //1. 获取你要写入的文件的具体路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
    
    
    //2. 开始写入
    BOOL result = [array writeToFile:path atomically:NO];
    if (result == YES) {
        
        NSLog(@"写入数组成功");
    }else{
        
        NSLog(@"写入数组失败");
        
    }
    
    
}
- (IBAction)readArrayBtn:(id)sender {
    
    //获取路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
    
    //开始读取
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:path];
    NSLog(@"array = %@",array);
    
}
- (IBAction)savaDictBtn:(id)sender {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dict.plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"zhi1",@"jian1",@"zhi2",@"jian2",@"zhi3",@"jian3", nil];
    
    [dict writeToFile:path atomically:NO];
    
}
- (IBAction)readDictBtn:(id)sender {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dict.plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSLog(@"dict = %@",dict);
    
}
- (IBAction)saveDataBtn:(id)sender {
    
    //1. 获取工程中的图片文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"girl" ofType:@"png"];
    
    //2. 把该路径下的文件内容转化成NSData
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    NSString *toPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    //3. 把data写入文件
    [data writeToFile:toPath atomically:NO];
    NSLog(@"data = %@",data);
}
- (IBAction)readDataBtn:(id)sender {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    
    //把路径下的内容转化为一个NSData
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    //还原成图片
    UIImage *image = [UIImage imageWithData:data];
    
    self.imageView.image = image;
}






@end
