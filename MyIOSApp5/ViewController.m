//
//  ViewController.m
//  MyIOSApp5
//
//  Created by lingdian on 17/8/29.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentSex;
@property (weak, nonatomic) IBOutlet UITextField *editPhone;
@property (weak, nonatomic) IBOutlet UITextField *editAge;
@property (weak, nonatomic) IBOutlet UILabel *textToast;

@end

@implementation ViewController

- (IBAction)onAddClick:(id)sender {
    if (![self checkEditInput:_editName]) {
        self.textToast.text=@"用户名不能为空";
    }else if (![self checkEditInput:_editPhone]) {
        self.textToast.text=@"手机号不能为空";
    }else {
        
        
        
        NSString* name=self.editName.text;
        NSString* phone=self.editPhone.text;
        int age=[self.editAge.text intValue];
        int sex=self.segmentSex.selectedSegmentIndex;
        
        [self.peopleDB AddPeoleName:name Phone:phone Sex:sex Age:age];
        self.textToast.text=@"添加成功！";
    }
}

- (IBAction)onOutTouchClick:(id)sender {
    [self.editName resignFirstResponder];
    [self.editPhone resignFirstResponder];
    [self.editAge resignFirstResponder];
}

- (IBAction)onDeleteClick:(id)sender {
    BOOL isInputCorrect=[self checkAllKeyEditInput];
    if(isInputCorrect){
        self.textToast.text=@"";
        People* people=[self querryPeople];
        if (people!=nil) {
            [self.peopleDB deletePeople:people];
            
            self.editAge.text=@"";
            self.editPhone.text=@"";
            self.editName.text=@"";
            
            self.textToast.text=@"删除成功";
            
        }else{
            self.textToast.text=@"没有您要删除的人";
        }
    }else{
     self.textToast.text=@"请输入要删除的用户名或者手机号";
    }
}

- (IBAction)onQuerryClick:(id)sender {
    
    BOOL isInputCorrect=[self checkAllKeyEditInput];
    
    if(isInputCorrect){
        self.textToast.text=@"";
        People* people=[self querryPeople];
        if (people!=nil) {
           
            self.editName.text=people.name;
            self.editAge.text=[[NSString alloc]initWithFormat:@"%d",people.age ];
            self.editPhone.text=people.phone;
            [self.segmentSex setSelectedSegmentIndex:people.sex];
            
        }else{
            self.textToast.text=@"没有您要查找的人";
        }
    }else{
        self.textToast.text=@"请输入要查询的用户名或者手机号";
    }
    
}



-(People*)querryPeople{
    NSString* name=self.editName.text;
    NSString* phone=self.editPhone.text;

    self.textToast.text=@"";
    if(name.length>0){
        return [self.peopleDB querryPeopleByName:name];
    }else if(phone.length>0){
    return [self.peopleDB querryPeopleByPhone:phone];
    }else{
        self.textToast.text=@"请输入查询的用户名或者手机号";
        return nil;
    }
}

-(BOOL) checkAllKeyEditInput{
    NSString* name=self.editName.text;
    NSString* phone=self.editPhone.text;
    
    if(name.length==0&&phone.length==0){
        return FALSE;
    }else{
        return TRUE;
    }
}

-(BOOL)checkEditInput:(UITextField*)inputStr{
    int count=inputStr.text.length;
    if(count>0){
        return TRUE;
    }else{
        return FALSE;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.peopleDB=[[PeopleDB alloc]init];
    [self.segmentSex setSelectedSegmentIndex:0];
    self.textToast.text=@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
