//
//  RandomQuestion.h
//  LearningWords
//
//  Created by Developer on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface RandomQuestion : NSObject
{
    Word            *original;
    NSMutableArray  *choices;
    int             goodChoice;
    int             topic;
}


@property (nonatomic, readonly) Word *original;
@property (nonatomic, readonly) NSMutableArray *choices;
@property (nonatomic, readonly) int goodChoice;


-(id) initWithTopicId:(int) topic_id;

-(void) setupObject;

@end
