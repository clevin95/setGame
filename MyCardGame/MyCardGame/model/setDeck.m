//
//  setDeck.m
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import "setDeck.h"
#import "SetCard.h"

@implementation setDeck


- (NSArray *)Cards
{
    if (!_Cards){
        _Cards = [[NSMutableArray alloc] init];
    }
    return _Cards;
}

- (SetCard *)selectRandomCard
{
    int ranNum = arc4random() % [self.Cards count];
    SetCard *card = self.Cards[ranNum];
    [self.Cards removeObjectAtIndex:ranNum];
    return card;
}

- (void)createDeck;
{
    NSArray *colors = @[@"red",@"green",@"purple"];
    NSArray *shapes = @[@"diamond",@"squiggle",@"oval"];
    NSArray *fills = @[@"solid",@"striped",@"blank"];
    for (NSString *color in colors){
        for (NSString *shape in shapes){
            for (NSString *fill in fills){
                for (int count = 1; count <= 3; count++){
                    SetCard *card = [[SetCard alloc]init];
                    card.color = color;
                    card.shape = shape;
                    card.fill = fill;
                    card.count = count;
                    [self.Cards addObject:card];
                }
            }
        }
    }
}

@end
