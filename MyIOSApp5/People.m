//
//  People.m
//  MyIOSApp5
//
//  Created by lingdian on 17/8/29.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "People.h"

@implementation People


-(instancetype) initWithName:(NSString*)name Phone:(NSString*)phone Sex:(int)sex Age:(int)age{
    if(self=[super init]){
        _name=name;
        _phone=phone;
        _sex=sex;
        _age=age;

    }
    return self;
}

+(People*)getInstanceWithName:(NSString*)name Phone:(NSString*)phone Sex:(int)sex Age:(int)age{
    People* people=[[People alloc]initWithName:name Phone:phone Sex:sex Age:age];
    return people;
}
@end
