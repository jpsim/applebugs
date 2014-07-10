//
//  PublicClass.m
//  SubclassBug
//
//  Created by JP Simard on 7/10/14.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "PublicClass.h"
#import "PrivateClass.h"

@implementation PublicClass

+ (void)test {
    NSLog(@"PrivateClass should be accessible from inside the framework: %@", [PrivateClass new]);
}

- (NSString *)returnAString {
    return @"returning a string from PublicClass";
}

@end
