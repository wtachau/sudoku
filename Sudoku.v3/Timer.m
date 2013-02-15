//
//  Timer.m
//  Sudoku.v3
//
//  Created by Jessie on 2/14/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

//Bug 1: You should only be able to start the timer if it hasn't been started (or if the game has beeen restarted)

#import "Timer.h"

@implementation Timer

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
        [theButton addTarget:self action:@selector(timerPressed:) forControlEvents:UIControlEventTouchUpInside];
        [theButton setTitle:[[NSString alloc] initWithFormat:@"Show Time Elapsed"] forState:UIControlStateNormal];
        theButton.backgroundColor = [UIColor whiteColor];
        [theButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:theButton];
        start = [NSDate dateWithTimeIntervalSinceNow:1];
        
    }
    return self;
}

-(void) timerPressed: (id) sender{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(increaseTimerCount:) userInfo:nil repeats:YES];
}
- (void)increaseTimerCount: (id) sender
{   
    NSTimeInterval timeInterval = [start timeIntervalSinceNow];
    [theButton setTitle:[[NSString alloc] initWithFormat:@"%d", (int)(0-timeInterval)] forState:UIControlStateNormal];
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
