//
//  GridView.h
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridView : UIView{
    NSMutableArray* buttonArray;
    id target;
    SEL selector;
}

@property int currentRow;
@property int currentColumn;

-(void) buttonPressed: (id) sender;
-(void) setValueAtRow: (int) row atColumn: (int) column forValue: (int) value withColor: (UIColor*) color;
-(void) setTarget: (id) target atAction: (SEL) action;
@end