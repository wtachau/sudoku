//
//  Timer.m
//  Sudoku.v3
//
//  Created by Jessie on 2/14/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import "Timer.h"

@implementation Timer

- (id)initWithFrame:(CGRect)frame
{
    //the timer initializes as a button, which a user can press to show the elapsed time.
    //it defines the start of the game as the time when the game is initialized.
    
    self = [super initWithFrame:frame];
    if (self) {
        
        COLORS = [[COLOR_CONSTANTS alloc] init];
        
        self.backgroundColor = COLORS.BORDER;
        
        int originX=5;
        int originY=5;
        int length = (self.bounds.size.height-(10));
        int width = (self.bounds.size.width-(10));
        theButton = [[UIButton alloc] initWithFrame:CGRectMake(originX, originY, width, length)];
        [theButton addTarget:self action:@selector(timerPressed:) forControlEvents:UIControlEventTouchUpInside];
        [theButton setTitle:[[NSString alloc] initWithFormat:@"Show Time Elapsed"] forState:UIControlStateNormal];
        
        theButton.backgroundColor = COLORS.OPTIONS_BUTTONS_BACKGROUND;
        
        [theButton setTitleColor:COLORS.OPTIONS_BUTTONS_TEXT forState:UIControlStateNormal];
        
        theButton.exclusiveTouch = YES;
        
        [self addSubview:theButton];
        start = [NSDate dateWithTimeIntervalSinceNow:1];
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(increaseTimerCount:) userInfo:nil repeats:YES];
        
        hidden = YES;
        
    }
    return self;
}

-(void) timerPressed: (id) sender{
    //if the button is pressed, the timer is either hidden or unhidden.
    hidden = !hidden;
    if (hidden) {
        [theButton setTitle:[[NSString alloc] initWithFormat:@"Show Time Elapsed"] forState:UIControlStateNormal];
    }
    else {
        [self increaseTimerCount:timer];
    }

}
- (void)increaseTimerCount: (id) sender
{
    //time is shown in elapsed minutes and seconds
    NSTimeInterval timeInterval = [start timeIntervalSinceNow];
    if (!hidden) {
        int minutes = (int)(0-timeInterval) / 60;
        int seconds = (int)(0-timeInterval) % 60;
        [theButton setTitle:[[NSString alloc] initWithFormat:@"%02d:%02d", minutes, seconds] forState:UIControlStateNormal];
    }
    
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
