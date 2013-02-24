//
//  Timer.h
//  Sudoku.v3
//
//  Created by Jessie on 2/14/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

#import "COLOR_CONSTANTS.h"

@interface Timer : UIView{
    NSTimer* timer;
    UIButton* theButton;
    NSDate *start;
    
    COLOR_CONSTANTS* COLORS;
    
    bool hidden;
}

-(void) timerPressed: (id) sender;
-(void)increaseTimerCount: (id) sender;

@end
