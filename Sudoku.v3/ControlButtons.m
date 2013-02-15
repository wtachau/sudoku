//
//  ControlButtons.m
//  Sudoku.v3
//
//  Created by Carson Ramsden on 2/14/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "ControlButtons.h"

@implementation ControlButtons

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor blackColor];
        int originX=5;
        int originY=5;
        int length = (self.bounds.size.height-(10));
        int width = (self.bounds.size.width-(10));
        theButton = [[UIButton alloc] initWithFrame:CGRectMake(originX, originY, width, length)];
        [theButton addTarget:self action:@selector(newGamePressed:) forControlEvents:UIControlEventTouchUpInside];
        [theButton setTitle:[[NSString alloc] initWithFormat:@"New Game"] forState:UIControlStateNormal];
        theButton.backgroundColor = [UIColor whiteColor];
        [theButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:theButton];
    }
    return self;
}

-(void) newGamePressed: (id) sender{
    NSLog(@"We still need to implement this button!");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
