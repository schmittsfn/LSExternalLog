//
//  ExternalLog.h
//  LoggerClient
//
//  Created by Stefan Schmitt on 08/11/15.
//  Copyright © 2015 Stefan Schmitt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaRedis.h"


void LSExternalLogInfo(NSString* string, NSString* host);

void LSExternalLogWarn(NSString* string, NSString* host);

void LSExternalLogError(NSString* string, NSString* host);