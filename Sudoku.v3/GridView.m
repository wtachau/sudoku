//
//  GridView.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "COLOR_CONSTANTS.h"
#import "GridView.h"
#import "GridModel.h"
#import "NumPad.h"

@implementation GridView
@synthesize currentRow, currentColumn;

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        COLORS = [[COLOR_CONSTANTS alloc] init];
        
        self.backgroundColor = COLORS.BORDER;
        
        //making the size of the buttons and lines
        //bigLines correspond to the thicker lines that separate blocks;
        //smallLines are the normal-sized lines between all buttons.
        int smallLines = 5;
        int bigLines = 10;
        int originX=bigLines;
        int originY=bigLines;
        int size = (self.bounds.size.width-(4*bigLines+6*smallLines)) *(1/9.0);
        
        //creating the buttons and labels, with the buttonPressed function enabled, and putting them in the array
        buttonArray = [[NSMutableArray alloc] initWithCapacity:9];
        
        
        for (int row=0; row<9; row++)
        {
            [buttonArray addObject: [[NSMutableArray alloc] initWithCapacity:9]];
            for (int column=0; column<9; column++)
            {
                UIButton* theButton = [[UIButton alloc] initWithFrame:CGRectMake(originX, originY, size, size)];
                
                [theButton setTitleColor:COLORS.CELLS_DEFAULT_NUMBERS forState: UIControlStateNormal];
                [theButton setTitleColor:COLORS.CELLS_HIGHLIGHT_NUMBERS forState: UIControlStateHighlighted];
                [theButton.titleLabel setFont:[UIFont systemFontOfSize:30]];
                [theButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                theButton.showsTouchWhenHighlighted = YES;
                theButton.tag = row*10 + column;
                theButton.backgroundColor = COLORS.CELLS_DEFAULT_BACKGROUND;
                
                theButton.exclusiveTouch = YES;
                
                [[buttonArray objectAtIndex:row] addObject: theButton];
                [self addSubview:theButton];
                
                if(column%3==2){
                    originX +=bigLines+size;
                }
                else{
                    originX +=smallLines+size;
                }
                
            }
            originX=bigLines;
            if(row%3==2){
                originY+=bigLines+size;
            }
            else{
                originY+=smallLines+size;
            }
            
        }

    }
    return self;
}

-(void) buttonPressed: (id) sender{
    //when a button is pressed, the row and column are updated
    UIButton* theButton = sender;
    currentRow=theButton.tag/10;
    currentColumn=theButton.tag%10;
    [target performSelector: selector];
}

-(void) setTarget:(id) sender atAction:(SEL)action
{
    target=sender;
    selector = action;
}

-(void) setValueAtRow: (int) row atColumn: (int) column forValue: (int) value withColor: (UIColor*) color {
    //setting values of the buttons (happens during initialization and when value is changed)
    NSAssert(value>=0 && value<=9, @"Invalid number");
    UIButton* button = [[buttonArray objectAtIndex:row ] objectAtIndex:column];
    if (value>0){
        [button setTitle:[[NSString alloc] initWithFormat:@"%d",value] forState:UIControlStateNormal];
    }
    else{
        [button setTitle:[[NSString alloc] initWithFormat:@" "] forState:UIControlStateNormal];
    }
    [button setTitleColor:color forState:UIControlStateNormal];
    
}

-(void) highlightAtRow: (int) row AtColumn: (int) column WithColor: (UIColor*) color{
    //highlights the button specified (happens when numPad button is selected)
    UIButton* button = [[buttonArray objectAtIndex:row ] objectAtIndex:column];
    [button setBackgroundColor:color];
}

@end

