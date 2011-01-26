    //
//  ItemsViewController.m
//  Homepwner
//
//  Created by Mike Pattee on 1/25/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "ItemsViewController.h"
#import "Possession.h"

@implementation ItemsViewController

- (id)init
	{
	// Call the superclass's designated initializer
	[super initWithStyle:UITableViewStyleGrouped];
	
	// Create an array of 10 random possession objects
	possessions = [[NSMutableArray alloc] init];
	for (int i = 0; i < 10; i++) 
		{
		[possessions addObject:[Possession randomPossession]];
		}
	return self;
	}
	
- (id)initWithStyle:(UITableViewStyle)style
	{
	return [self init];
	}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
	{
	return 1;
	}
	
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
	{
	int numberOfRows = [possessions count];
	if ([self isEditing]) 
		{
		numberOfRows++;
		}
	return numberOfRows;
	}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
	{
	// Create an instance of UITableViewCell, with default appearance
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	if (!cell) 
		{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
		}
	
	// Set the text on the cell with the description of the possession, that is at the nth index of possessions, where n = row this cell will appear in on the tableview
	if ([indexPath row] < [possessions count]) 
		{
		Possession *p = [possessions objectAtIndex:[indexPath row]];
		[[cell textLabel] setText:[p description]];
		}
	else
		{
		[[cell textLabel] setText:@"Add New Item..."];
		}
	return cell;
	}
	
- (UIView *)headerView
	{
	if (headerView)
		return headerView;
		
	// Create a UIButton object, simple rounded rect style
	UIButton *editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	// Set the title of this button to "Edit"
	[editButton setTitle:@"Edit" forState:UIControlStateNormal];
	
	// How wide is the screen
	float w = [[UIScreen mainScreen] bounds].size.width;
	
	// Create a rectangle for the button
	CGRect editButtonFrame = CGRectMake(8, 8, w - 16, 30);
	[editButton setFrame:editButtonFrame];
	
	// When this button is tapped, send the message editingButtonPressed: to this instance of ItemsVIewController
	[editButton addTarget:self action:@selector(editingButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	// Create a rectangle for the headerView that will contain the button
	CGRect headerViewFrame = CGRectMake(0, 0, w, 48);
	headerView = [[UIView alloc] initWithFrame:headerViewFrame];
	
	// Add button to the headerView's view hierarchy
	[headerView addSubview:editButton];
	
	return headerView;
	}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
	{
	return [self headerView];
	}
	
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
	{
	return [[self headerView] frame].size.height;
	}
	
- (void)setEditing:(BOOL)editing animated:(BOOL)animate
	{
	// ALways call super implementation of this method, it needs to do work 
	[super setEditing:editing animated:animate];
	// you need to insert/remove a new row in to table view
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[possessions count] inSection:0];
	NSArray *paths = [NSArray arrayWithObject:indexPath];
	if (editing) 
		{
		// If entering edit mode, we add another row to our table view
		[[self tableView] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
		}
	else 
		{
		// If leaving edit mode, we remove last row from table view
		[[self tableView] deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
		}
	}
	
- (void)editingButtonPressed:(id)sender
	{
	// If we are currently in editing mode...
	if ([self isEditing])
		{
		// Change text of button to inform user of state
		[sender setTitle:@"Edit" forState:UIControlStateNormal];
		// Turn off editing mode
		[self setEditing:NO animated:YES];
		}
	else 
		{
		// Change text of button to inform user of state
		[sender setTitle:@"Done" forState:UIControlStateNormal];
		// Enter editing mode
		[self setEditing:YES animated:YES];
		}
	}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
	{
	// If the table view is asking to commit a delete command...
	if (editingStyle == UITableViewCellEditingStyleDelete)
		{
		// We remove the row being deleted from the possessions array
		[possessions removeObjectAtIndex:[indexPath row]];
		
		// We also remove that row from the table view with an animation
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		}
	else if (editingStyle == UITableViewCellEditingStyleInsert)
		{
		// If the editing style of row as insertion, we add a new possession object and new row to the table view
		[possessions addObject:[Possession randomPossession]];
		[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
		}
	}
	
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
	{
	// Get pointer to the object being moved
	Possession *p = [possessions objectAtIndex:[fromIndexPath row]];
	
	// retain p so that it is not deallocated when it is removed from the array
	[p retain];
	// retain count is now 2
	
	// Remove p from our array, it is automatically sent release
	[possessions removeObjectAtIndex:[fromIndexPath row]];
	// retain count of p is now 1
	
	// Re-insert p into array at new location, it is automatically retained
	[possessions insertObject:p atIndex:[toIndexPath row]];
	// retain count of p is now 2
	
	// release p
	[p release];
	// retain count of p is now 1
	}
	
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
	{
	if ([indexPath row] < [possessions count]) 
		{
		return UITableViewCellEditingStyleDelete;
		}
	else 
		{
		return UITableViewCellEditingStyleInsert;
		}
	}
	
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
	{
	if ([indexPath row] < [possessions count]) 
		{
		return YES;
		}
	else 
		{
		return NO;
		}
	}
	
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
	{
	if ([proposedDestinationIndexPath row] < [possessions count])
		{
		// if we are moving to a row that currently is showing a possession, then we return the row the user wanted to move to
		return proposedDestinationIndexPath;
		}
	// We get here if we are trying to move a row to under the "Add New Item..." row, have the moving row go one row above it instead.
	NSIndexPath *betterIndexPath = [NSIndexPath indexPathForRow:[possessions count] - 1 inSection:0];
	return betterIndexPath;
	}

			
@end
