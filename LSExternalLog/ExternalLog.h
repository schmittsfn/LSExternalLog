//
//  ExternalLog.h
//  LoggerClient
//
//  Created by Stefan Schmitt on 08/11/15.
//  Copyright © 2015 Stefan Schmitt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaRedis.h"


void LSExternalLogInfo(NSString* string);

void LSExternalLogWarn(NSString* string);

void LSExternalLogError(NSString* string);