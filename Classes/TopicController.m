//
//  TopicController.m
//  LearningWords
//
//  Created by Papp Laszlo on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TopicController.h"
#import "Word.h"
#import "Topic.h"
#import "QuestionController.h"
#import "NewTopicController.h"
#import "NewWordController.h"

@implementation TopicController

@synthesize table;
@synthesize new_topic_controller;
@synthesize new_word_contoller;

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(edit)];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = addButton;

    self.title = @"Topics";
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    topics = [Topic findAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Topic count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Topic";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }

    CGRect frame = cell.contentView.bounds;
    frame.origin.x = frame.origin.x + 10.0f;

    UILabel *textLabel = [[UILabel alloc] initWithFrame:frame];
    [textLabel setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin];
    textLabel.tag = 1;
    textLabel.text = [[topics objectAtIndex:indexPath.row] topic];
    textLabel.textAlignment = UITextAlignmentLeft;
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor blackColor];
    textLabel.font = [UIFont boldSystemFontOfSize:20.0];

    [cell.contentView addSubview:textLabel];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [textLabel release];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSInteger row = indexPath.row+1;
    if([Word count:indexPath.row+1] > 3)
    {
        QuestionController * question_controller = [[QuestionController alloc] initWithId: row];
        [self.navigationController pushViewController:question_controller animated:YES];
        [question_controller release];
    }
    else
    {
        [new_word_contoller setTopicId: row];
        [self presentModalViewController:new_word_contoller animated:YES];
    }
}

-(void) edit
{
    [self presentModalViewController:new_topic_controller animated:YES];
}

- (void) addNewTopic:(NSString*) topic_name
{
    [Topic create: topic_name];
    [table reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Topic * topic = [topics objectAtIndex:indexPath.row];
        [Topic remove: topic.topic_id];
        [topics removeObject:topic];
        [topic release];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];

    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

