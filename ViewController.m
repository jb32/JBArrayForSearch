//
//  ViewController.m
//  JBArrayForSearch
//
//  Created by 薛靖博 on 15/5/22.
//  Copyright (c) 2015年 JB. All rights reserved.
//

#import "ViewController.h"
#import "ClassA.h"
#import "NSArray+Search.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    
    for (int i=0; i<8; i++) {
        ClassA *a = [[ClassA alloc] init];
        a.name = @(i).stringValue;
        a.n = @(i);
        a.b = [[ClassB alloc] init];
        a.b.bName = @(i+1).stringValue;
        [datas addObject:a];
    }
    
    [datas searchWithKeyword:@"1"];
    
    NSLog(@"datas = %@, %@", datas, [datas searchWithKeyword:@"1"]);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
