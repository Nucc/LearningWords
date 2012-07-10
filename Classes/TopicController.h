//
//  TopicController.h
//  LearningWords
//
//  Created by Papp Laszlo on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewTopicController;
@class NewWordController;

@interface TopicController : UITableViewController {
    NSMutableArray *topics;
    IBOutlet UITableView * table;

    IBOutlet NewTopicController *new_topic_controller;
    IBOutlet NewWordController *new_word_contoller;
}

@property (nonatomic, retain) NewTopicController *new_topic_controller;
@property (nonatomic, retain) NewWordController *new_word_contoller;
@property (nonatomic, retain) UITableView *table;

- (IBAction) edit;
- (void) addNewTopic:(NSString*) topic_name;

@end
