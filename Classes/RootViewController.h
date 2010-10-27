//
//  RootViewController.h
//  pdc2010Viewer
//
//  Created by Ryan Cain on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSArray *resultArray;
	NSArray *allSessionsArray;
	NSArray *allSpeakersArray;
	UITableView *timeSlotTableView;
	NSMutableArray *timeSlotsForTable;
}

@property (nonatomic, retain) IBOutlet UITableView *timeSlotTableView;
@property (nonatomic, retain) NSMutableArray *timeSlotsForTable;

-(void)retrieveTitles:(id) sender;

@end
