//
//  OKDate_Display.m
//  OKCocoaUnitTesting
//
//  Created by Josh Wright on 12/21/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "OKDate_Display.h"

@interface OKDate_Display()
@property (retain) NSCalendar* estCalendar;
@end

@implementation OKDate_Display

@synthesize estCalendar;

- (void) setUp
{
    self.estCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [self.estCalendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
}

- (void) test_smartString
{
    OKDate* date = [OKDate dateWithYear:2000 month:1 day:2 hour:3 minute:4 second:5];
    OKDateMatchesString(date, @"20000102030405");
}

- (void) test_smartStringUtc
{
    OKDate* date = [OKDate dateWithUtcYear:2000 month:1 day:2 hour:3 minute:4 second:5];
    OKDateMatchesUtcString(date, @"20000102030405");
}

- (void) test_smartStringUtcStartingFromLocalTime
{
    OKDate* date = [OKDate dateWithYear:2000 month:1 day:2 hour:3 minute:4 second:5];
    OKDateMatchesUtcString(date, @"20000102090405");
}

- (void) test_smartStringForCalendar
{
    OKDate* date = [OKDate dateWithCalendar:self.estCalendar year:2000 month:1 day:2 hour:3 minute:4 second:5];
    OKDateMatchesStringForCalendar(date, @"20000102030405", self.estCalendar);
}

- (void) test_getYear
{
    OKDate* date = [OKDate dateWithYear:2012];
    STAssertTrue(date.year == 2012, @"Year should be 2012");
}

- (void) test_getYearUtc
{
    OKDate* date = [OKDate dateWithUtcYear:2012];
    STAssertTrue([date yearUtc] == 2012, @"Year should be 2012");
}

- (void) test_getYearWithCalendar
{
    OKDate* date = [OKDate dateWithUtcYear:2012];
    STAssertTrue([date yearForCalendar:self.estCalendar] == 2011, @"Year should be 2011");
}

- (void) test_getMonth
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:31 hour:22];
    STAssertTrue(date.month == 6, @"Month should be 16, was %i", date.monthUtc);
}

- (void) test_getMonthUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:7 day:1 hour:1];
    STAssertTrue([date monthUtc] == 6, @"Month should be 17, was %i", date.monthUtc);
}

- (void) test_getMonthWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:7 day:1 hour:1];
    STAssertTrue([date monthForCalendar:self.estCalendar] == 6, @"Month should be 16, was %i", [date monthForCalendar:self.estCalendar]);
}

- (void) test_getDayOfYear
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:22];
    STAssertTrue(date.dayOfYear == 168, @"Day should be 168, was %i", date.dayOfYear);
}

- (void) test_getDayOfYearUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:22];
    STAssertTrue([date dayOfYearUtc] == 169, @"Day should be 169, was %i", date.dayOfYearUtc);
}

- (void) test_getDayOfYearWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:23];
    STAssertTrue([date dayOfYearForCalendar:self.estCalendar] == 169, @"Day should be 169, was %i", [date dayOfYearForCalendar:self.estCalendar]);
}

- (void) test_getDayOfMonth
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:22];
    STAssertTrue(date.dayOfMonth == 16, @"Day should be 16");
}

- (void) test_getDayOfMonthUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:22];
    STAssertTrue([date dayOfMonthUtc] == 17, @"Day should be 17, was %i", date.dayOfMonthUtc);
}

- (void) test_getDayOfMonthWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:23];
    STAssertTrue([date dayOfMonthForCalendar:self.estCalendar] == 17, @"Day should be 16, was %i", [date dayOfMonthForCalendar:self.estCalendar]);
}

- (void) test_getDayOfWeek
{
    OKDate* date = [OKDate dateWithYear:2012 month:12 day:25];
    STAssertTrue(date.dayOfWeek == 3, @"Day should be 3, was %i", date.dayOfWeek);
}

- (void) test_getDayOfWeekUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:22];
    STAssertTrue([date dayOfWeekUtc] == 1, @"Day should be 1, was %i", date.dayOfWeekUtc);
}

