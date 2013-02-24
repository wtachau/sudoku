//
//  GridView.h
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

#import "COLOR_CONSTANTS.h"

@interface GridView : UIView{
    NSMutableArray* buttonArray;
    id target;
    SEL selector;
    
    COLOR_CONSTANTS* COLORS;
}

@property int currentRow;
@property int currentColumn;

-(void) buttonPressed: (id) sender;
-(void) setValueAtRow: (int) row atColumn: (int) column forValue: (int) value withColor: (UIColor*) color;
-(void) setTarget: (id) target atAction: (SEL) action;
-(void) highlightAtRow: (int) row AtColumn: (int) column WithColor: (UIColor*) color;
@end