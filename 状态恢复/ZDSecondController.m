//
//  ZDSecondController.m
//  状态恢复
//
//  Created by 朱冬冬 on 2017/9/14.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDSecondController.h"

@interface ZDSecondController ()<UIViewControllerRestoration>

@end

@implementation ZDSecondController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([ZDSecondController class]);
        self.restorationClass = [ZDSecondController class];
    }
    return self;
}
//对象设置恢复类时,再次恢复时调用该方法
+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder{
    ZDSecondController *vc = [[self alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];
    return vc;
}
//为恢复状态属性编码
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder{

    [super encodeRestorableStateWithCoder:coder];

}
//为恢复状态属性解码(在viewDidLoad调用后,调用该方法)
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder{

    [super decodeRestorableStateWithCoder:coder];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

}


@end
