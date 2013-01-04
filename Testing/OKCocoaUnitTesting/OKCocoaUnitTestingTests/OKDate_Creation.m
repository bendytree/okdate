//
//  OKCocoaTestingTests.m
//  OKCocoaTestingTests
//
//  Created by Josh Wright on 12/21/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "OKDate_Creation.h"


@interface OKDate_Creation()
@property (retain) NSCalendar* estCalendar;
@end


@implementation OKDate_Creation

@synthesize estCalendar;

- (void) setUp
{
    self.estCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [self.estCalendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
}

- (void) test_init
{
    OKDateMatchesNSDate([[OKDate alloc] init], [NSDate date]);
}

- (void) test_date
{
    OKDateMatchesNSDate([OKDate date], [NSDate date]);
}

- (void) test_now
{
    OKDateMatchesNSDate([OKDate now], [NSDate date]);
}

- (void) test_initWithYear
{
    OKDateMatchesString([[OKDate alloc] initWithYear:2012], @"20120101000000");
}

- (void) test_initWithYearMonth
{
    OKDateMatchesString([[OKDate alloc] initWithYear:2012 month:6], @"20120601000000");
}

- (void) test_initWithYearMonthDay
{
    OKDateMatchesString([[OKDate alloc] initWithYear:2012 month:6 day:16], @"20120616000000");
}

- (void) test_initWithYearMonthDayHour
{
    OKDateMatchesString([[OKDate alloc] initWithYear:2012 month:6 day:16 hour:5], @"20120616050000");
}

- (void) test_initWithYearMonthDayHourMinute
{
    OKDateMatchesString([[OKDate alloc] initWithYear:2012 month:6 day:16 hour:5 minute:4], @"20120616050400");
}

- (void) test_initWithYearMonthDayHourMinuteSecond
{
    OKDateMatchesString([[OKDate alloc] initWithYear:2012 month:6 day:16 hour:5 minute:4 second:3], @"20120616050403");
}

- (void) test_initWithUtcYear
{
    OKDateMatchesString([[OKDate alloc] initWithUtcYear:2012], @"20111231180000");
}

- (void) test_initWithUtcYearMonth
{
    OKDateMatchesString([[OKDate alloc] initWithUtcYear:2012 month:6], @"20120531190000");
}

- (void) test_initWithUtcYearMonthDay
{
    OKDateMatchesString([[OKDate alloc] initWithUtcYear:2012 month:6 day:16], @"20120615190000");
}

- (void) test_initWithUtcYearMonthDayHour
{
    OKDateMatchesString([[OKDate alloc] initWithUtcYear:2012 month:6 day:16 hour:5], @"20120616000000");
}

- (void) test_initWithUtcYearMonthDayHourMinute
{
    OKDateMatchesString([[OKDate alloc] initWithUtcYear:2012 month:6 day:16 hour:5 minute:4], @"20120616000400");
}

- (void) test_initWithUtcYearMonthDayHourMinuteSecond
{
    OKDateMatchesString([[OKDate alloc] initWithUtcYear:2012 month:6 day:16 hour:5 minute:4 second:3], @"20120616000403");
}

- (void) test_initWithCalendarYear
{
    OKDateMatchesString([[OKDate alloc] initWithCalendar:self.estCalendar year:2012], @"20111231230000");
}

- (void) test_initWithCalendarYearMonth
{
    OKDateMatchesString([[OKDate alloc] initWithCalendar:self.estCalendar year:2012 month:6], @"20120531230000");
}

- (void) test_initWithCalendarYearMonthDay
{
    OKDateMatchesString([[OKDate alloc] initWithCalendar:self.estCalendar year:2012 month:6 day:16], @"20120615230000");
}

- (void) test_initWithCalendarYearMonthDayHour
{
    OKDateMatchesString([[OKDate alloc] initWithCalendar:self.estCalendar year:2012 month:6 day:16 hour:5], @"20120616040000");
}

- (void) test_initWithCalendarYearMonthDayHourMinute
{
    OKDateMatchesString([[OKDate alloc] initWithCalendar:self.estCalendar year:2012 month:6 day:16 hour:5 minute:4], @"20120616040400");
}

- (void) test_initWithCalendarYearMonthDayHourMinuteSecond
{
    OKDateMatchesString([[OKDate alloc] initWithCalendar:self.estCalendar year:2012 month:6 day:16 hour:5 minute:4 second:3], @"20120616040403");
}

- (void) test_dateWithYear
{
    OKDateMatchesString([OKDate dateWithYear:2012], @"20120101000000");
}

- (void) test_dateWithYearMonth
{
    OKDateMatchesString([OKDate dateWithYear:2012 month:6], @"20120601000000");
}

- (void) test_dateWithYearMonthDay
{
    OKDateMatchesString([OKDate dateWithYear:2012 month:6 day:16], @"20120616000000");
}

- (void) test_dateWithYearMonthDayHour
{
    OKDateMatchesString([OKDate dateWithYear:2012 month:6 day:16 hour:5], @"20120616050000");
}

- (void) test_dateWithYearMonthDayHourMinute
{
    OKDateMatchesString([OKDate dateWithYear:2012 month:6 day:16 hour:5 minute:4], @"20120616050400");
}

- (void) test_dateWithYearMonthDayHourMinuteSecond
{
    OKDateMatchesString([OKDate dateWithYear:2012 month:6 day:16 hour:5 minute:4 second:3], @"20120616050403");
}

- (void) test_dateWithUtcYear
{
    OKDateMatchesString([OKDate dateWithUtcYear:2012], @"20111231180000");
}

- (void) test_dateWithUtcYearMonth
{
    OKDateMatchesString([OKDate dateWithUtcYear:2012 month:6], @"20120531190000");
}

- (void) test_dateWithUtcYearMonthDay
{
    OKDateMatchesString([OKDate dateWithUtcYear:2012 month:6 day:16], @"20120615190000");
}

- (void) test_dateWithUtcYearMonthDayHour
{
    OKDateMatchesString([OKDate dateWithUtcYear:2012 month:6 day:16 hour:5], @"20120616000000");
}

- (void) test_dateWithUtcYearMonthDayHourMinute
{
    OKDateMatchesString([OKDate dateWithUtcYear:2012 month:6 day:16 hour:5 minute:4], @"20120616000400");
}

- (void) test_dateWithUtcYearMonthDayHourMinuteSecond
{
    OKDateMatchesString([OKDate dateWithUtcYear:2012 month:6 day:16 hour:5 minute:4 second:3], @"20120616000403");
}

- (void) test_dateWithCalendarYear
{
    OKDateMatchesString([OKDate dateWithCalendar:self.estCalendar year:2012], @"20111231230000");
}

- (void) test_dateWithCalendarYearMonth
{
    OKDateMatchesString([OKDate dateWithCalendar:self.estCalendar year:2012 month:6], @"20120531230000");
}

- (void) test_dateWithCalendarYearMonthDay
{
    OKDateMatchesString([OKDate dateWithCalendar:self.estCalendar year:2012 month:6 day:16], @"20120615230000");
}

- (void) test_dateWithCalendarYearMonthDayHour
{
    OKDateMatchesString([OKDate dateWithCalendar:self.estCalendar year:2012 month:6 day:16 hour:5], @"20120616040000");
}

- (void) test_dateWithCalendarYearMonthDayHourMinute
{
    OKDateMatchesString([OKDate dateWithCalendar:self.estCalendar year:2012 month:6 day:16 hour:5 minute:4], @"20120616040400");
}

- (void) test_dateWithCalendarYearMonthDayHourMinuteSecond
{
    OKDateMatchesString([OKDate dateWithCalendar:self.estCalendar year:2012 month:6 day:16 hour:5 minute:4 second:3], @"20120616040403");
}

- (void) test_initWithNullNumbersUsesNow
{
    OKDate* date = [[OKDate alloc] initWithNumbers:nil];
    OKDateMatchesNSDate(date, [NSDate date]);
}

- (void) test_initWith0NumbersUsesNow
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ ] ];
    OKDateMatchesNSDate(date, [NSDate date]);
}

