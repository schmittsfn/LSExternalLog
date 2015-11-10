//
//  ExternalLog.h
//  LoggerClient
//
//  Created by Stefan Schmitt on 08/11/15.
//  Copyright © 2015 Stefan Schmitt. All rights reserved.
//

#import "LSExternalLog.h"


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
    sendMessage([NSString stringWithFormat:@"INFO: %@", string], host);
}

void LSExternalLogWarn(NSString* string, NSString* host)
{
    sendMessage([NSString stringWithFormat:@"WARN: %@", string], host);
}

void LSExternalLogError(NSString* string, NSString* host)
{
    sendMessage([NSString stringWithFormat:@"ERROR: %@", string], host);
}

void LSFillCredentials(NSString* host, void (^credentialsBlock)(NSString *userName, NSString* password))
{
    CocoaRedis* redis = [CocoaRedis new];
    
    __block NSString *aUserName = nil;
    
    [[[[[redis connectWithHost:host] then:^id(id value) {
        NSLog(@"Connected.");
        return [redis get: @"DEBUG_CREDENTIALS_USERNAME"];
    }] then:^id(id value) {
        aUserName = value;
        return [redis get: @"DEBUG_CREDENTIALS_PASSWORD"];
    }] then:^id(id value) {
        credentialsBlock(aUserName, value);
        return nil;
    }] catch:^id(NSError *err) {
        NSLog(@"Error: %@", err);
        return nil;
    }];
}