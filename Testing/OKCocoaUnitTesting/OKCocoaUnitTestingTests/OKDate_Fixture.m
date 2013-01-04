//
//  OKDate_Fixture.m
//  OKCocoaTesting
//
//  Created by Josh Wright on 12/21/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "OKDate_Fixture.h"

@implementation OKDate_Fixture

- (void) okDate:(OKDate*)a matchesNSDate:(NSDate*)b error:(NSString*)error
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString* bStr = [formatter stringFromDate:b];;
    STAssertTrue([a.smartString isEqualToString:bStr], error);
}

- (void) okDate:(OKDate*)a matchesOKDate:(OKDate*)b error:(NSString*)error
{
    STAssertTrue([a.smartString isEqualToString:b.smartString], error);
}

@end
