//
//  OKDate_Fixture.h
//  OKCocoaTesting
//
//  Created by Josh Wright on 12/21/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "OKDate.h"

#define OKDateMatchesString(a, b)\
do { \
    BOOL isMatch = [a.smartString isEqualToString:b];\
    if (!isMatch) {\
        NSString* condition = [NSString stringWithFormat:@"'%@' == '%@'", a.smartString, b];\
        [self failWithException:([NSException failureInCondition:condition\
                                                          isTrue:NO \
                                                          inFile:[NSString stringWithUTF8String:__FILE__] \
                                                          atLine:__LINE__ \
                                                 withDescription:@"OKDate should match string"])]; \
    } \
} while (0)

#define OKDateMatchesUtcString(a, b)\
do { \
    BOOL isMatch = [a.smartStringUtc isEqualToString:b];\
    if (!isMatch) {\
        NSString* condition = [NSString stringWithFormat:@"'%@' == '%@'", a.smartStringUtc, b];\
        [self failWithException:([NSException failureInCondition:condition\
                                                            isTrue:NO \
                                                            inFile:[NSString stringWithUTF8String:__FILE__] \
                                                            atLine:__LINE__ \
                                                            withDescription:@"OKDate should match string"])]; \
    } \
} while (0)

#define OKDateMatchesStringForCalendar(a, b, c)\
do { \
    BOOL isMatch = [[a smartStringForCalendar:c] isEqualToString:b];\
    if (!isMatch) {\
        NSString* condition = [NSString stringWithFormat:@"'%@' == '%@'", [a smartStringForCalendar:c], b];\
        [self failWithException:([NSException failureInCondition:condition\
                                                            isTrue:NO \
                                                            inFile:[NSString stringWithUTF8String:__FILE__] \
                                                            atLine:__LINE__ \
                                                            withDescription:@"OKDate should match string"])]; \
    } \
} while (0)

#define AssertStringsEqual(a, b)\
do { \
    BOOL isMatch = [a isEqualToString:b];\
    if (!isMatch) {\
        NSString* condition = [NSString stringWithFormat:@"'%@' == '%@'", a, b];\
        [self failWithException:([NSException failureInCondition:condition \
                                                        isTrue:NO \
                                                        inFile:[NSString stringWithUTF8String:__FILE__] \
                                                        atLine:__LINE__ \
                                                        withDescription:@"Strings should match."])]; \
    } \
} while (0)

#define OKDateMatchesNSDate(a, b) [self okDate:a matchesNSDate:b error:@"Dates should match"];
#define OKDatesMatch(a, b) [self okDate:a matchesOKDate:b error:@"Dates should match"];


@interface OKDate_Fixture : SenTestCase

- (void) okDate:(OKDate*)a matchesNSDate:(NSDate*)b error:(NSString*)error;
- (void) okDate:(OKDate*)a matchesOKDate:(OKDate*)b error:(NSString*)error;

@end
