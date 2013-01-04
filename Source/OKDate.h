//
//  OKDate.h
//  OKCocoaTesting
//
//  Created by Josh Wright on 12/21/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKDate : NSDate


#pragma Intro

/*
 Introducing OKDate
 
 NSDate is the built in date object for Cocoa. Simple operations such as formatting or getting and setting the time can be overly verbose and complicated.
 
 OKDate is a subclass of NSDate that removes the pain be easing tasks like date creation, formatting, and manipulation (unlike NSDate, OKDate is mutable).
 
 **Why did we subclass NSDate instead of using categories?**
 
 It's a good question & something we deeply investigated. Ultimately it's just a preference, but here are the reasons we believe subclassing is the most useful option.
 
   - Subclassing allows us to make a mutable object (ie `addSeconds:` doesn't return a new instance)
   - Categories cause problems if you're building a static library. [See this article](http://stackoverflow.com/a/2615407/193896)
   - NSDate could be faster & more precise; subclassing allows us to optimize it.
 */


/*
 Understanding Time Zones
 
 An NSDate represents a moment in time. OKDate works the same way. There is no timezone information stored in an NSDate. None. Timezones only matter when you parsing or rendering a date.
 
 Think of it like a solar flare. It happens at one specific moment in time, quite separate from the existence of time zones. If you want to tell someone what time the solar flare happened, you would first need to know what timezone they're in. Or what planet they are on.
 
 If you parse "12-25-2012 16:30" then that could represent 40 different moments in time because there are 40 timezones. Normally that date would be interpretted in your local time zone, but you could force it use a different time zone. Most people do their work in either local time or UTC.
 
 When you render a string, it can also render in any timezones - defaulting to your local timezone.
 */


/*
 BSD License
 
 OKDate is released under the BSD license.
 
 In simple terms this means do whatever you want with it (use it, change it, sell it, whatever), just don't put my endorsement on your software.
 
 Read more about the [BSD license](http://en.wikipedia.org/wiki/BSD_licenses)
 */


#pragma Creation

/* 
 Now
 
 To get the current date and time, call `[OKDate date]` with no parameters.
 
     OKDate* date = [OKDate date];
     OKDate* date = [[OKDate alloc] init];
 
 Notice that each constructor `init` has a matching `date` convenience method.
*/

- (id) init;
+ (OKDate*) date;
+ (OKDate*) now;


/*
 Year, Month, Day, Hour, Minute, Second
 
 It's easy to create a date with a specific year, month (1=January), date (day of month, 1 is first), hour, minute, and second.
 
     // January 1st 2012, 12:00:00.000 AM
     OKDate* date = [OKDate dateWithYear:2012 month:1];
     
     // June 16th 1982, 6:27:12.000 PM
     OKDate* date = [OKDate dateWithYear:1982 month:6 date:16 hour:18 minute:27 second:12];
 
 Any value past the year is optional, and will default to the lowest possible number.
 
 By default, the date is constructed with the current time zone. To create a date from an array at UTC, you can use the following:
 
     OKDate* date = [OKDate dateWithUtcYear:2012 month:1];
 */