- (void) test_initWithNumbersYear
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ @2000 ] ];
    OKDateMatchesString(date, @"20000101000000");
}

- (void) test_initWithNumbersYearMonth
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ @2000, @1 ] ];
    OKDateMatchesString(date, @"20000101000000");
}

- (void) test_initWithNumbersYearMonthDay
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ @2000, @1, @2 ] ];
    OKDateMatchesString(date, @"20000102000000");
}

- (void) test_initWithNumbersYearMonthDayHour
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ @2000, @1, @2, @3 ] ];
    OKDateMatchesString(date, @"20000102030000");
}

- (void) test_initWithNumbersYearMonthDayHourMinute
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ @2000, @1, @2, @3, @4 ] ];
    OKDateMatchesString(date, @"20000102030400");
}

- (void) test_initWithNumbersYearMonthDayHourMinuteSecond
{
    OKDate* date = [[OKDate alloc] initWithNumbers:@[ @2000, @1, @2, @3, @4, @5 ] ];
    OKDateMatchesString(date, @"20000102030405");
}

- (void) test_dateWithNumbersYear
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2000 ] ];
    OKDateMatchesString(date, @"20000101000000");
}

- (void) test_dateWithNumbersYearMonth
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2000, @1 ] ];
    OKDateMatchesString(date, @"20000101000000");
}

