//
//  A.h
//  ArrayForPredicate
//
//  Created by 薛靖博 on 15/5/18.
//  Copyright (c) 2015年 JB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"

@interface ClassA : NSObject
@property (strong, nonatomic) NSNumber  *n;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) ClassB    *b;
@end
