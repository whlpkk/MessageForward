//
//  ViewController.m
//  zxcq
//
//  Created by kun on 15/9/24.
//  Copyright © 2015年 tuan800. All rights reserved.
//

#import "ViewController.h"
//#import "UIFont+MyFont.h"
#import "BaseClass.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
//    label.backgroundColor = [UIColor redColor];
//    label.font = [UIFont boldSystemFontOfSize:32];
//    label.text = @"123213";
//    [self.view addSubview:label];
    
    
    
    SubClass *ob = [[SubClass alloc] init];
    [ob baseVersionMethod];
    
    BaseClass *obj = [[BaseClass alloc] init];
    [obj baseVersionMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
