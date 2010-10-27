//
//  RootViewController.m
//  pdc2010Viewer
//
//  Created by Ryan Cain on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "ScheduleModel.h"
#import "SessionListViewController.h"

@implementation RootViewController

@synthesize timeSlotTableView, timeSlotsForTable;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(retrieveTitles:)];
	self.navigationItem.rightBarButtonItem = refreshButton;
	[refreshButton release];
	
	UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
	UIBarButtonItem *activityButton = [[UIBarButtonItem alloc] initWithCustomView:activityView];
	
	[activityView startAnimating];
	[activityView hidesWhenStopped];
	
	self.navigationItem.leftBarButtonItem = activityButton;
	
	[activityButton	 release];
	[activityView release];
	
	[self retrieveTitles:self];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

-(void)processTimeSlots:(NSArray *)timeSlots
{
	NSMutableArray *days = [[NSMutableArray alloc] init];
	NSMutableDictionary *keys = [[NSMutableDictionary alloc] init];
	NSInteger count = 0;
	
	for(TimeSlot *ts in timeSlots)
	{
		NSDateFormatter *format = [[NSDateFormatter alloc] init];
		[format setDateFormat:@"MM/dd/yyyy"];
		NSString *key = [format stringFromDate:ts.m_Start];
		NSInteger currentIndex = 0;
		
		if([keys objectForKey:key])	{
			currentIndex = [[keys objectForKey:key] intValue];
		}
		else {
			[keys setObject:[NSNumber numberWithInt:count] forKey:key];
			currentIndex = count;
			count++;
		}

		if ([days count] == currentIndex + 1) {
			NSMutableArray *times = [days objectAtIndex:currentIndex];
			[times addObject:ts];
		}
		else {
			NSMutableArray *times = [[NSMutableArray alloc] init];
			[times addObject:ts];
			[days addObject:times];
			[times release];
		}
		
		[format release];
	}
	
	timeSlotsForTable = days;
	
	[keys release];
}

//method to retrieve all titles
- (void)retrieveTitles:(id) sender
{
	[(UIActivityIndicatorView *)self.navigationItem.leftBarButtonItem.customView startAnimating];
	[(UIActivityIndicatorView *)self.navigationItem.leftBarButtonItem.customView hidesWhenStopped];

	//NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	ScheduleModel *schedule = [[ScheduleModel alloc]initWithUri:@"http://odata.microsoftpdc.com/ODataSchedule.svc/" credential:nil];
	DataServiceQuery *query = [schedule timeslots];
	QueryOperationResponse *response = [query execute];
	resultArray = [[response getResult] retain];
	NSSortDescriptor *startStringSorter = [[NSSortDescriptor alloc] initWithKey:@"m_StartString" ascending:YES];
	NSArray *sortedArray = [[resultArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:startStringSorter]] retain];
	resultArray = sortedArray;
	[self processTimeSlots:resultArray];
	
	query = [schedule sessions];
	[query expand:@"Presenters"];
	response = [query execute];
	allSessionsArray = [[response getResult] retain];
	
	query = [schedule speakers];
	response = [query execute];
	allSpeakersArray = [[response getResult] retain];	
	
	[timeSlotTableView reloadData];
	
	[(UIActivityIndicatorView *)self.navigationItem.leftBarButtonItem.customView stopAnimating];
	[(UIActivityIndicatorView *)self.navigationItem.leftBarButtonItem.customView hidesWhenStopped];

	[startStringSorter release];
	[schedule release];
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [timeSlotsForTable count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[timeSlotsForTable objectAtIndex:section] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSArray *values = [timeSlotsForTable objectAtIndex:indexPath.section];
	
	// Configure the cell.
	TimeSlot *timeSlot = [values objectAtIndex:indexPath.row];
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"h:mm a"];
	NSString *startTime = [format stringFromDate:timeSlot.m_Start];
	
	cell.textLabel.text = startTime;

	[format release];
	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
	NSArray *values = [timeSlotsForTable objectAtIndex:section];
	
	// Configure the cell.
	TimeSlot *timeSlot = [values objectAtIndex:0];
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"MM/dd/yyyy"];
	NSString *startTime = [format stringFromDate:timeSlot.m_Start];

	[format release];
	
	return startTime;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


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

- (NSArray *)getSessionsWithTimeSlotId:(NSString *)timeSlotId
{
	NSMutableArray *sessions = [[NSMutableArray alloc] init];
	
	for(Session *s in allSessionsArray)
	{
		if([s.m_TimeSlotId isEqualToString:timeSlotId])
		{
			[sessions addObject:s];
		}
	}
	
	return [sessions autorelease];
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	SessionListViewController *sessionList = [[SessionListViewController alloc] initWithNibName:@"SessionListView" bundle:nil];
	TimeSlot *timeSlot = [resultArray objectAtIndex:indexPath.row];
	sessionList.sessionsArray = [self getSessionsWithTimeSlotId:timeSlot.m_Id];
	sessionList.speakersArray = allSpeakersArray;

	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"MM/dd/yy h:mm a"];
	sessionList.title = [format stringFromDate:timeSlot.m_Start];
	
	[format release];
	
	[self.navigationController pushViewController:sessionList animated:YES];
	[sessionList release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
	self.timeSlotTableView = nil;
	self.timeSlotsForTable = nil;
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	self.timeSlotTableView = nil;
	self.timeSlotsForTable = nil;
}


- (void)dealloc {
	[timeSlotsForTable release];
	[timeSlotTableView release];
	[resultArray release];
	[allSessionsArray release];
	[allSpeakersArray release];
    [super dealloc];
}


@end