- (id) initWithYear:(int)year;
- (id) initWithYear:(int)year month:(int)month;
- (id) initWithYear:(int)year month:(int)month day:(int)day;
- (id) initWithYear:(int)year month:(int)month day:(int)day hour:(int)hour;
- (id) initWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute;
- (id) initWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;
- (id) initWithUtcYear:(int)year;
- (id) initWithUtcYear:(int)year month:(int)month;
- (id) initWithUtcYear:(int)year month:(int)month day:(int)day;
- (id) initWithUtcYear:(int)year month:(int)month day:(int)day hour:(int)hour;
- (id) initWithUtcYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute;
- (id) initWithUtcYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;
- (id) initWithCalendar:(NSCalendar*)calendar year:(int)year;
- (id) initWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month;
- (id) initWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day;
- (id) initWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day hour:(int)hour;
- (id) initWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute;
- (id) initWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;
+ (OKDate*) dateWithYear:(int)year;
+ (OKDate*) dateWithYear:(int)year month:(int)month;
+ (OKDate*) dateWithYear:(int)year month:(int)month day:(int)day;
+ (OKDate*) dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour;
+ (OKDate*) dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute;
+ (OKDate*) dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;
+ (OKDate*) dateWithUtcYear:(int)year;
+ (OKDate*) dateWithUtcYear:(int)year month:(int)month;
+ (OKDate*) dateWithUtcYear:(int)year month:(int)month day:(int)day;
+ (OKDate*) dateWithUtcYear:(int)year month:(int)month day:(int)day hour:(int)hour;
+ (OKDate*) dateWithUtcYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute;
+ (OKDate*) dateWithUtcYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;
+ (OKDate*) dateWithCalendar:(NSCalendar*)calendar year:(int)year;
+ (OKDate*) dateWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month;
+ (OKDate*) dateWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day;
+ (OKDate*) dateWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day hour:(int)hour;
+ (OKDate*) dateWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute;
+ (OKDate*) dateWithCalendar:(NSCalendar*)calendar year:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;


/*
 Number Array
 
 You can also create a date by passing in an array of NSNumbers (integers) where the order is year, month (1=January), date (day of month, 1 is first), hour, minute, second.

     // February 14th 2010, 3:25:50.125 PM
     OKDate* date = [OKDate dateWithNumbers:@[@2010, @2, @14, @15, @25, @50, @125]];
 
 Any value past the year is optional, and will default to the lowest possible number.
 
     // January 1st 2012, 12:00:00.000 AM 
     NSArray* numbers = [NSArray arrayWithObjects: [NSNumber numberWithInt:2012], nil];
     OKDate* date = [[OKDate alloc] initWithNumbers:numbers];
 
 By default, the date is constructed with the current time zone. To create a date from an array at UTC, you can use the following:
 
     OKDate* date = [OKDate dateWithUtcNumbers:@[@2010]];
 
 To use a timezone other than local or UTC, pass a calendar with your own timezone. For a list of timezones, see `[NSTimeZone abbreviationDictionary]` or [this article](http://stackoverflow.com/a/10345833/193896)
 
     NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
     calendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EST"];
     OKDate* date = [OKDate dateWithNumbers:@[ @2012 ] calendar:calendar];
 
 If no numbers are given or if `numbers` is nil then the current date & time is used (ie `[OKDate now]`).
 
 */

- (id) initWithNumbers:(NSArray*)numbers;
- (id) initWithUtcNumbers:(NSArray*)numbers;
- (id) initWithNumbers:(NSArray*)numbers calendar:(NSCalendar*)calendar;
+ (OKDate*) dateWithNumbers:(NSArray*)numbers;
+ (OKDate*) dateWithUtcNumbers:(NSArray*)numbers;
+ (OKDate*) dateWithNumbers:(NSArray*)numbers calendar:(NSCalendar*)calendar;


/*
 Unix Epoch
 
 You can create a date from a Unix timestamp using either milliseconds or seconds since the Unix Epoch.
 
     OKDate* date = [OKDate dateWithSecondsSinceUnixEpoch:1318781876];
     OKDate* date = [OKDate dateWithMSSinceUnixEpoch:1318781876000];
 
 The Unix Epoch is the time **00:00:00 UTC on 1 January 1970**.
 */

- (id) initWithSecondsSinceUnixEpoch:(double)secondsSinceEpoch;
- (id) initWithMSSinceUnixEpoch:(double)msSinceEpoch;
+ (OKDate*) dateWithSecondsSinceUnixEpoch:(double)secondsSinceEpoch;
+ (OKDate*) dateWithMSSinceUnixEpoch:(double)msSinceEpoch;


/*
 NSDate
 
 You can create a date with a pre-existing native NSDate object.
 
     NSDate* nsDate = [NSDate date];
     OKDate* date = [OKDate dateWithNSDate:nsDate];
 */

