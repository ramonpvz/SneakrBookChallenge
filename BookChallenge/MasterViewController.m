//
//  MasterViewController.m
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import "MasterViewController.h"
#import "EditViewController.h"
#import "PeopleViewController.h"
#import "Person.h"

@interface MasterViewController ()

@property NSArray *friends;

@end

@implementation MasterViewController

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

- (IBAction)unwindPerson:(UIStoryboardSegue *)segue {
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    
    PeopleViewController *peopleViewController = segue.sourceViewController;
    
    Person *choosenPerson = [peopleViewController choosenPerson];
    
    person.name = choosenPerson.name;
    person.gender = choosenPerson.gender;
    person.brand = choosenPerson.brand;
    person.shoeColor = choosenPerson.shoeColor;
    person.shoeSize = choosenPerson.shoeSize;
    
    [self.managedObjectContext save:nil];
    
    [self loadFriends];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Person *personILike = [self.friends objectAtIndex:indexPath.row];
    
    cell.textLabel.text = personILike.name;
    
    return cell;
}


@end
