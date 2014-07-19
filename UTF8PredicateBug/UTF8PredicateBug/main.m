//
//  main.m
//  UTF8PredicateBug
//
//  Created by JP Simard on 7/18/14.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnglishClass : NSObject
@property NSString *strange;
@end

@implementation EnglishClass
- (NSString *)description {
    return self.strange;
}
@end

@interface FrenchClass : NSObject
@property NSString *étrange;
@end

@implementation FrenchClass
- (NSString *)description {
    return self.étrange;
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        EnglishClass *english = [EnglishClass new];
        english.strange = @"this works";
        NSLog(@"english: %@", english.strange);

        NSPredicate *englishPredicate = [NSPredicate predicateWithFormat:@"strange == 'this works'"];
        NSLog(@"english predicate: %@", [@[english] filteredArrayUsingPredicate:englishPredicate]);

        FrenchClass *french = [FrenchClass new];
        french.étrange = @"ceci fonctionne";
        NSLog(@"french: %@", french.étrange);

        NSPredicate *frenchPredicate = [NSPredicate predicateWithFormat:@"étrange == 'ceci ne fonctionne pas'"]; // This throws an exception: 'Unable to parse the format string "..."' (displays the correct string).
        NSLog(@"french predicate: %@", [@[french] filteredArrayUsingPredicate:frenchPredicate]);
    }
    return 0;
}
