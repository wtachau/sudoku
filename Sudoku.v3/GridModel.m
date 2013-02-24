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
        //initializes numberCellsFilled value to be 0
        numberCellsFilled = 0;
    }
    return self;
}



-(void) setInitValueGivenString:(NSString *)gridString {
    //parses the input string, given by grid generator, and updates the numberCellsFilled value.
    //sets both the initial board and the game board
    NSAssert([gridString length]==81, @"String is invalid size");
    int cellValue;
    for (int row=0; row<9;row++){
        for (int column=0; column<9; column++){
            if([gridString characterAtIndex:(row*9+column)]=='.'){
                cellValue=0;
            }
            else{
                int value = [self getIntFromChar:[gridString characterAtIndex:(row*9+column)]];
                NSAssert(value>=0&&value<=9, @"Invalid input for grid");
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

-(void) updateGridAtRow:(int)row atColumn:(int)column forValue:(int)value{
    //updates the game board.  If value is erased, decrements numberCellsFilled.
    //otherwise, increments it.
    //alerts if game board is complete after given move.
    NSAssert(row>=0&&row<=8 && column>=0&&column<=8, @"Invalid Index");
    NSAssert(value>=0 && value<=9, @"Invalid number");
    if (board[row][column] == 0 && value != 0)
    {
        ++numberCellsFilled;
    }
    else if (board[row][column] != 0 && value == 0)
    {
        --numberCellsFilled;
    }
    board[row][column]=value;
    if (numberCellsFilled == 81)
    {
        [target performSelector: selector];
    }
}

-(bool) isMutableAtRow:(int)row atColumn:(int)column
{
    //checks if value is initial value
    return (initBoard[row][column]==0);
}

-(bool) isConsistentAtRow:(int)row atColumn:(int)column forValue:(int)value
{
    NSAssert(row>=0&&row<=8 && column>=0&&column<=8, @"Invalid Index");
    NSAssert(value>=0 && value<=9, @"Invalid Index");
    //checks if the update is consistent (ie, the value is not in the row, column, or block)
    if (value == board[row][column] || value==0)
        return true;
    
    return (![self hasValue: value inRow: row] && ![self hasValue: value inColumn: column] && ![self hasValue: value inBlock:[self blockNumAtRow: row atColumn: column]]);
}

-(bool) hasValue: (int) value inRow: (int) row
{
    //checks if the value is already in the row
    for (int column = 0; column<9; column++) {
        if (board[row][column]==value)
            return true;
    }
    return false;
}

-(bool) hasValue: (int) value inColumn: (int) column
{
    //checks if value is already in column
    for (int row = 0; row<9; row++) {
        if (board[row][column]==value)
            return true;
    }
    return false;
}


-(int) blockNumAtRow: (int) row atColumn: (int) column
{
    //returns block number
    return (row/3)*3 + (column/3);
}

-(bool) hasValue: (int) value inBlock:(int) block
{
    //checks if value is already in block
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