- (id) initWithNSDate:(NSDate*)nsDate;
+ (OKDate*) dateWithNSDate:(NSDate*)nsDate;


/*
 Cloning
 
 Unlike NSDate, OKDate is mutable. If you clone an OKDate, it will be mutable separately from the original.
 
     OKDate* a = [OKDate dateWithYear:1999];
     OKDate* b = [OKDate dateWithOKDate:a];
     a.year = 2000;
     b.year; // still 1999
 
 You can also call `clone` to copy a date:
 
     OKDate* a = [OKDate dateWithYear:1999];
     OKDate* b = [a clone];
     a.year = 2000;
     b.year; // still 1999
 */

- (id) initWithOKDate:(OKDate*)OKDate;
+ (OKDate*) dateWithOKDate:(OKDate*)OKDate;
- (OKDate*) clone;


/*
 Smart String
 
 Smart strings are mostly a convenient way of testing a date. It is a string version of the date in the format of yyyyMMddHHmmss. This makes it easy to read, write, sort, parse, etc. It always uses the local timezone for parsing and formatting.
 
     // January 1st 1999, 12:00:00AM
     OKDate* date = [OKDate dateWithSmartString:@"19990101000000"];
 */

- (id) initWithSmartString:(NSString*)str;
+ (OKDate*) dateWithSmartString:(NSString*)str;


/*
 String and Format
 
 If you know the format of an input string, you can use that to parse a date.
 
     OKDate* date = [OKDate dateWithString:@"12-25-1995" format:"MM-DD-YYYY"];
 
 If the string fails to be parsed, then date will be nil. `Parse` is the shorthand.
 
     OKDate* date = [OKDate parse:@"not a date" format:"MM-DD-YYYY"];
     date == nil; //this is true
 
 - **yy, yyyy** - year
 - **M, MM** - month of year
 - **MMM, MMMM** - month abbreviation, full month name
 - **d, dd** - day of month
 - **D, DD, DDD** - day of year
 - **Q, QQ, QQQ, QQQQ** - numerical quarter, "Q2", "4th quarter"
 - **w, ww** - week of year
 - **W** - week of month
 - **E, EE** - day of week numerical
 - **EEE, EEEE** - day of week abbreviation, full name
 - **a** - emits "AM" or "PM"
 - **h, hh** - hour [1 - 12]
 - **H, HH** - hour [0 - 23]
 - **m, mm** - minute [0 - 59]
 - **s, ss** - second [0 - 59]
 - **S** - Fractional seconds, decimal places for seconds.    
 - **v, vvvv** - Time zone abbreviation (PT) and full name (Pacific)
 - **Z, ZZ, ZZZ** - Time zone offset (-0800)
 */

- (id) initWithString:(NSString*)dateString format:(NSString*)format;
+ (OKDate*) dateWithString:(NSString*)dateString format:(NSString*)format;
+ (OKDate*) parse:(NSString*)dateString format:(NSString*)format;


/*
 Multiple Formats
 
 If you are unsure of the format, you can try multiple formats. The formats are tried in order; if none work then the result is nil.
 
 **Note:** This is considerably slower than parsing with a single format. This should only be used as a last line of defense.
 
     NSArray* formats = @[@"MM-DD-YYYY", @"YYYY-MM-DD"];
     OKDate* date = [OKDate parse:@"12-25-1995" formats:formats];
 */

- (id) initWithString:(NSString*)dateString formats:(NSArray*)formats;
+ (OKDate*) dateWithString:(NSString*)dateString formats:(NSArray*)formats;
+ (OKDate*) parse:(NSString*)dateString formats:(NSArray*)formats;


/*
 Parsing ISO8601 Date Strings
 
 Parsing ISO8601 dates come in many forms and are notorious difficult to parse. Peter Hosey offers a library to light work of parsing this format.
 
 His library, [iso-8601-date-formatter](https://github.com/boredzo/iso-8601-date-formatter), is embedded in `OKDate` to maximize convenience:
 
     OKDate* date = [OKDate dateFromISO8601:@"1997-07-16T19:20:30+01:00"];
 */

