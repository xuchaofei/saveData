//
//  People.m
//  SaveDataThirdTest
//
//  Created by HaiRuiGao on 16-5-17.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "People.h"

@implementation People

//是用于一个对象在进行编码的时候调用的.
//NSCoder: 理解为一个编码器
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //编码的时候指定的这个键, 是在反编码的时候会使用到.
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}

//用于一个对象在进行反编码(由编码后的状态还原到编码前的状态)的时候会调用该方法
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        //根据一个键反编码一个对象, 把反编码之后得到的值, 赋值给people类的属性
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
        
    }
    return self;
}

@end
