//
//  NumPad.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//


//BUG #1! If you select a number (or erase) in the numPad, and then UNSELECT it, you can't select it again until you
// click another button in the numPad

//BUG #2! If you have "click" selected, and then click a cell, it will make it orange

#import "NumPad.h"

@implementation NumPad
@synthesize currentValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor blackColor];
        int size = (self.bounds.size.width-(20+5*8)) *(1/10.0);
        int originX=10;
        int originY=(self.bounds.size.height-size)/2;
        numberPad = [[NSMutableArray alloc] init];
        currentValue = 1;
        
        for(int i = 0; i<10; i++){
            
            [numberPad addObject:[[UIButton alloc] initWithFrame:CGRectMake(originX, originY, size, size)]];
            
            [((UIButton*)[numberPad objectAtIndex:i]) addTarget:self action:@selector(numPadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [((UIButton*)[numberPad objectAtIndex:i]) setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            
            //tag of 0 means initial, 1 means not
            if (i==0){
                [((UIButton*)[numberPad objectAtIndex:i]) setTitle:[NSString stringWithFormat:@"%d", (i+1)] forState:UIControlStateNormal];
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor whiteColor];
                [((UIButton*)[numberPad objectAtIndex:i]) setTag:(i+1)];
            }
            else if(i==9){
                [((UIButton*)[numberPad objectAtIndex:i]) setTitle:[NSString stringWithFormat:@"Erase"] forState:UIControlStateNormal];
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor lightGrayColor];
                [((UIButton*)[numberPad objectAtIndex:i]) setTag:0];
            }
            else{
                [((UIButton*)[numberPad objectAtIndex:i]) setTitle:[NSString stringWithFormat:@"%d", (i+1)] forState:UIControlStateNormal];
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor lightGrayColor];
                [((UIButton*)[numberPad objectAtIndex:i]) setTag:(i+1)];
            }
            [self addSubview:(UIButton*)[numberPad objectAtIndex:i]];
            
            
            originX+=5+size;
        }
        
        
    }
    return self;
}

-(void) numPadButtonPressed: (id) sender{
    [sender setBackgroundColor:[UIColor whiteColor]];
    UIButton* theButton;
    if (currentValue==0){
        theButton = [numberPad objectAtIndex: (9)];
    }
    else{
      theButton = [numberPad objectAtIndex: (currentValue-1)];
    }
    if (currentValue != ((UIButton*) sender).tag){
       [theButton setBackgroundColor: [UIColor lightGrayColor]];
    }
    currentValue= ((UIButton*) sender).tag;
    [target performSelector: selector];
           
}

-(void) setTarget:(id) sender atAction:(SEL)action
{
    target=sender;
    selector = action;
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