- (void) test_dateWithNumbersYearMonthDay
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2000, @1, @2 ] ];
    OKDateMatchesString(date, @"20000102000000");
}

- (void) test_dateWithNumbersYearMonthDayHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2000, @1, @2, @3 ] ];
    OKDateMatchesString(date, @"20000102030000");
}

- (void) test_dateWithNumbersYearMonthDayHourMinute
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2000, @1, @2, @3, @4 ] ];
    OKDateMatchesString(date, @"20000102030400");
}

- (void) test_dateWithNumbersYearMonthDayHourMinuteSecond
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2000, @1, @2, @3, @4, @5 ] ];
    OKDateMatchesString(date, @"20000102030405");
}

- (void) test_initWithUtcNullNumbersUsesNow
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:nil];
    OKDateMatchesNSDate(date, [NSDate date]);
}

- (void) test_initWithUtc0NumbersUsesNow
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ ] ];
    OKDateMatchesNSDate(date, [NSDate date]);
}

- (void) test_initWithUtcNumbersYear
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ @2000 ] ];
    OKDateMatchesString(date, @"19991231180000");
}

- (void) test_initWithUtcNumbersYearMonth
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ @2000, @1 ] ];
    OKDateMatchesString(date, @"19991231180000");
}

- (void) test_initWithUtcNumbersYearMonthDay
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ @2000, @1, @2 ] ];
    OKDateMatchesString(date, @"20000101180000");
}

- (void) test_initWithUtcNumbersYearMonthDayHour
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ @2000, @1, @2, @3 ] ];
    OKDateMatchesString(date, @"20000101210000");
}

- (void) test_initWithUtcNumbersYearMonthDayHourMinute
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ @2000, @1, @2, @3, @4 ] ];
    OKDateMatchesString(date, @"20000101210400");
}

- (void) test_initWithUtcNumbersYearMonthDayHourMinuteSecond
{
    OKDate* date = [[OKDate alloc] initWithUtcNumbers:@[ @2000, @1, @2, @3, @4, @5 ] ];
    OKDateMatchesString(date, @"20000101210405");
}

- (void) test_dateWithUtcNumbersYear
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2000 ] ];
    OKDateMatchesString(date, @"19991231180000");
}

- (void) test_dateWithUtcNumbersYearMonth
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2000, @1 ] ];
    OKDateMatchesString(date, @"19991231180000");
}

- (void) test_dateWithUtcNumbersYearMonthDay
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2000, @1, @2 ] ];
    OKDateMatchesString(date, @"20000101180000");
}

- (void) test_dateWithUtcNumbersYearMonthDayHour
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2000, @1, @2, @3 ] ];
    OKDateMatchesString(date, @"20000101210000");
}

- (void) test_dateWithUtcNumbersYearMonthDayHourMinute
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2000, @1, @2, @3, @4 ] ];
    OKDateMatchesString(date, @"20000101210400");
}

- (void) test_dateWithUtcNumbersYearMonthDayHourMinuteSecond
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2000, @1, @2, @3, @4, @5 ] ];
    OKDateMatchesString(date, @"20000101210405");
}

- (void) test_initWithSecondsSinceUnixEpoch
{
    OKDateMatchesString([[OKDate alloc] initWithSecondsSinceUnixEpoch:1318781876], @"20111016111756");
}

- (void) test_initWithMillisecondsSinceUnixEpoch
{
    OKDateMatchesString([[OKDate alloc] initWithMSSinceUnixEpoch:1318781876000], @"20111016111756");
}

- (void) test_dateWithSecondsSinceUnixEpoch
{
    OKDateMatchesString([OKDate dateWithSecondsSinceUnixEpoch:1318781876], @"20111016111756");
}

- (void) test_dateWithMillisecondsSinceUnixEpoch
{
    OKDateMatchesString([OKDate dateWithMSSinceUnixEpoch:1318781876000], @"20111016111756");
}

- (void) test_initWithNSDate
{
    NSDate* now = [NSDate date];
    OKDateMatchesNSDate([[OKDate alloc] initWithNSDate:now], now);
}

- (void) test_dateWithNSDate
{
    NSDate* now = [NSDate date];
    OKDateMatchesNSDate([OKDate dateWithNSDate:now], now);
}

- (void) test_initWithOKDateMatchesButClones
{
    OKDate* date1 = [[OKDate alloc] initWithYear:2012];
    OKDate* date2 = [[OKDate alloc] initWithOKDate:date1];
    [date2 addSeconds:1];
    OKDateMatchesString(date1, @"20120101000000");
    OKDateMatchesString(date2, @"20120101000001");
}

