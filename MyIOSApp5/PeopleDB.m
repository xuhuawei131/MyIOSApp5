//
//  PeopleDB.m
//  MyIOSApp5
//
//  Created by lingdian on 17/8/29.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "PeopleDB.h"

@implementation PeopleDB


-(instancetype)init{
    if (self=[super init]) {
        _array=[NSMutableArray new];
    }
    return self;
    
}

-(void)addPeople:(People*)pPeople{
    if ([self querryPeopleByName:pPeople.name]==nil) {
        [self.array addObject:pPeople];
    }
}
-(void)AddPeoleName:(NSString*)name Phone:(NSString*)phone Sex:(int)sex Age:(int)age{
    People* people=[People getInstanceWithName:name Phone:phone Sex:sex Age:age];
    
    [self addPeople:people];
    
}
-(People*)querryPeopleByName:(NSString*)name{
    for (People* people in self.array) {
        if([people.name isEqualToString:name]){
            return people;
        }
    }
    return nil;
}

-(People*)querryPeopleByPhone:(NSString*)phone{
    for (People* people in self.array) {
        if([people.phone isEqualToString:phone]){
            return people;
        }
    }
    return nil;
}
-(void)deletePeople:(People*)people{
    [self.array removeObject:people];
}

@end
