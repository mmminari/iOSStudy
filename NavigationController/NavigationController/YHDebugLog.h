//
//  YHDebugLog.h
//
//  Created by DEV_TEAM1_IOS on 2015. 8. 25..
//  Copyright (c) 2015년 S.M Entertainment. All rights reserved.
//

#ifndef YHDebugLog_h

#define YHDebugLog_h
#define NSLog( s, ... ) NSLog( @"%@ : %d => %@\n\n", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#if (defined DEBUG) || (defined INHOUSE)
#define LogGreen(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define LogYellow(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define LogBlue(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog(@"😡"frmt, ##__VA_ARGS__)
#else
#define LogBlue(frmt, ...)
#define LogRed(frmt, ...)
#define LogGreen(frmt, ...)
#define LogYellow(frmt, ...)
#endif

#endif
