//
//  SetCardView.m
//  MyCardGame
//
//  Created by Carter Levin on 5/27/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView
 
-(void) setCount:(int)count
{
    _count = count;
    [self setNeedsDisplay];
}

-(void) setShape:(NSString *)shape
{
    _shape = shape;
    [self setNeedsDisplay];
}

-(void) setFill:(NSString *)fill
{
    _fill = fill;
    [self setNeedsDisplay];
}

-(void) setColor:(NSString *)color
{
    _color = color;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#define CORNER_RADIUS 8
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    [roundedRect addClip];
    [[UIColor redColor] setFill];
    UIRectFill(self.bounds);
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
}

@end
