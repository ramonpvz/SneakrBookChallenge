//
//  PeopleViewController.m
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import "PeopleViewController.h"
#import "DetailViewController.h"
#import "CustomCellTableViewCell.h"
#import "Person.h"

@interface PeopleViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *people;

@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.people == nil) {
        self.people = [NSMutableArray array];
    }
    [self loadPeople];
}

- (void) loadPeople {
    
    NSError *jsonError;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"json"];
    NSString *json = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&jsonError];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
    
    for (NSDictionary *_person in [dic objectForKey:@"people"]) {
        Person *person = [[Person alloc] initWithDictionary:_person];
        [self.people addObject:person];
    }

    [self.tableView reloadData];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
    
        Person *_person = [self.people objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    
        DetailViewController *detailViewController = segue.destinationViewController;
    
        detailViewController.person = _person;

    }

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    Person *person = [self.people objectAtIndex:indexPath.row];
    
    cell.textLabel.text = person.name;
    
    return cell;
}

@end
