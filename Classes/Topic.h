//
//  Topic.h
//  LearningWords
//
//  Created by Papp Laszlo on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseModel.h"

@interface Topic : DatabaseModel {
    NSString *topic_id;
    NSString *topic;
}

@property(readonly) NSString *topic;
@property(readonly) NSString *topic_id;

-(id) initWithTopic:(NSString*)title topic_id:(NSString*)_id;
+(NSMutableArray*) findAll;
+(int) count;

+(BOOL)create:(NSString*) topicName;
+(BOOL)remove:(NSString*) topic;

+(Topic*) findById: (NSString*) _id;

@end
