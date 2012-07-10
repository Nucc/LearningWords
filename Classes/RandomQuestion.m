//
//  RandomQuestion.m
//  LearningWords
//
//  Created by Developer on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RandomQuestion.h"
#import "DatabaseModel.h"

@implementation RandomQuestion

@synthesize original;
@synthesize goodChoice;
@synthesize choices;

-(id) initWithTopicId:(int) topic_id
{
    [self init];
    topic = topic_id;
    choices = [[NSMutableArray alloc] init];
    [self setupObject];
    return self;
}

-(void) setupObject
{
    goodChoice = arc4random() % 4;
    int countWords = [Word count: topic];
    int choice = arc4random() % countWords;

    original = [[Word byOffset: choice topic: topic] retain];

    NSMutableArray * nums = [[NSMutableArray alloc] init];
    [nums addObject:[NSNumber numberWithInt:choice]];

    for (int i=0; i<4; i++)
    {
        if (i == goodChoice)
        {
            [choices addObject: original];
        }
        else
        {
            int index = arc4random() % countWords;
            for(int j=0; j < [nums count]; j++)
            {
                if([[nums objectAtIndex:j] intValue] == index)
                {
                    index = (index+1) % countWords;
                    j = -1;
                }
            }
            [nums addObject:[NSNumber numberWithInt:index]];

            // word auto releases
            [choices addObject: [Word byOffset:index topic:topic] ];
        }
    }
    [nums release];
}

- (void)dealloc
{
    [choices release];
    [original release];
    [super dealloc];
}
@end
