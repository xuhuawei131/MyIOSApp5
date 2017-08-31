//
//  ViewController.h
//  MyIOSApp5
//
//  Created by lingdian on 17/8/29.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"
#import "PeopleDB.h"
@interface ViewController : UIViewController

@property(nonatomic)PeopleDB* peopleDB;

-(BOOL)checkAllKeyEditInput;
@end

