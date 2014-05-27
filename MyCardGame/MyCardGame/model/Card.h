//
//  Card.h
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) BOOL selected;
@property (strong, nonatomic) NSString *contents;

@end
