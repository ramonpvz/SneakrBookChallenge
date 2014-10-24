//
//  DetailViewController.m
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *brand;
@property (weak, nonatomic) IBOutlet UILabel *shoeColor;
@property (weak, nonatomic) IBOutlet UILabel *shoeSize;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = self.person.name;
    self.gender.text = self.person.gender;
    self.brand.text = self.person.brand;
    self.shoeColor.text = self.person.shoeColor;
    self.shoeSize.text = self.person.shoeSize;
}

- (Person *) choosenPerson {
    return self.person;
}

@end
