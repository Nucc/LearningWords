//
//  NewTopicController.h
//  LearningWords
//
//  Created by Developer on 6/14/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TopicController.h"

@interface NewTopicController : UIViewController <UITableViewDataSource> {
    IBOutlet UITextField        *textField;
    IBOutlet UITableViewCell    *textFieldCell;

    IBOutlet TopicController    *controller;
}

@property (nonatomic, retain) UITextField   *textField;
@property (nonatomic, retain) UITableViewCell *textFieldCell;

- (IBAction) save: (id) sender;
- (IBAction) cancel: (id) sender;

- (void) textFieldDidEndEditing:(UITextField *) tf;
- (BOOL) textFieldShouldReturn: (UITextField *) tf;


@end
