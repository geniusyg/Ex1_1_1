//
//  ViewController.m
//  Ex1_1_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UITextField *pTextField;

@end

@implementation ViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self addNewProduct:nil];
	[textField resignFirstResponder];
	return YES;
}

- (IBAction)addNewProduct:(id)sender {
	Model *model = [Model sharedModel];
	NSString *pname = self.pTextField.text;
	[model addProduct:pname];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([model numberOfProducts]-1) inSection:0];
	NSArray *row = [NSArray arrayWithObject:indexPath];
	[self.table insertRowsAtIndexPaths:row withRowAnimation:UITableViewRowAnimationAutomatic];
	
	[self.pTextField setText:@""];
	[self.pTextField resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	[[Model sharedModel] removeProductAt:indexPath.row];
	
	NSArray *row = [NSArray arrayWithObject:indexPath];
	[tableView deleteRowsAtIndexPaths:row withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[Model sharedModel] numberOfProducts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
	
	Model *model = [Model sharedModel];
	cell.textLabel.text = [model productAt:indexPath.row];
	
	return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.pTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



























