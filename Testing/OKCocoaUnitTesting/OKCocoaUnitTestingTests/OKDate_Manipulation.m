//
//  OKDate_Manipulation.m
//  OKCocoaUnitTesting
//
//  Created by Josh Wright on 12/21/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "OKDate_Manipulation.h"

@interface OKDate_Manipulation()
@property (retain) NSCalendar* estCalendar;
@end


@implementation OKDate_Manipulation

@synthesize estCalendar;

- (void) setUp
{
    self.estCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [self.estCalendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
}

- (void) test_setYear
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6 ]];
    date.year = 1999;
    OKDateMatchesString(date, @"19990601000000");
}

- (void) test_setYearUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2012, @6 ]];
    [date setYearUtc:2010];
    OKDateMatchesString(date, @"20100531190000");
}

- (void) test_setYearCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6 ] calendar:self.estCalendar];
    [date setYear:2011 calendar:self.estCalendar];
    OKDateMatchesString(date, @"20110531230000");
}

- (void) test_setMonth
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6 ]];
    date.month = 7;
    OKDateMatchesString(date, @"20120701000000");
}

- (void) test_setMonthUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2012, @6 ]];
    [date setMonthUtc:7];
    OKDateMatchesString(date, @"20120630190000");
}

- (void) test_setMonthCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6 ] calendar:self.estCalendar];
    [date setMonth:7 calendar:self.estCalendar];
    OKDateMatchesString(date, @"20120630230000");
}

- (void) test_setMonthOverflowRollsToNextYear
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6 ]];
    date.month = 13;
    OKDateMatchesString(date, @"20130101000000");
}

- (void) test_setMonthUnderflowRollsToPreviousYear
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6 ]];
    date.month = 0;
    OKDateMatchesString(date, @"20111201000000");
}

- (void) test_setDate
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15 ]];
    date.dayOfMonth = 17;
    OKDateMatchesString(date, @"20120617000000");
}

- (void) test_setDateUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2012, @6, @15 ]];
    [date setDayOfMonthUtc:17];
    OKDateMatchesString(date, @"20120616190000");
}

- (void) test_setDateCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15 ] calendar:self.estCalendar];
    [date setDayOfMonth:17 calendar:self.estCalendar];
    OKDateMatchesString(date, @"20120616230000");
}

- (void) test_setDateOverflowRollsToNextMonth
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15 ]];
    date.dayOfMonth = 32;
    OKDateMatchesString(date, @"20120702000000");
}

- (void) test_setDateUnderflowRollsToPreviousMonth
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15 ]];
    date.dayOfMonth = 0;
    OKDateMatchesString(date, @"20120531000000");
}

- (void) test_setHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14 ]];
    date.hour = 17;
    OKDateMatchesString(date, @"20120615170000");
}

- (void) test_setHourUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2012, @6, @15, @14 ]];
    [date setHourUtc:17];
    OKDateMatchesString(date, @"20120615120000");
}

- (void) test_setHourCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14 ] calendar:self.estCalendar];
    [date setHour:17 calendar:self.estCalendar];
    OKDateMatchesString(date, @"20120615160000");
}

- (void) test_setHourOverflowRollsToNextDay
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14 ]];
    date.hour = 32;
    OKDateMatchesString(date, @"20120616080000");
}

- (void) test_setHourUnderflowRollsToPreviousDay
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14 ]];
    date.hour = -1;
    OKDateMatchesString(date, @"20120614230000");
}

- (void) test_setMinute
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30 ]];
    date.minute = 17;
    OKDateMatchesString(date, @"20120615141700");
}

- (void) test_setMinuteUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2012, @6, @15, @14, @30 ]];
    [date setMinuteUtc:17];
    OKDateMatchesString(date, @"20120615091700");
}

- (void) test_setMinuteCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30 ] calendar:self.estCalendar];
    [date setMinute:17 calendar:self.estCalendar];
    OKDateMatchesString(date, @"20120615131700");
}

- (void) test_setMinuteOverflowRollsToNextHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30 ]];
    date.minute = 60;
    OKDateMatchesString(date, @"20120615150000");
}

- (void) test_setMinuteUnderflowRollsToPreviousHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30 ]];
    date.minute = -1;
    OKDateMatchesString(date, @"20120615135900");
}

- (void) test_setSecond
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30, @30 ]];
    date.second = 17;
    OKDateMatchesString(date, @"20120615143017");
}

- (void) test_setSecondUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2012, @6, @15, @14, @30, @30 ]];
    [date setSecondUtc:17];
    OKDateMatchesString(date, @"20120615093017");
}

- (void) test_setSecondCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30, @30 ] calendar:self.estCalendar];
    [date setSecond:17 calendar:self.estCalendar];
    OKDateMatchesString(date, @"20120615133017");
}

- (void) test_setSecondOverflowRollsToNextMinute
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30, @30 ]];
    date.second = 60;
    OKDateMatchesString(date, @"20120615143100");
}

- (void) test_setSecondUnderflowRollsToPreviousMinute
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2012, @6, @15, @14, @30, @30 ]];
    date.second = -1;
    OKDateMatchesString(date, @"20120615142959");
}

- (void) test_addSeconds
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addSeconds:30];
    OKDateMatchesString(date, @"20010101010131");
}

- (void) test_addSecondsUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addSecondsUtc:30];
    OKDateMatchesUtcString(date, @"20010101010131");
}

