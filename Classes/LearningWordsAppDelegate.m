//
//  LearningWordsAppDelegate.m
//  LearningWords
//
//  Created by Developer on 6/5/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "LearningWordsAppDelegate.h"

#import "DatabaseModel.h"
#import "QuestionController.h"

@implementation LearningWordsAppDelegate

@synthesize window;
@synthesize navigation_controller;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"words.db"];

    if ( ! [fileManager fileExistsAtPath:writableDBPath] )
    {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"words.db"];

        BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success)
        {
            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
        }
    }

    [DatabaseModel open:writableDBPath];
    [window addSubview: navigation_controller.view];
    [window makeKeyAndVisible];
}


- (void)dealloc
{
    [window release];
    [DatabaseModel close];
    [super dealloc];
}


@end
