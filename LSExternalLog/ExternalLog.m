//
//  ExternalLog.h
//  LoggerClient
//
//  Created by Stefan Schmitt on 08/11/15.
//  Copyright © 2015 Stefan Schmitt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaRedis.h"


void sendMessage(NSString* message, NSString* host)
{
    CocoaRedis* redis = [CocoaRedis new];
    
    [[[redis connectWithHost:host] then:^id(id value) {
        return [redis publish:@"LSExternalLog" message:message];
    }] then:^id(id value) {
        NSLog(@"Number of subscribers that received the message: %@", value);
        return [redis quit];
    }];
}


void LSExternalLogInfo(NSString* string, NSString* host)
{
    sendMessage([NSString stringWithFormat:@"INFO: %@", string]);
}

void LSExternalLogWarn(NSString* string, NSString* host)
{
    sendMessage([NSString stringWithFormat:@"WARN: %@", string]);
}

void LSExternalLogError(NSString* string, NSString* host)
{
    sendMessage([NSString stringWithFormat:@"ERROR: %@", string]);
}