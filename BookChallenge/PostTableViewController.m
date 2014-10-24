//
//  PostTableViewController.m
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import "PostTableViewController.h"
#import "Person.h"

@interface PostTableViewController ()

@property (strong, nonatomic) NSArray *filteredFriends;
@property (strong, nonatomic) NSArray *friends;

@end

@implementation PostTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadFriends];
}

- (void) loadFriends {
    
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
    self.friends = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if(!error) {
        NSLog(@"Friends I like: %lul", (unsigned long)self.friends.count);
    }
    else {
        NSLog(@"Error: %@", error);
    }
    
    [self.tableView reloadData];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if(tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredFriends count];
    } else{
        return [self.friends count];
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Person *person;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        person = [self.filteredFriends objectAtIndex:[indexPath row]];
    }
    else
    {
        person = [self.friends objectAtIndex:[indexPath row]];
    }
    
    cell.textLabel.text = person.name;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    
    NSLog(@"filter content...");
    
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    return YES;
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
     return YES;
}

@end
