//
//  Word.m
//  LearningWords
//
//  Created by Developer on 6/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Word.h"
#import "FMResultSet.h"

@implementation Word

@synthesize local;
@synthesize foreign;

- (id) initWithPair:(NSString*) newForeign :(NSString *) newLocal
{
    self = [super init];
    foreign = [newForeign retain];
    local   = [newLocal retain];
    return self;
}

- (void) dealloc
{
    [foreign release];
    [local release];
}

+ (id) findById:(int) rowId
{
    if ([DatabaseModel database] == nil)
        return nil;

    Word * word = nil;

    FMResultSet *result = [[DatabaseModel database] executeQuery:@"select * from words where id=?", [NSNumber numberWithInt:rowId]];
    if (result && [result next])
    {
        // Autoreleased
        NSString *foreign = [result stringForColumn:@"foreign_language"];
        NSString *local   = [result stringForColumn:@"local"];

        word = [[[Word alloc] initWithPair:foreign :local] autorelease];
    }
    [result close];
    return word;
}

+ (int) count:(int) topic_id
{
    FMResultSet *result = [[DatabaseModel database] executeQuery:@"select count(id) as num from words where topic_id=?",
                                    [NSString stringWithFormat:@"%d", topic_id]];
    int res = 0;
    if (result && [result next])
    {
        res = [result intForColumnIndex:0];
    }
    [result close];
    return res;
}

+ (NSArray*) findByIds:(NSArray*) ids
{
    return [[[NSArray alloc] initWithObjects:nil] autorelease];
}

+ (Word*) byOffset:(int)offset topic:(int) topicId
{
    FMResultSet *result = [[DatabaseModel database] executeQuery:@"select * from words where topic_id=? limit 1 offset ?",
                           [NSString stringWithFormat:@"%d", topicId], [NSString stringWithFormat:@"%d", offset]];
    Word *word = nil;
    if (result && [result next])
    {
        // Autoreleased objects
        NSString *foreign = [result stringForColumn:@"foreign_language"];
        NSString *local   = [result stringForColumn:@"local"];

        word = [[[Word alloc] initWithPair:foreign :local] autorelease];
    }
    [result close];
    return word;
}

+ (bool) add:(NSString*) local : (NSString*) foreign : (int) topic_id
{
    return [[DatabaseModel database] executeUpdate:@"insert into words (foreign_language, local, topic_id) values (?, ?, ?)",
                                                   foreign, local, [NSString stringWithFormat:@"%d", topic_id]];
}

@end
