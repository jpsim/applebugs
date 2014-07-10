//
//  SubclassBugTests.m
//  SubclassBugTests
//
//  Created by JP Simard on 7/10/14.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <SubclassBug/SubclassBug.h>

@interface SubclassBugTests : XCTestCase

@end

@implementation SubclassBugTests

- (void)testPublicClass {
    XCTAssertNotNil([PublicClass new], @"PublicClass should be accessible");
}

@end
