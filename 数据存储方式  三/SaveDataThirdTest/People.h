//
//  People.h
//  SaveDataThirdTest
//
//  Created by HaiRuiGao on 16-5-17.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

//NSCoding: 一个对象进行编码的协议. 一个类的对象,要实现编码(序列化)和反编码(反序列化), 必须要实现该协议, 并且要对对象的每一个属性进行编码和反编码的操作.
@interface People : NSObject<NSCoding>



@property (nonatomic, copy)NSString *name;

@property (nonatomic, assign)int age;


@end
