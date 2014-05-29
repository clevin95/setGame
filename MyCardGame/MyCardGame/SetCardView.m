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
#define IMAGE_INSETS_HEIGHT 0.15
#define IMAGE_INSETS_WIDTH 0.17
#define CORNER_RADIUS 8
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    
    [roundedRect addClip];
    UIImage *background = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@%@.png",self.fill,self.color,self.shape]];
    NSLog(@"%@",background);
    
    CGRect topBox = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height * 0.5);
    
    CGRect middleBox = CGRectMake(self.bounds.origin.x, self.bounds.origin.y + (self.bounds.size.height * 0.5)/2, self.bounds.size.width, self.bounds.size.height * 0.5);
    
    CGRect bottomBox = CGRectMake(self.bounds.origin.x, self.bounds.origin.y + (self.bounds.size.height * 0.5), self.bounds.size.width, self.bounds.size.height * 0.5);
    
    CGRect imageRectTop = CGRectInset(topBox,
                                   self.bounds.size.width * IMAGE_INSETS_WIDTH,
                                   self.bounds.size.height * IMAGE_INSETS_HEIGHT);
    CGRect imageRectMiddle = CGRectInset(middleBox,
                                   self.bounds.size.width * IMAGE_INSETS_WIDTH,
                                   self.bounds.size.height * IMAGE_INSETS_HEIGHT);
    CGRect imageRectBottom = CGRectInset(bottomBox,
                                         self.bounds.size.width * IMAGE_INSETS_WIDTH,
                                         self.bounds.size.height * IMAGE_INSETS_HEIGHT);
    
    if (self.count % 2 != 0){
        [background drawInRect:imageRectMiddle];
    } if (self.count != 1){
        [background drawInRect:imageRectTop];
        [background drawInRect:imageRectBottom];
    }
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
}

- (void)drawShapes
{
    
}

@end
