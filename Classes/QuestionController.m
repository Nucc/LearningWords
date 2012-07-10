//
//  QuestionController.m
//  LearningWords
//
//  Created by Developer on 6/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "QuestionController.h"
#import "Word.h"
#import "Topic.h"
#import "RandomQuestion.h"
#import "NewWordController.h"

@implementation QuestionController

@synthesize text;
@synthesize meaning1;
@synthesize meaning2;
@synthesize meaning3;
@synthesize meaning4;

- (id) initWithId:(NSInteger) newTopicId
{
    [self init];
    topicId = newTopicId;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    buttons_array = [NSArray arrayWithObjects:meaning1, meaning2, meaning3, meaning4, nil];
    self.title = [self getTitle];
    text.textAlignment = UITextAlignmentCenter;
    text.font = [UIFont systemFontOfSize: 30.0];

    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = addButton;

    buttons_array = [[NSArray alloc] initWithObjects: meaning1, meaning2, meaning3, meaning4, nil];
}

- (void) viewWillAppear:(BOOL) animated
{
    if (question != nil)
        [question release];

    question = [[RandomQuestion alloc] initWithTopicId:topicId];

    text.text = question.original.foreign;
    [meaning1 setTitle:[[question.choices objectAtIndex:0] local] forState:UIControlStateNormal];
    [meaning2 setTitle:[[question.choices objectAtIndex:1] local] forState:UIControlStateNormal];
    [meaning3 setTitle:[[question.choices objectAtIndex:2] local] forState:UIControlStateNormal];
    [meaning4 setTitle:[[question.choices objectAtIndex:3] local] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

-(IBAction)meaningClicked:(id)sender
{

    if ([buttons_array objectAtIndex:(question.goodChoice)] == sender)
    {
        [self viewWillAppear:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]   initWithTitle:@"Ooopsss"
                                                    message:@"Bad answer"
                                                    delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"Again", nil];
        [alert show];
    }
}


- (NSString*)getTitle;
{
    NSString * tid = [NSString stringWithFormat:@"%d", topicId];

    // tid will be released auto
    return [[Topic findById: tid] topic];
}

- (void)dealloc {
    [super dealloc];
    [buttons_array release];
}

-(IBAction) edit:(id)sender
{
    [new_word_controller setTopicId:topicId];
    [self presentModalViewController:new_word_controller animated:YES];
}


@end
