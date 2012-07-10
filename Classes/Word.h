//
//  Word.h
//  LearningWords
//
//  Created by Developer on 6/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseModel.h"
#import "FMDatabase.h"

@interface Word : DatabaseModel {

    NSString *foreign;
    NSString *local;
}

@property(readonly) NSString* foreign;
@property(readonly) NSString* local;

- (id) initWithPair:(NSString*) newForeign :(NSString *) newLocal;

+ (id)  findById:(int) rowId;

+ (int) count:(int) topicId;

+ (NSArray*) findByIds:(NSArray*) ids;

+ (Word*) byOffset: (int)offset topic:(int) topicId;

+ (bool) add:(NSString*) local :(NSString*) foreign :(int) topicId;

@end