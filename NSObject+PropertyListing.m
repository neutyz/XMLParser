//
//  NSObject+PropertyListing.m
//  TaiPing
//
//  Created by Tian Neo <neutyz@gmail.com> on 11-12-20.
//  Copyright (c) 2011年 bbdtek. All rights reserved.
//

#import "NSObject+PropertyListing.h"

@implementation NSObject (PropertyListing)   

- (NSDictionary *)properties_aps {   
    NSMutableDictionary *props = [NSMutableDictionary dictionary];   
    unsigned int outCount, i; 
    
    if(![@"NSObject" isEqualToString:NSStringFromClass([self class])]){
        Class super_obj = class_getSuperclass([self class]);  
        if(super_obj) {                                   
            props = (NSMutableDictionary *)[super_obj properties_aps];
        }
        
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        
        for (i = 0; i <outCount; i++) {   
            objc_property_t property = properties[i];  
            
            NSString *propertyName = [[[NSString alloc] initWithCString:property_getName(property)] autorelease];  
            id propertyType= [[[NSString alloc] initWithCString:property_getAttributes(property)] autorelease];   
            if (propertyType) [props setObject:propertyType forKey:propertyName];
        } 
        
        free(properties);  
    }
    return props;
}   

@end 
