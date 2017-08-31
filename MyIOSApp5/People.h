//
//  People.h
//  MyIOSApp5
//
//  Created by lingdian on 17/8/29.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
@property(nonatomic)NSString* name;
@property(nonatomic)NSString* phone;;
@property(nonatomic)int sex;
@property(nonatomic)int age;

-(instancetype) initWithName:(NSString*)name Phone:(NSString*)phone Sex:(int)sex Age:(int)age;

+(People*)getInstanceWithName:(NSString*)name Phone:(NSString*)phone Sex:(int)sex Age:(int)age;




@end
