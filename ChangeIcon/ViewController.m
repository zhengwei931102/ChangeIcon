//
//  ViewController.m
//  ChangeIcon
//
//  Created by 侯克楠 on 2018/9/10.
//  Copyright © 2018年 侯克楠. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, readwrite, strong) UIButton *changeIconBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.changeIconBtn];
    self.changeIconBtn.frame = CGRectMake(100, 100, 100, 100);
    [self.changeIconBtn addTarget:self action:@selector(changeIconBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//         [self changeIconBtnClick];
//    });


}

- (void)changeIconBtnClick{
    int x = arc4random() % 2;
    
    NSArray *iconRandomArr = @[@"橙Icon-Small",@"红Icon-Small"];
    NSLog(@"%@",iconRandomArr[x]);
    
    NSString *iconName = [NSString stringWithFormat:@"%@",iconRandomArr[x]];

    [self changeAppIconWithName:iconName];
}
- (void)changeAppIconWithName:(NSString *)iconName {
    if([[UIApplication sharedApplication] respondsToSelector:@selector(supportsAlternateIcons)]){
        if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
            return;
        }
        
        if ([iconName isEqualToString:@""]) {
            iconName = nil;
        }
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换app图标发生错误了 ： %@",error);
            }
        }];
    }else{
        return;
    }
    
}
//MARK: -- UI懒加载 --
- (UIButton *)changeIconBtn{
    if (!_changeIconBtn) {
        _changeIconBtn = [[UIButton alloc]init];
        _changeIconBtn.backgroundColor = [UIColor yellowColor];
    }
    return _changeIconBtn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
