//
//  PeopleDB.h
//  MyIOSApp5
//
//  Created by lingdian on 17/8/29.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
@interface PeopleDB : NSObject

@property(nonatomic)NSMutableArray* array;

-(instancetype)init;
-(void)addPeople:(People*)people;
-(void)AddPeoleName:(NSString*)name Phone:(NSString*)phone Sex:(int)sex Age:(int)age;
-(People*)querryPeopleByName:(NSString*)name;
-(People*)querryPeopleByPhone:(NSString*)phone;
-(void)deletePeople:(People*)people;
@end
