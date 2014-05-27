//
//  SetCard.h
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *fill;
@property (nonatomic) int count;

@end
