//
//  GridModel.h
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridModel : UIView{
    int board[9][9];
    int initBoard[9][9];
    int numberCellsFilled;
    id target;
    SEL selector;
    
}

-(bool) isConsistentAtRow: (int) row atColumn: (int) column forValue: (int) value;
-(void) updateGridAtRow: (int) row atColumn: (int) column forValue: (int) value;
-(int) getValueAtRow: (int) row atColumn: (int) column;
-(bool) isMutableAtRow: (int) row atColumn: (int) column;
-(bool) hasValue: (int) value inRow: (int) row;
-(bool) hasValue: (int) value inColumn: (int) column;
-(int) blockNumAtRow: (int) row atColumn: (int) column;
-(bool) hasValue: (int) value inBlock:(int) block;
-(void) setInitValueGivenString: (NSString*) gridString;
-(void) setTarget:(id) sender atAction:(SEL)action;

@end
