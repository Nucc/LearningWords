//
//  QuestionController.h
//  LearningWords
//
//  Created by Developer on 6/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RandomQuestion;
@class NewWordController;

@interface QuestionController : UIViewController {

    NSInteger topicId;

    IBOutlet UILabel *text;

    IBOutlet UIButton   *meaning1;
    IBOutlet UIButton   *meaning2;
    IBOutlet UIButton   *meaning3;
    IBOutlet UIButton   *meaning4;

    RandomQuestion * question;
    NSArray * buttons_array;

    IBOutlet NewWordController * new_word_controller;
}

@property (nonatomic, retain) IBOutlet UILabel *text;

@property (nonatomic, retain) IBOutlet UIButton   *meaning1;
@property (nonatomic, retain) IBOutlet UIButton   *meaning2;
@property (nonatomic, retain) IBOutlet UIButton   *meaning3;
@property (nonatomic, retain) IBOutlet UIButton   *meaning4;


-(NSString *) getTitle;

-(id) initWithId:(NSInteger) newTopicId;

-(IBAction) meaningClicked:(id) sender;

-(IBAction) edit:(id) sender;

@end
