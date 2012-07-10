//
//  NewQuestionController.h
//  LearningWords
//
//  Created by Developer on 6/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewWordController : UIViewController <UITableViewDataSource> {

    IBOutlet UITableViewCell * foreignCell;
    IBOutlet UITableViewCell * localCell;

    IBOutlet UITextField * foreignText;
    IBOutlet UITextField * localText;

    int topic_id;
}

@property (nonatomic, retain) UITableViewCell * foreignCell;
@property (nonatomic, retain) UITableViewCell * localCell;

-(void) setTopicId:(int) _id;

-(IBAction) save: (id)sender;
-(IBAction) cancel: (id)sender;


@end
