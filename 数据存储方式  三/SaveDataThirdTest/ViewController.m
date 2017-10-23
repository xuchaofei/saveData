//
//  ViewController.m
//  SaveDataThirdTest
//
//  Created by HaiRuiGao on 16-5-17.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()
{
    NSMutableArray *_array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _array = [[NSMutableArray alloc] init];
    
    for (int a = 0; a < 5; a++) {
        
        People *people = [[People alloc] init];
        people.name = [NSString stringWithFormat:@"张%d",a];
        people.age = a;
        
        [_array addObject:people];
    }
    
    NSLog(@"%@",NSHomeDirectory());
    
}
- (IBAction)archiveBtn:(id)sender {
    //对象的序列化存储.
    
    //plist文件: 属性列表文件Property list. 这种文件的内容的展示方式是以键值对的形式进行存储内容的. plist文件可以保存NSString, NSArray, NSDictionary, NSValue, NSNumber, NSData.
    //但是plist文件只能存储一些系统提供的类.

    
    
/*
    //第一种方式的验证
    //崩溃原因: Attempt to set a non-property-list object.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:_array forKey:@"array"];
    [ud synchronize];
*/
    
    
/*
    //第二种方式的验证: 写入的文件带有自定义对象, 导致文件无法写入.
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.txt"];
    [_array writeToFile:path atomically:NO];
*/
    
    
    //自定义的对象进行存储, 只能使用第三种方式: 对象的序列化.
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
    
    
    //注意: 在进行序列化和反序列化的时候, 使用的方式要保持一致. 使用加号方法都是加号方法. 如果使用的减号方法, 都使用减号方法.
    
    
    
/*
    //使用加号方式对自定义的对象进行序列化的操作
    //NSKeyedArchiver: 对一个对象进行序列化操作的类.
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_array];
    
    [data writeToFile:path atomically:NO];
*/
    

    

    //使用减号方法, 也可以完成自定义对象的序列化操作.
    
    //1. 创建序列化的对象同时, 准备一个可变的data对象, 准备往data写入数据.
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    //2. 通过这个序列化的对象archiver, 完成对对象的编码
    //[archiver encodeObject:_array];
    [archiver encodeObject:_array forKey:@"myArray"];
    
    //3. 完成编码
    [archiver finishEncoding];
    
    //等完成编码之后, 那么这个可变的data中就有了数据.
    //4. 把data写入文件了
    [data writeToFile:path atomically:YES];

}

- (IBAction)unArchiveBtn:(id)sender {
    //对象的反序列化, 其实就是还原数据.
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
    //第一种方式
/*
    //获取data
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSLog(@"data = %@",data);
    //对获取的data进行反序列化(解码)
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"array = %@",array);
*/

/*
    //第二种方式
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"array = %@",array);
*/
    
    //第三种方式
    //1. 创建反序列化的对象
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    //2. 进行反序列化
    NSArray *arr = [unArchiver decodeObjectForKey:@"myArray"];
    
    NSLog(@"arr = %@",arr);
    
    //3. 反序列化完成
    [unArchiver finishDecoding];
  
    
}

@end
