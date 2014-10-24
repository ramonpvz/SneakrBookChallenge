//
//  Person.h
//  BookChallenge
//
//  Created by GLBMXM0002 on 10/23/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSString *gender;
@property NSString *brand;
@property NSString *shoeColor;
@property NSString *shoeSize;

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end