- (id) initWithISO8601:(NSString*)string;
- (id) initWithISO8601:(NSString*)string timeZone:(out NSTimeZone **)outTimeZone;
- (id) initWithISO8601:(NSString*)string timeZone:(out NSTimeZone **)outTimeZone range:(out NSRange *)outRange;

+ (OKDate *) dateFromISO8601:(NSString *)string;
+ (OKDate *) dateFromISO8601:(NSString *)string timeZone:(out NSTimeZone **)outTimeZone;
+ (OKDate *) dateFromISO8601:(NSString *)string timeZone:(out NSTimeZone **)outTimeZone range:(out NSRange *)outRange;


/*
 ASP.NET JSON Dates
 
 ASP.NET returns dates in json in the following formats: /Date(1198908717056)/ or /Date(1198908717056-0700)/
 */

- (id) initWithAspNetJsonDate:(NSString*)dateString;
+ (OKDate*) dateWithAspNetJsonDate:(NSString*)dateString;





#pragma Manipulation

/*
 Setting Units
 
 You can get or set the individual year, month (1-12), date (1-31), hour (0-23), minute (0-59), or second (0-59).
 
    OKDate* date = [OKDate dateWithYear:2013];
    date.year = 1999;
 
 In cases like month, if you set the month to a value over the max (12) then it will overflow to the next year. Likewise, setting it below the minimum rolls to the previous year.
 
     OKDate* date = [OKDate dateWithNumbers:@[ @2013, @6 ]];
     date.month = @14;
     //date is now "February 1, 2014"
 
 */

- (void) setYear:(int)year;
- (void) setMonth:(int)month;
- (void) setDayOfMonth:(int)day;
- (void) setHour:(int)hour;
- (void) setMinute:(int)Minute;
- (void) setSecond:(int)second;


/*
 Setting Units In Other Timezones
 
 Setting a unit requires knowing what timezone the unit should represent. For example, setting the hours to "2" would have different meanings in different timezones.
 
 By default, your current timezone is used. If you wish to use a different time zone, use the following methods.  Because UTC is such a common alternate timezone, there are special methods just for UTC.
 
     OKDate* date = [OKDate dateWithUtcYear:2013];
     date.yearUtc = 1999;
 
 */

- (void) setYearUtc:(int)year;
- (void) setMonthUtc:(int)month;
- (void) setDayOfMonthUtc:(int)day;
- (void) setHourUtc:(int)hour;
- (void) setMinuteUtc:(int)minute;
- (void) setSecondUtc:(int)second;

- (void) setYear:(int)year calendar:(NSCalendar*)calendar;
- (void) setMonth:(int)month calendar:(NSCalendar*)calendar;
- (void) setDayOfMonth:(int)day calendar:(NSCalendar*)calendar;
- (void) setHour:(int)hour calendar:(NSCalendar*)calendar;
- (void) setMinute:(int)minute calendar:(NSCalendar*)calendar;
- (void) setSecond:(int)second calendar:(NSCalendar*)calendar;


/*
 Adding Time
 
 You can add units such as years, months, days, hours, minutes, or seconds.
 
     OKDate* date = [OKDate dateWithYear:2013];
     [date addYears:2];
     date.year; // 2015
 
 You can pass negative numbers if you wish to subtract time.
 */

- (void) addSeconds:(int)seconds;
- (void) addMinutes:(int)minutes;
- (void) addHours:(int)hours;
- (void) addDays:(int)days;
- (void) addMonths:(int)days;
- (void) addYears:(int)days;


/*
 Adding Time In Other Timezones
 
 By default, time is added under the context of the current timezone (`[NSCalendar currentCalendar]`). To work in UTC or another time zone, use the following:
 
     OKDate* date = [OKDate dateWithUtcYear:2013];
     [date addYearsUtc:2];
     date.yearUtc; // 2015
 */