- (void) test_dateWithOKDateMatchesButClones
{
    OKDate* date1 = [OKDate dateWithYear:2012];
    OKDate* date2 = [OKDate dateWithOKDate:date1];
    [date2 addSeconds:1];
    OKDateMatchesString(date1, @"20120101000000");
    OKDateMatchesString(date2, @"20120101000001");
}

- (void) test_cloneMatchesButClones
{
    OKDate* date3 = [OKDate dateWithYear:2012];
    OKDate* date4 = [date3 clone];
    [date4 addSeconds:1];
    OKDateMatchesString(date3, @"20120101000000");
    OKDateMatchesString(date4, @"20120101000001");
}

- (void) test_initWithSmartString
{
    OKDateMatchesString([[OKDate alloc] initWithSmartString:@"20120102030405"], @"20120102030405");
}

- (void) test_dateWithSmartString
{
    OKDateMatchesString([OKDate dateWithSmartString:@"20120102030405"], @"20120102030405");
}

- (void) test_initWithStringFormat
{
    OKDateMatchesString([[OKDate alloc] initWithString:@"12-25-1995" format:@"MM-dd-yyyy"], @"19951225000000");
}

- (void) test_dateWithStringFormatParsesWithFormat
{
    OKDateMatchesString([OKDate dateWithString:@"12-25-1995" format:@"MM-dd-yyyy"], @"19951225000000");
}

- (void) test_parseFormat
{
    OKDateMatchesString([OKDate parse:@"12-25-1995" format:@"MM-dd-yyyy"], @"19951225000000");
}

- (void) test_dateWithStringFormatReturnsNilOnFailure
{
    STAssertTrue([OKDate dateWithString:@"not a date" format:@"MM-dd-yyyy"] == nil, @"date should be nil");
}

- (void) test_dateWithStringFormats_firstIsCorrect
{
    OKDate* date1 = [OKDate dateWithString:@"12-25-1995" formats:@[@"MM-dd-yyyy", @"yyyy"]];
    OKDateMatchesString(date1, @"19951225000000");
}

- (void) test_dateWithStringFormats_secondIsCorrect
{
    OKDate* date2 = [OKDate dateWithString:@"12-25-1995" formats:@[@"yyyy", @"MM-dd-yyyy"]];
    OKDateMatchesString(date2, @"19951225000000");
}

- (void) test_dateWithStringFormats_noneCorrectReturnsNil
{    
    OKDate* date3 = [OKDate dateWithString:@"12-25-1995" formats:@[@"MM-dd", @"yyyy"]];
    STAssertTrue(date3 == nil, @"date should be nil");
}

- (void) test_parseFormatsUsesFirstMatchingFormat
{
    OKDate* date2 = [OKDate parse:@"12-25-1995" formats:@[@"yyyy", @"MM-dd-yyyy"]];
    OKDateMatchesString(date2, @"19951225000000");
}

- (void) test_dateFromISO8601WithoutTimezoneDefaultsToCurrentTimezone
{
    OKDate* date = [OKDate dateFromISO8601:@"2006-06-14T11:06:00"];
    OKDateMatchesString(date, @"20060614110600");
}

- (void) test_dateFromISO8601WithTimezoneOffset
{
    OKDate* date = [OKDate dateFromISO8601:@"2006-06-14T11:06:00+02:00"];
    OKDateMatchesUtcString(date, @"20060614090600");
}

- (void) test_dateFromISO8601HandlesDifferentFormatts
{
    OKDate* date = [OKDate dateFromISO8601:@"2006-06-14"];
    OKDateMatchesString(date, @"20060614000000");
}

- (void) test_dateFromISO8601PopulatesTimezone
{
    NSTimeZone* timezone = nil;
    [OKDate dateFromISO8601:@"2006-06-14T11:06:00+02:00" timeZone:&timezone];
    AssertStringsEqual(timezone.abbreviation, @"GMT+02:00");
}

- (void) test_initWithAspNetJsonDate
{
    OKDate* date1 = [[OKDate alloc] initWithAspNetJsonDate:@"/Date(1240718400000)/"];
    OKDateMatchesString(date1, @"20090425230000");
}

- (void) test_dateWithAspNetJsonDateWithoutTimeZone
{
    OKDate* date1 = [OKDate dateWithAspNetJsonDate:@"/Date(1240718400000)/"];
    OKDateMatchesString(date1, @"20090425230000");
}

- (void) test_dateWithAspNetJsonDateWithTimezone
{
    OKDate* date2 = [OKDate dateWithAspNetJsonDate:@"/Date(1240718400000-0700)/"];
    OKDateMatchesString(date2, @"20090425230000");
}

@end