- (void) test_getDayOfWeekWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:23];
    STAssertTrue([date dayOfWeekForCalendar:self.estCalendar] == 1, @"Day should be 1, was %i", [date dayOfWeekForCalendar:self.estCalendar]);
}

- (void) test_getHour
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14];
    STAssertTrue(date.hour == 14, @"Hour should be 14");
}

- (void) test_getHourUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14];
    STAssertTrue([date hourUtc] == 19, @"Hour should be 19, was %i", date.hourUtc);
}

- (void) test_getHourWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14];
    STAssertTrue([date hourForCalendar:self.estCalendar] == 15, @"Hour should be 19, was %i", [date hourForCalendar:self.estCalendar]);
}

- (void) test_getMinute
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14 minute:32];
    STAssertTrue(date.minute == 32, @"Minute should be 32");
}

- (void) test_getMinuteUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14 minute:32];
    STAssertTrue([date minuteUtc] == 32, @"Minute should be 32");
}

- (void) test_getMinuteWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14 minute:32];
    STAssertTrue([date minuteForCalendar:self.estCalendar] == 32, @"Minute should be 32");
}

- (void) test_getSecond
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14 minute:32 second:52];
    STAssertTrue(date.second == 52, @"Second should be 52");
}

- (void) test_getSecondUtc
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14 minute:32 second:52];
    STAssertTrue([date secondUtc] == 52, @"Second should be 52");
}

- (void) test_getSecondWithCalendar
{
    OKDate* date = [OKDate dateWithYear:2012 month:6 day:16 hour:14 minute:32 second:52];
    STAssertTrue([date secondForCalendar:self.estCalendar] == 52, @"Second should be 52");
}

- (void) test_format
{
    OKDate* date = [OKDate dateWithNumbers:@[@2012, @12, @25]];
    AssertStringsEqual([date format:@"MMMM d, yyyy"], @"December 25, 2012");
}

- (void) test_formatUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[@2012, @12, @25, @10, @20]];
    AssertStringsEqual([date formatUtc:@"H:mma MMMM d, yyyy"], @"10:20AM December 25, 2012");
}

- (void) test_formatWithCalendar
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[@2012, @12, @25, @10, @20]];
    NSString* str = [date format:@"H:mma MMMM d, yyyy" calendar:self.estCalendar];
    AssertStringsEqual(str, @"5:20AM December 25, 2012");
}

- (void) test_iso8601
{
    OKDate* date = [OKDate dateWithNumbers:@[@2012, @12, @25, @10, @20]];
    AssertStringsEqual([date iso8601], @"2012-12-25T10:20:00-0600");
}

- (void) test_isLeapYear
{
    OKDate* date1 = [OKDate dateWithNumbers:@[@2012]];
    STAssertTrue(date1.isLeapYear, @"Should be a leap year.");
    
    OKDate* date2 = [OKDate dateWithNumbers:@[@2013]];
    STAssertFalse(date2.isLeapYear, @"Should not be a leap year.");
}

- (void) test_isLeapYearUtc
{
    OKDate* date1 = [OKDate dateWithUtcNumbers:@[@2012]];
    STAssertTrue(date1.isLeapYearUtc, @"Should be a leap year.");
    
    OKDate* date2 = [OKDate dateWithUtcNumbers:@[@2013]];
    STAssertFalse(date2.isLeapYearUtc, @"Should not be a leap year.");
}

- (void) test_isLeapYearCalendar
{
    OKDate* date1 = [OKDate dateWithNumbers:@[@2012] calendar:self.estCalendar];
    STAssertTrue([date1 isLeapYearCalendar:self.estCalendar], @"Should be a leap year.");
    
    OKDate* date2 = [OKDate dateWithNumbers:@[@2013] calendar:self.estCalendar];
    STAssertFalse([date2 isLeapYearCalendar:self.estCalendar], @"Should not be a leap year.");
}

- (void) test_relativeToNowFuture
{
    OKDate* date = [OKDate dateWithNSDate:[NSDate dateWithTimeIntervalSinceNow:-60*60*24]];
    AssertStringsEqual([date relativeToNow], @"a day ago");
}

- (void) test_relativeToNowPast
{
    OKDate* a = [OKDate date];
    a.year = a.year + 1;
    AssertStringsEqual([a relativeToNow], @"in a year");
}