- (void) addSecondsUtc:(int)seconds;
- (void) addMinutesUtc:(int)minutes;
- (void) addHoursUtc:(int)hours;
- (void) addDaysUtc:(int)days;
- (void) addMonthsUtc:(int)days;
- (void) addYearsUtc:(int)days;

- (void) addSeconds:(int)seconds calendar:(NSCalendar*)calendar;
- (void) addMinutes:(int)minutes calendar:(NSCalendar*)calendar;
- (void) addHours:(int)hours calendar:(NSCalendar*)calendar;
- (void) addDays:(int)days calendar:(NSCalendar*)calendar;
- (void) addMonths:(int)days calendar:(NSCalendar*)calendar;
- (void) addYears:(int)days calendar:(NSCalendar*)calendar;


/*
 Adding Time Components
 
 You can also add multiple components (like years, months, days...) at once using the Cocoa class `NSDateComponents`.
 
     OKDate* date = [OKDate dateWithYear:2013];
     NSDateComponents* comps = [[NSDateComponents alloc] init];
     comps.year = 2;
     [date addComponents:comps];
     date.year; // 2015
 
 All components (such as year) can be negative if you wish to subtract time.
 */

- (void) addComponents:(NSDateComponents*)components;
- (void) addComponentsUtc:(NSDateComponents*)components;
- (void) addComponents:(NSDateComponents*)components calendar:(NSCalendar*)calendar;


#pragma Display

/*
 Getting Units
 
 You can get the individual units of a date such as the year. Similarly, you can also set each value.
 
 **year** - the 4 digit year
 **month** - the month (1 - 12)
 **dayOfYear** - the day of the year (1-365)
 **dayOfMonth** - the day of the month (1-31)
 **dayOfWeek** - the day of the week (1-7, 1=Sunday, 7=Saturday)
 **hour** - the hour (0-23)
 **minute** - the minute (0-59)
 **second** - the second (0-59)
 
     OKDate* date = [OKDate dateWithYear:2013];
     date.year; //2013
 
 If you wish to use a different calendar (timezone) than the current one, you can use the following:
 
     [date yearUtc];
     [date yearForCalendar:calendar];
 */

- (int) year;
- (int) month;
- (int) dayOfYear;
- (int) dayOfMonth;
- (int) dayOfWeek;
- (int) hour;
- (int) minute;
- (int) second;
- (int) yearUtc;
- (int) monthUtc;
- (int) dayOfYearUtc;
- (int) dayOfMonthUtc;
- (int) dayOfWeekUtc;
- (int) hourUtc;
- (int) minuteUtc;
- (int) secondUtc;
- (int) yearForCalendar:(NSCalendar*)calendar;
- (int) monthForCalendar:(NSCalendar*)calendar;
- (int) dayOfYearForCalendar:(NSCalendar*)calendar;
- (int) dayOfMonthForCalendar:(NSCalendar*)calendar;
- (int) dayOfWeekForCalendar:(NSCalendar*)calendar;
- (int) hourForCalendar:(NSCalendar*)calendar;
- (int) minuteForCalendar:(NSCalendar*)calendar;
- (int) secondForCalendar:(NSCalendar*)calendar;


