//
//  SetCard.m
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(void) SetContents
{
    self.contents = [NSString stringWithFormat:@"%@\n%@\n%d",self.color, self.fill, self.count];
}

@end
