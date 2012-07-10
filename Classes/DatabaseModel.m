//
//  DatabaseModel.m
//  LearningWords
//
//  Created by Papp Laszlo on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DatabaseModel.h"


FMDatabase *database = nil;

@implementation DatabaseModel

+(BOOL) open:(NSString*) path
{
    if ( database == nil || ![database goodConnection])
    {
        database = [FMDatabase databaseWithPath: path];
        if ( ![database open] )
        {
            database = nil;
            return NO;
        }
    }
    [database retain];
    return YES;
}

+(void) close
{
    [database close];
    [database release];
}

+(id) database
{
    return database;
}

@end