/*
 Format
 
 Creates a string representation of the date using the specified format. Format characters include:
 
 **yy, yyyy** - year
 **M, MM** - month of year
 **MMM, MMMM** - month abbreviation, full month name
 **d, dd** - day of month
 **D, DD, DDD** - day of year
 **Q, QQ, QQQ, QQQQ** - numerical quarter, "Q2", "4th quarter"
 **w, ww** - week of year
 **W** - week of month
 **E, EE** - day of week numerical
 **EEE, EEEE** - day of week abbreviation, full name
 **a** - emits "AM" or "PM"
 **h, hh** - hour [1 - 12]
 **H, HH** - hour [0 - 23]
 **m, mm** - minute [0 - 59]
 **s, ss** - second [0 - 59]
 **S** - Fractional seconds, decimal places for seconds.
 **v, vvvv** - Time zone abbreviation (PT) and full name (Pacific)
 **Z, ZZ, ZZZ** - Time zone offset (-0800)
 
     OKDate* date = [OKDate dateWithNumbers:@[@2012, @12, @25]];
     [date format:@"MMMM d, yyyy"]; //December 25, 2012
 
 If the timezone is not specified, the local timezone is used.  Here's how you'd specify the timezone:
 
     OKDate* date = [OKDate dateWithUtcNumbers:@[@2012, @12, @25, @10, @20]];
     [date formatUtc:@"H:mma MMMM d, yyyy"]; //10:20AM December 25, 2012
 
     NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
     calendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EST"];
     [date format:@"H:mma MMMM d, yyyy" calendar:calender]; //10:20AM December 25, 2012
 */

- (NSString*) format:(NSString*)formatString;
- (NSString*) formatUtc:(NSString*)formatString;
- (NSString*) format:(NSString*)formatString calendar:(NSCalendar*)calendar;


/*
 ISO8601 Format
 
 ISO8601 is a standard format for parsing and reading a string representing a date. Because properly formatting a string to this standard is both common and difficult, we've included a native method to do the work which uses Peter Hosey's [iso-8601-date-formatter](https://github.com/boredzo/iso-8601-date-formatter). Here is how you create an ISO8601 string from an `OKDate`:

     OKDate* date = [OKDate dateWithNumbers:@[@2012, @12, @25, @10, @20]];
     [date iso8601]; // @"2012-12-25T10:20:00-0600"
 
 */

- (NSString *) iso8601;


/*
 Smart String
 
 Smart strings are mostly a convenient way of testing a date. It is a string version of the date in the format of yyyyMMddHHmmss. This makes it easy to read, write, sort, parse, etc. It always uses the local timezone for parsing and formatting.
 */

- (NSString*) smartString;
- (NSString*) smartStringUtc;
- (NSString*) smartStringForCalendar:(NSCalendar*)calendar;

/*
 Leap Year
 
 Returns true if it is a leap year. Utc and calendar (timezone) specific versions also available.
 */

- (BOOL) isLeapYear;
- (BOOL) isLeapYearUtc;
- (BOOL) isLeapYearCalendar:(NSCalendar*)calendar;


/*
 Relative Time String
 
 A humanized description of the timespan between two dates.
 
     OKDate* a = [OKDate dateWithNumbers:@[2012, @1, @29]];
     OKDate* b = [OKDate dateWithNumbers:@[2012, @1, @29]];
     [a relativeTo:b]; // "a day ago"
     [b relativeTo:a direction:YES]; // "in a day"
     [b relativeTo:a direction:NO]; // "a day"
 */

- (NSString*) relativeTo:(OKDate*)date;
- (NSString*) relativeTo:(OKDate*)date direction:(BOOL)direction;
- (NSString*) relativeToNow;
- (NSString*) relativeToNowWithDirection:(BOOL)direction;


/*
 Comparison
 
 You can use NSDate's `compare:` to compare dates, but we offer some easier options.
 
     OKDate* a = [OKDate dateWithNumbers:@[2011]];
     OKDate* b = [OKDate dateWithNumbers:@[2012]];
     OKDate* c = [OKDate dateWithNumbers:@[2012]];
     [a isAfter:b]; // false
     [c isAfter:a]; // true
     [c isBefore:a]; // false
     [c isBefore:b]; // false
     [c isSameAs:b]; // true
 */

- (BOOL) isAfter:(OKDate*)date;
- (BOOL) isBefore:(OKDate*)date;
- (BOOL) isSameAs:(OKDate*)date;


/*
 Original NSDate Methods
 
 Because OKDate is a subclass of NSDate, it retains all of its original functionality.
 */

