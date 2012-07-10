//
//  NewTopicController.m
//  LearningWords
//
//  Created by Developer on 6/14/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewTopicController.h"
#import "Topic.h"

@implementation NewTopicController

@synthesize textField;
@synthesize textFieldCell;

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    [super initWithNibName:nibName bundle:nibBundle];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction) save: (id) sender
{
    [controller addNewTopic:textField.text];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) textFieldDidEndEditing:(UITextField *) tf
{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL) textFieldShouldReturn: (UITextField *) tf
{
    [textField resignFirstResponder];
    [controller addNewTopic:textField.text];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"textFieldCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = textFieldCell;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (void)dealloc {
    [super dealloc];
}


@end

