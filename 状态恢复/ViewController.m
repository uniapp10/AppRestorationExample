//
//  ViewController.m
//  状态恢复
//
//  Created by zhudong on 16/8/28.
//  Copyright © 2016年 zhudong. All rights reserved.
//

#import "ViewController.h"
#import "ZDSecondController.h"

@interface ViewController ()<UIViewControllerRestoration>
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,strong) UILabel *nameL;
@property (nonatomic,strong) UILabel *ageL;
@property (nonatomic,strong) UITextField *nameT;
@property (nonatomic,strong) UITextField *ageT;
@end

@implementation ViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([ViewController class]);
        self.restorationClass = [ViewController class];
        self.name = @"lishi";
        self.age = @"10";
    }
    return self;
}
//对象设置恢复类时,再次恢复时调用该方法
+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder{
    ViewController *vc = [[self alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];
    return vc;
}
//为恢复状态属性编码
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder{
    //记录输入的姓名
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:self.nameT.text forKey:@"name"];
    //记录输入的年龄
    [coder encodeObject:self.ageT.text forKey:@"age"];
}
//为恢复状态属性解码(在viewDidLoad调用后,调用该方法)
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder{
    //将上次输入的姓名和年龄取出,赋值
    [super decodeRestorableStateWithCoder:coder];
    self.nameL.text = [coder decodeObjectForKey:@"name"];
    self.ageL.text = [coder decodeObjectForKey:@"age"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 200, 30)];
    [self.view addSubview:nameLabel];
    [self.view addSubview:ageLabel];
    self.nameL = nameLabel;
    self.ageL = ageLabel;
    nameLabel.text = self.name;
    ageLabel.text = self.age;
    
    UITextField *nameT = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 200, 30)];
    nameT.placeholder = @"newName";
    self.nameT = nameT;
    UITextField *ageT = [[UITextField alloc] initWithFrame:CGRectMake(20, 250, 200, 30)];
    ageT.placeholder = @"newAge";
    self.ageT = ageT;
    [self.view addSubview:nameT];
    [self.view addSubview:ageT];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 150, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    ZDSecondController *secondC = [[ZDSecondController alloc] init];
    [self.navigationController pushViewController:secondC animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
