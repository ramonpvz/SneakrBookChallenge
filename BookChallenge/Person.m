//
//  Person.m
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self)
    {
        self.name   = [dictionary objectForKey:@"name"];
        self.gender = [dictionary objectForKey:@"gender"];
        self.brand  = [[[dictionary objectForKey:@"shoe"] objectForKey:@"brand"] description];
        self.shoeColor = [[[dictionary objectForKey:@"shoe"] objectForKey:@"color"] description];
        self.shoeSize  = [[[dictionary objectForKey:@"shoe"] objectForKey:@"size"] description];
    }
    
    return self;
    
}

@end