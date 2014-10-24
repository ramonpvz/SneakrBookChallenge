//
//  MasterViewController.h
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

