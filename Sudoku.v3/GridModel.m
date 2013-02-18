//
//  GridModel.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "GridModel.h"
#include "GridView.h"

@implementation GridModel
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        numberCellsFilled = 0;
        
        // Hard-coded string for some tests.  TODO - delete line in setInitValueGivenString after deleting this.
        // Also delete from header file.
        //gridString5 = [[NSString alloc] initWithFormat:@".55555555123456789123456789123456789123456789123456789123456789123456789123456789"];
    }
    return self;
}



-(void) setInitValueGivenString:(NSString *)gridString {
    //NSAssert([gridString length]==81, @"String is invalid size");
    //gridString = gridString5;
    int cellValue;
    for (int row=0; row<9;row++){
        for (int column=0; column<9; column++){
            if([gridString characterAtIndex:(row*9+column)]=='.'){
                cellValue=0;
            }
            else{
                int value = [self getIntFromChar:[gridString characterAtIndex:(row*9+column)]];
                //NSAssert(value>=1&&value<=9, @"Invalid input for grid");
                cellValue = value;
                ++numberCellsFilled;
            }
            initBoard[row][column]=cellValue;
            board[row][column]=cellValue;
        }
    }
    if (numberCellsFilled == 81)
    {
        [target performSelector: selector];
    }
   
}

-(int) getIntFromChar:(char) c {
    return (int) c - 48;
}

-(int)getValueAtRow:(int)row atColumn:(int)column{
    return board[row][column];
}

-(void) updateGridAtRow:(int)row atColumn:(int)column forNumber:(int)num{
    NSAssert(row>=0&&row<=8 && column>=0&&column<=8, @"Invalid Index");
    NSAssert(num>=0 && num<=9, @"Invalid number");
    if (board[row][column] == 0 && num != 0)
    {
        ++numberCellsFilled;
        NSLog(@"number of cells filled is %d",numberCellsFilled);
    }
    else if (board[row][column] != 0 && num == 0)
    {
        --numberCellsFilled;
        NSLog(@"number of cells filled is %d",numberCellsFilled);
    }
    board[row][column]=num;
    if (numberCellsFilled == 81)
    {
        [target performSelector: selector];
    }
}

-(bool) isMutableAtRow:(int)row atColumn:(int)column
{
    return (initBoard[row][column]==0);
}

-(bool) isConsistentAtRow:(int)row atColumn:(int)column forNumber:(int)num
{
    if (num == board[row][column] || num==0)
        return true;
    
    return (![self hasValue: num inRow: row] && ![self hasValue: num inColumn: column] && ![self hasValue: num inBlock:[self blockNumAtRow: row atColumn: column]]);
}

-(bool) hasValue: (int) value inRow: (int) row
{
    for (int column = 0; column<9; column++) {
        if (board[row][column]==value)
            return true;
    }
    return false;
}

-(bool) hasValue: (int) value inColumn: (int) column
{
    for (int row = 0; row<9; row++) {
        if (board[row][column]==value)
            return true;
    }
    return false;
}


-(int) blockNumAtRow: (int) row atColumn: (int) column
{
    return (row/3)*3 + (column/3);
}

-(bool) hasValue: (int) value inBlock:(int) block
{
    int rowStart = (block/3)*3;
    int columnStart = (block%3)*3;
    for (int i=rowStart; i<rowStart+3; i++){
        for (int j=columnStart; j<columnStart+3; j++){
            if(board[i][j]==value){
                return true;
            }
        }
    }
    return false;
}
-(void) setTarget:(id) sender atAction:(SEL)action
{
    target=sender;
    selector = action;
}

@end
