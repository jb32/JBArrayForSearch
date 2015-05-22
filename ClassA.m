//
//  A.m
//  ArrayForPredicate
//
//  Created by 薛靖博 on 15/5/18.
//  Copyright (c) 2015年 JB. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"aa";
        self.b = [[ClassB alloc] init];
    }
    return self;
}

@end
