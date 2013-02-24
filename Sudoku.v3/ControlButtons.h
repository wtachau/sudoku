//
//  ControlButtons.h
//  Sudoku.v3
//
//  Created by Carson Ramsden on 2/14/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

#import "COLOR_CONSTANTS.h"

@interface ControlButtons : UIView
{
    UIButton* theButton;
    
    id target;
    SEL selector;
    
    COLOR_CONSTANTS* COLORS;
}

-(void) newGamePressed: (id) sender;
-(void) setTarget: (id) target atAction: (SEL) action;


@end
