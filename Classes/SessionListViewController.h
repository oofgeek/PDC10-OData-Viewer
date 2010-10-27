//
//  SessionListViewController.h
//  pdc2010Viewer
//
//  Created by Ryan Cain on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SessionListViewController : UITableViewController {
	NSArray	*sessionsArray;
	NSArray *speakersArray;
}

@property (nonatomic, retain) NSArray *sessionsArray;
@property (nonatomic, retain) NSArray *speakersArray;

@end
