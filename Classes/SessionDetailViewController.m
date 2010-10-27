//
//  SessionDetailViewController.m
//  pdc2010Viewer
//
//  Created by Ryan Cain on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SessionDetailViewController.h"
#import "ScheduleModel.h"

@implementation SessionDetailViewController

@synthesize session, speakerArray;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = session.m_ShortTitle;
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
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *text = [self getTextForIndexPath:indexPath];
	UIFont *f = [UIFont systemFontOfSize:14];
	CGSize s;
	
	s = [text sizeWithFont:f constrainedToSize:CGSizeMake(200, 10000)];
	
	//s = [self getSizeOfText:text withFont:f];
    return s.height + 11; //I put some padding on it.
}

- (Speaker *)findSpeaker:(NSString *)presenterId
{
	for(Speaker *s in speakerArray)
	{
		if ([s.m_Id isEqualToString:presenterId]) {
			return s;
		}
	}
	
	return nil;
}

- (NSString *)getTextForIndexPath:(NSIndexPath *)indexPath{
	if(indexPath.row == 0)
	{
		return session.m_FullTitle;
	}
	else if(indexPath.row == 1)
	{
		return session.m_Room;
	}
	else if(indexPath.row == 2)
	{
		NSString *presenterList = @"";
		for(Presenter *p in session.m_Presenters)
		{
			Speaker *s = [self findSpeaker:p.m_Id];
			
			if(s != nil)
			{
				presenterList = [[presenterList stringByAppendingString:s.m_FullName] stringByAppendingString:@", "];
			}
		}
		
		return presenterList;
	}
	else if(indexPath.row == 3)
	{
		return session.m_FullDescription;
	}
	else if(indexPath.row == 4)
	{
		return session.m_TwitterHashtag;
	}
	else if(indexPath.row == 5)
	{
		return session.m_Code;
	}
	else if(indexPath.row == 6)
	{
	}
	else if(indexPath.row == 7)
	{
	}
	else if(indexPath.row == 8)
	{
	}
	else if(indexPath.row == 9)
	{
	}
	else if(indexPath.row == 10)
	{
	}
	
	return @"";
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	/*NSString *m_SessionState;
	NSString *m_Tags;
	NSString *m_SessionId;
	NSString *m_TrackId;
	NSString *m_TimeSlotId;
	NSString *m_Code;
	NSString *m_TwitterHashtag;
	NSString *m_ThumbnailUrl;
	NSString *m_ShortUrl;
	NSString *m_Room;
	NSNumber *m_StartTime;
	NSString *m_ShortTitle;
	NSString *m_ShortDescription;
	NSString *m_FullTitle;
	NSString *m_FullDescription;
	NSMutableArray *m_Manifests;
	NSMutableArray *m_Presenters;
	NSMutableArray *m_DownloadableContent;
	NSMutableArray *m_BackgroundMaterials;
	NSMutableArray *m_RelatedSessions;*/

	cell.detailTextLabel.text = [self getTextForIndexPath:indexPath];
	cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
	cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.detailTextLabel.numberOfLines = 100;
	cell.detailTextLabel.textAlignment = UITextAlignmentLeft;
	
	if(indexPath.row == 0)
	{
		cell.textLabel.text = @"Title";
	}
	else if(indexPath.row == 1)
	{
		cell.textLabel.text = @"Room";
	}
	else if(indexPath.row == 2)
	{
		cell.textLabel.text = @"Presenters";
	}
	else if(indexPath.row == 3)
	{
		cell.textLabel.text = @"Description";
	}
	else if(indexPath.row == 4)
	{
		cell.textLabel.text = @"Twitter Hash";
	}
	else if(indexPath.row == 5)
	{
		cell.textLabel.text = @"Code";
	}
	else if(indexPath.row == 6)
	{
		cell.textLabel.text = @"Room";
	}
	else if(indexPath.row == 7)
	{
		cell.textLabel.text = @"Room";
	}
	else if(indexPath.row == 8)
	{
		cell.textLabel.text = @"Room";
	}
	else if(indexPath.row == 9)
	{
		cell.textLabel.text = @"Room";
	}
	else if(indexPath.row == 10)
	{
		cell.textLabel.text = @"Room";
	}
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
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
	self.session = nil;
	self.speakerArray = nil;
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	self.session = nil;
	self.speakerArray = nil;
}


- (void)dealloc {
	[session release];
	[speakerArray release];
	
    [super dealloc];
}


@end

