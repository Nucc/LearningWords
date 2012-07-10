//
//  NewQuestionController.m
//  LearningWords
//
//  Created by Developer on 6/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewWordController.h"
#import "Word.h"

@implementation NewWordController

@synthesize localCell;
@synthesize foreignCell;

-(void) setTopicId:(int) _id
{
    topic_id = _id;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    [super initWithNibName:nibName bundle:nibBundle];
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([indexPath indexAtPosition:0] == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"localWordCell"];
        if (cell == nil) {
            cell = localCell;
        }
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"foreignWordCell"];
        if (cell == nil) {
            cell = foreignCell;
        }
        return cell;
    }
}

-(IBAction) save: (id)sender
{
    if ([Word add:localText.text : foreignText.text : topic_id])
    {
        localText.text = nil;
        foreignText.text = nil;
    }
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) cancel: (id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)dealloc {
    [super dealloc];
}


@end

