//
//  SetCardView.h
//  MyCardGame
//
//  Created by Carter Levin on 5/27/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property (nonatomic) int count;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *fill;
@property (strong, nonatomic) NSString *shape;
@property (nonatomic) BOOL selected;

@end