- (NSTimeInterval) timeIntervalSinceDate:(NSDate*)date;
- (NSTimeInterval) timeIntervalSinceReferenceDate;


/*
 Ordinal
 
 Returns the ordinal for the given number:
 
     [OKDate ordinal:1]; // @"st"
     [OKDate ordinal:37]; // @"th"
 */

+ (NSString*) ordinal:(int)number;

#pragma End

@end





/******************* BEGIN ISO8601DateFormatter.h *******************************/

/*ISO8601DateFormatter.h
 *
 *Created by Peter Hosey on 2009-04-11.
 *Copyright 2009 Peter Hosey. All rights reserved.
 */

/*This class converts dates to and from ISO 8601 strings. A good introduction to ISO 8601: <http://www.cl.cam.ac.uk/~mgk25/iso-time.html>
 *
 *Parsing can be done strictly, or not. When you parse loosely, leading whitespace is ignored, as is anything after the date.
 *The loose parser will return an NSDate for this string: @" \t\r\n\f\t  2006-03-02!!!"
 *Leading non-whitespace will not be ignored; the string will be rejected, and nil returned. See the README that came with this addition.
 *
 *The strict parser will only accept a string if the date is the entire string. The above string would be rejected immediately, solely on these grounds.
 *Also, the loose parser provides some extensions that the strict parser doesn't.
 *For example, the standard says for "-DDD" (an ordinal date in the implied year) that the logical representation (meaning, hierarchically) would be "--DDD", but because that extra hyphen is "superfluous", it was omitted.
 *The loose parser will accept the extra hyphen; the strict parser will not.
 *A full list of these extensions is in the README file.
 */

/*The format to either expect or produce.
 *Calendar format is YYYY-MM-DD.
 *Ordinal format is YYYY-DDD, where DDD ranges from 1 to 366; for example, 2009-32 is 2009-02-01.
 *Week format is YYYY-Www-D, where ww ranges from 1 to 53 (the 'W' is literal) and D ranges from 1 to 7; for example, 2009-W05-07.
 */
enum {
	ISO8601DateFormatCalendar,
	ISO8601DateFormatOrdinal,
	ISO8601DateFormatWeek,
};
typedef NSUInteger ISO8601DateFormat;

//The default separator for time values. Currently, this is ':'.
extern unichar ISO8601DefaultTimeSeparatorCharacter;

@interface ISO8601DateFormatter: NSFormatter
{
	NSString *lastUsedFormatString;
	NSDateFormatter *unparsingFormatter;
    
	NSCalendar *parsingCalendar, *unparsingCalendar;
    
	NSTimeZone *defaultTimeZone;
	ISO8601DateFormat format;
	unichar timeSeparator;
	BOOL includeTime;
	BOOL parsesStrictly;
}

//Call this if you get a memory warning.
+ (void) purgeGlobalCaches;

@property(nonatomic, retain) NSTimeZone *defaultTimeZone;

#pragma mark Parsing

//As a formatter, this object converts strings to dates.

@property BOOL parsesStrictly;

- (NSDateComponents *) dateComponentsFromString:(NSString *)string;
- (NSDateComponents *) dateComponentsFromString:(NSString *)string timeZone:(out NSTimeZone **)outTimeZone;
- (NSDateComponents *) dateComponentsFromString:(NSString *)string timeZone:(out NSTimeZone **)outTimeZone range:(out NSRange *)outRange;

- (NSDate *) dateFromString:(NSString *)string;
- (NSDate *) dateFromString:(NSString *)string timeZone:(out NSTimeZone **)outTimeZone;
- (NSDate *) dateFromString:(NSString *)string timeZone:(out NSTimeZone **)outTimeZone range:(out NSRange *)outRange;

#pragma mark Unparsing

@property ISO8601DateFormat format;
@property BOOL includeTime;
@property unichar timeSeparator;

- (NSString *) stringFromDate:(NSDate *)date;
- (NSString *) stringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone;

@end

/********************* END ISO8601DateFormatter.m *******************************/

