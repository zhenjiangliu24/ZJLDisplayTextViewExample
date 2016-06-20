//
//  ViewController.m
//  ZJLDisplayTextViewExample
//
//  Created by ZhongZhongzhong on 16/6/19.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZJLDisplayTextView *textView = [[ZJLDisplayTextView alloc] initWithPosition:CGPointMake(100, 100) text:@"beautiful" fontSize:20.0];
    [self.view addSubview:textView];
    
    ZJLDisplayTextView *textView2 = [[ZJLDisplayTextView alloc] initWithPosition:CGPointMake(10, 200) text:@"this is a long text" fontSize:30.0];
    textView2.velocity = 180;
    [self.view addSubview:textView2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
