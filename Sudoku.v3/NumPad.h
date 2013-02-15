//
//  NumPad.h
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumPad : UIView{
    NSMutableArray* numberPad;
    id target;
    SEL selector;
}
@property int currentValue;
-(void) numPadButtonPressed: (id) sender;
-(void) setTarget: (id) target atAction: (SEL) action;

@end
