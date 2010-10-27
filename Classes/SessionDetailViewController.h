//
//  SessionDetailViewController.h
//  pdc2010Viewer
//
//  Created by Ryan Cain on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleModel.h"

@interface SessionDetailViewController : UITableViewController {
	Session *session;
	NSArray *speakerArray;
}

@property (nonatomic, retain) Session *session;
@property (nonatomic, retain) NSArray *speakerArray;

@end
