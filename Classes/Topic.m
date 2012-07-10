//
//  Topic.m
//  LearningWords
//
//  Created by Papp Laszlo on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Topic.h"


@implementation Topic

@synthesize topic;
@synthesize topic_id;

-(id) initWithTopic:(NSString*)title topic_id:(NSString*)_id;
{
    self = [super init];
    topic = [title retain];
    topic_id = [_id retain];
    return self;
}

+(NSMutableArray*) findAll
{
    if ([DatabaseModel database] == nil)
        return nil;

    NSMutableArray* topics = [[NSMutableArray alloc] init];
    FMResultSet *result = [[DatabaseModel database] executeQuery:@"select * from topics"];
    while (result && [result next])
    {
        NSString *topic     = [result stringForColumn:@"topic"];
        NSString *topic_id  = [result stringForColumn:@"id"];

        Topic * t = [[Topic alloc] initWithTopic:[topic retain] topic_id:[topic_id retain]];
        [topics addObject: t];
    }
    [result close];
    [topics retain];
    return topics;

}

+(int) count
{
    FMResultSet *result = [[DatabaseModel database] executeQuery:@"select count(id) from topics"];
    if (result && [result next])
    {
        return [result intForColumnIndex:0];
    }
    return 0;
}

+(BOOL)create:(NSString*) topicName;
{
    FMDatabase * database = [DatabaseModel database];
    BOOL success = [database executeUpdate:@"insert into topics (topic) VALUES (?)", topicName];

    if (!success)
    {
        NSLog( [NSString stringWithFormat: @"Database error: %s", [database lastErrorMessage]] );
    }
    return success;
}

+(BOOL)remove:(NSString*) topic
{
    [[DatabaseModel database] executeUpdate:@"delete from words where topic_id = ?", topic];
    return [[DatabaseModel database] executeUpdate:@"delete from topics where id=?", topic];
}

+(Topic*) findById: (NSString*) _id
{
    FMResultSet *result = [[DatabaseModel database] executeQuery:@"select * from topics where id=?", _id];
    if (result && [result next])
    {
        NSString *topic     = [result stringForColumn:@"topic"];
        NSString *topic_id  = [result stringForColumn:@"id"];

        return [[[Topic alloc] initWithTopic:topic topic_id:topic_id] autorelease];
    }
    return nil;
}

@end