- (void) test_addSecondsForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    [date addSeconds:30 calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20010101010131", self.estCalendar);
}

- (void) test_addSecondsOverflow
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addSeconds:60];
    OKDateMatchesString(date, @"20010101010201");
}

- (void) test_addNegativeSeconds
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @2, @30 ]];
    [date addSeconds:-31];
    OKDateMatchesString(date, @"20010101010159");
}

- (void) test_addingADayOfSecondsAcrossDaylightSavingsChangesTheHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2011, @3, @12, @12, @0, @0 ]];
    [date addSeconds:24*60*60];
    OKDateMatchesString(date, @"20110313130000");
}

- (void) test_addMinutes
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addMinutes:30];
    OKDateMatchesString(date, @"20010101013101");
}

- (void) test_addMinutesUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addMinutesUtc:30];
    OKDateMatchesUtcString(date, @"20010101013101");
}

- (void) test_addMinutesForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    [date addMinutes:30 calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20010101013101", self.estCalendar);
}

- (void) test_addMinutesOverflow
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addMinutes:60];
    OKDateMatchesString(date, @"20010101020101");
}

- (void) test_addingADayOfMinutesAcrossDaylightSavingsChangesTheHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2011, @3, @12, @12, @0, @0 ]];
    [date addMinutes:24*60];
    OKDateMatchesString(date, @"20110313130000");
}

- (void) test_addHours
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addHours:3];
    OKDateMatchesString(date, @"20010101040101");
}

- (void) test_addHoursUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addHoursUtc:3];
    OKDateMatchesUtcString(date, @"20010101040101");
}

- (void) test_addHoursForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    [date addHours:3 calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20010101040101", self.estCalendar);
}

- (void) test_addHoursOverflow
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addHours:24];
    OKDateMatchesString(date, @"20010102010101");
}

- (void) test_addingADayOfHoursAcrossDaylightSavingsChangesTheHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2011, @3, @12, @12, @0, @0 ]];
    [date addHours:24];
    OKDateMatchesString(date, @"20110313130000");
}

- (void) test_addDays
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addDays:3];
    OKDateMatchesString(date, @"20010104010101");
}

- (void) test_addDaysUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addDaysUtc:3];
    OKDateMatchesUtcString(date, @"20010104010101");
}

- (void) test_addDaysForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    [date addDays:3 calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20010104010101", self.estCalendar);
}

- (void) test_addDaysOverflow
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addDays:32];
    OKDateMatchesString(date, @"20010202010101");
}

- (void) test_addingDaysAcrossDaylightSavingsDoesNotChangeTheHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2011, @3, @12, @12, @0, @0 ]];
    [date addDays:1];
    OKDateMatchesString(date, @"20110313120000");
}

- (void) test_addMonths
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addMonths:3];
    OKDateMatchesString(date, @"20010401010101");
}

- (void) test_addMonthsUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addMonthsUtc:3];
    OKDateMatchesUtcString(date, @"20010401010101");
}

- (void) test_addMonthsForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    [date addMonths:3 calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20010401010101", self.estCalendar);
}

- (void) test_addMonthsOverflow
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addMonths:13];
    OKDateMatchesString(date, @"20020201010101");
}

- (void) test_addingAMonthAcrossDaylightSavingsDoesNotChangeTheHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2011, @3, @12, @12, @0, @0 ]];
    [date addMonths:1];
    OKDateMatchesString(date, @"20110412120000");
}

- (void) test_addYears
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addYears:3];
    OKDateMatchesString(date, @"20040101010101");
}

- (void) test_addYearsUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    [date addYearsUtc:3];
    OKDateMatchesUtcString(date, @"20040101010101");
}

- (void) test_addYearsForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    [date addYears:3 calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20040101010101", self.estCalendar);
}

- (void) test_addingAYearAcrossDaylightSavingsDoesNotChangeTheHour
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2011, @3, @12, @12, @0, @0 ]];
    [date addYears:1];
    OKDateMatchesString(date, @"20120312120000");
}

- (void) test_addComponents
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    NSDateComponents* comps = [[NSDateComponents alloc] init];
    comps.year = 1;
    comps.month = 2;
    comps.day = 3;
    comps.hour = 4;
    comps.minute = 5;
    comps.second = 6;
    [date addComponents:comps];
    OKDateMatchesString(date, @"20020304050607");
}

- (void) test_addComponentsUtc
{
    OKDate* date = [OKDate dateWithUtcNumbers:@[ @2001, @1, @1, @1, @1, @1 ]];
    NSDateComponents* comps = [[NSDateComponents alloc] init];
    comps.year = 1;
    comps.month = 2;
    comps.day = 3;
    comps.hour = 4;
    comps.minute = 5;
    comps.second = 6;
    [date addComponentsUtc:comps];
    OKDateMatchesUtcString(date, @"20020304050607");
}

- (void) test_addComponentsForCalendar
{
    OKDate* date = [OKDate dateWithNumbers:@[ @2001, @1, @1, @1, @1, @1 ] calendar:self.estCalendar];
    NSDateComponents* comps = [[NSDateComponents alloc] init];
    comps.year = 1;
    comps.month = 2;
    comps.day = 3;
    comps.hour = 4;
    comps.minute = 5;
    comps.second = 6;
    [date addComponents:comps calendar:self.estCalendar];
    OKDateMatchesStringForCalendar(date, @"20020304050607", self.estCalendar);
}

@end