- (void) test_relativeToNowWithoutDirection
{
    OKDate* a = [OKDate date];
    a.year = a.year + 5;
    AssertStringsEqual([a relativeToNowWithDirection:NO], @"5 years");
}

- (void) test_relativeToNilDateIsNow
{
    OKDate* a = [OKDate date];
    a.year = a.year - 1;
    AssertStringsEqual([a relativeTo:nil], @"a year ago");
}

- (void) test_relativeToDate
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @28]];
    AssertStringsEqual([b relativeTo:a], @"a day ago");
}

- (void) test_relativeToDateWithDirection
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @28, @6, @30]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @28, @6, @46]];
    AssertStringsEqual([b relativeTo:a direction:YES], @"in 16 minutes");
}

- (void) test_relativeToDateWithoutDirection_years
{
    OKDate* a = [OKDate dateWithNumbers:@[@1965]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"47 years");
}

- (void) test_relativeToDateWithoutDirection_aYear
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012]];
    OKDate* b = [OKDate dateWithNumbers:@[@2011]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"a year");
}

- (void) test_relativeToDateWithoutDirection_months
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @12]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @3]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"9 months");
}

- (void) test_relativeToDateWithoutDirection_aMonth
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @6]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @5]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"a month");
}

- (void) test_relativeToDateWithoutDirection_days
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @1]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @26]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"25 days");
}

- (void) test_relativeToDateWithoutDirection_aDay
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @28]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"a day");
}

- (void) test_relativeToDateWithoutDirection_minutes
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @57, @46]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30, @46]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"27 minutes");
}

- (void) test_relativeToDateWithoutDirection_aMinute
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @31, @46]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30, @46]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"a minute");
}

- (void) test_relativeToDateWithoutDirection_seconds
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30, @47]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30, @46]];
    AssertStringsEqual([a relativeTo:b direction:NO], @"seconds");
}

- (void) test_comparison_isAfter_true
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @50]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30]];
    STAssertTrue([a isAfter:b], @"a should be greater than b");
}

- (void) test_comparison_isAfter_false
{
    OKDate* a = [OKDate dateWithNumbers:@[@2011]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012]];
    STAssertFalse([a isAfter:b], @"a should be not be after b");
}

- (void) test_comparison_isBefore_true
{
    OKDate* a = [OKDate dateWithNumbers:@[@2011]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012]];
    STAssertTrue([a isBefore:b], @"a should be before b");
}

- (void) test_comparison_isBefore_false
{
    OKDate* a = [OKDate dateWithNumbers:@[@2011]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012]];
    STAssertFalse([b isBefore:a], @"b should not be before a");
}

- (void) test_comparison_isSameAs_false
{
    OKDate* a = [OKDate dateWithNumbers:@[@2011]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012]];
    STAssertFalse([a isSameAs:b], @"a should not be same as b");
}

- (void) test_comparison_isSameAs_true
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012]];
    STAssertTrue([a isSameAs:b], @"a should be same as b");
}

- (void) test_timeIntervalSinceReferenceDate
{
    OKDate* a = [OKDate dateWithNumbers:@[@2001, @1, @15]];
    NSTimeInterval interval = [a timeIntervalSinceReferenceDate];
    STAssertTrue(interval == 1231200, @"interval was %f", interval);
}

- (void) test_timeIntervalSinceDate
{
    OKDate* a = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30, @20]];
    OKDate* b = [OKDate dateWithNumbers:@[@2012, @1, @29, @6, @30, @40]];
    NSTimeInterval interval = [a timeIntervalSinceDate:b];
    STAssertTrue(interval == -20, @"interval should be -20, was %f", interval);
}

- (void) test_ordinal_th
{
    AssertStringsEqual([OKDate ordinal:5], @"th");
}

- (void) test_ordinal_st
{
    AssertStringsEqual([OKDate ordinal:1], @"st");
}

- (void) test_ordinal_nd
{
    AssertStringsEqual([OKDate ordinal:2], @"nd");
}

- (void) test_ordinal_rd
{
    AssertStringsEqual([OKDate ordinal:3], @"rd");
}

@end
