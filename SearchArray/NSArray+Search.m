//
//  NSArray+Search.m
//  ChineseCommunity
//
//  Created by 薛靖博 on 15/5/16.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "NSArray+Search.h"
#import <objc/runtime.h>

@implementation NSArray (Search)

- (NSArray *)searchWithKeyword:(NSString *)keyword {
    
    if (self.count == 0) {
        return @[];
    }
    
    Class object = [[self firstObject] class];
    
    NSArray *arr = [self propertyName:object];
        
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    [arr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.%@ CONTAINS[cd] %@", obj, keyword];
        NSArray *results = [self filteredArrayUsingPredicate:predicate];
        [set addObjectsFromArray:results];
    }];
    
    
    return set.allObjects;
}

- (NSArray *)propertyName:(Class)propertyClass {
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(propertyClass, &propertyCount);
    
    __block NSArray *arrName = [[NSArray alloc] init];
    
    for (int i=0; i<propertyCount; i++) {
        objc_property_t property = properties[i];
        
        const char *attr = property_getAttributes(property);
        NSString *propertyAttr = [NSString stringWithCString:attr encoding:NSUTF8StringEncoding];
        NSArray *arrProperties = [propertyAttr componentsSeparatedByString:@"\""];
        NSString *strClass = [arrProperties objectAtIndex:1];
        NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(strClass)];
        
        if ([bundle isEqual:[NSBundle mainBundle]]) {
            NSArray *names = [self propertyName:NSClassFromString(strClass)];
            [names enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
                NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                arrName = [arrName arrayByAddingObject:[name stringByAppendingFormat:@".%@", obj]];
            }];
        } else if ([strClass isEqualToString:@"NSString"]) {
            NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            arrName = [arrName arrayByAddingObject:name];
        }
    }
    return arrName;
}

@end
