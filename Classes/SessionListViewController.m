//
//  SessionListViewController.m
//  pdc2010Viewer
//
//  Created by Ryan Cain on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SessionListViewController.h"
#import "SessionDetailViewController.h"
#import "ScheduleModel.h"

@implementation SessionListViewController

@synthesize sessionsArray, speakersArray;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	[self.navigationController setNavigationBarHidden:NO];
	
	//[self retrieveSessions];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) retrieveSessions
{
	//NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
		
	/*ScheduleModel *schedule = [[ScheduleModel alloc]initWithUri:@"http://odata.microsoftpdc.com/ODataSchedule.svc/" credential:nil];
	DataServiceQuery *query = [schedule sessions];
	NSString *filterString = [[@" TimeSlotId eq (guid'" stringByAppendingString:timeSlotGuid] stringByAppendingString:@"')"];
	[query filter:filterString];
	[query expand:@"Presenters"];
	QueryOperationResponse *response = [query execute];
	resultArray = [[response getResult] retain];
	
	query = [schedule speakers];
	response = [query execute];
	speakerArray = [[response getResult] retain];*/
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [sessionsArray count];
}

- (Speaker *)findSpeaker:(NSString *)presenterId
{
	for(Speaker *s in speakersArray)
	{
		if ([s.m_Id isEqualToString:presenterId]) {
			return s;
		}
	}
	
	return nil;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	Session *session = [sessionsArray objectAtIndex:indexPath.row];

	NSString *presenterList = @"";
	for(Presenter *p in session.m_Presenters)
	{
		Speaker *s = [self findSpeaker:p.m_Id];
		
		if(s != nil)
		{
			presenterList = [[presenterList stringByAppendingString:s.m_FullName] stringByAppendingString:@", "];
		}
	}
	
	cell.textLabel.text = session.m_ShortTitle;
	cell.detailTextLabel.text = [[session.m_Room stringByAppendingString:@": "] stringByAppendingString:presenterList];
	//cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:session.m_ThumbnailUrl]]];
	
    return cell;
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	SessionDetailViewController *sessionDetail = [[SessionDetailViewController alloc] initWithNibName:@"SessionDetailView" bundle:nil];
	Session *session = [sessionsArray objectAtIndex:indexPath.row];
	sessionDetail.session = session;
	sessionDetail.speakerArray = speakersArray;
	
	[self.navigationController pushViewController:sessionDetail animated:YES];
	[sessionDetail release];
	//[session release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
	self.sessionsArray = nil;
	self.speakersArray = nil;
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	self.sessionsArray = nil;
	self.speakersArray = nil;
}


- (void)dealloc {
	[sessionsArray release];
	[speakersArray release];
	
    [super dealloc];
}


@end

