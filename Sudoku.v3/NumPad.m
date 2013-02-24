//
//  NumPad.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import "NumPad.h"

@implementation NumPad
@synthesize currentValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        COLORS = [[COLOR_CONSTANTS alloc] init];
        
        self.backgroundColor=COLORS.BORDER;
        
        int size = (self.bounds.size.width-(20+5*8)) *(1/10.0);
        int originX=10;
        int originY=(self.bounds.size.height-size)/2;
        numberPad = [[NSMutableArray alloc] init];
        currentValue = 1;
        
        for(int i = 0; i<10; i++){
            
            [numberPad addObject:[[UIButton alloc] initWithFrame:CGRectMake(originX, originY, size, size)]];
            
            UIButton* currentButton = [numberPad objectAtIndex:i];
            
            [currentButton addTarget:self action:@selector(numPadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            [currentButton setTitleColor:COLORS.OPTIONS_BUTTONS_TEXT forState:UIControlStateNormal];
            
            currentButton.exclusiveTouch = YES;
            
            //the number 1 is initially highlit
            //the tag corresponds to the number the button displays (except for the erase button)
            if (i==0){
                [currentButton setTitle:[NSString stringWithFormat:@"%d", (i+1)] forState:UIControlStateNormal];
                [currentButton.titleLabel setFont:[UIFont systemFontOfSize:30]];
                currentButton.backgroundColor=COLORS.CELLS_HIGHLIGHT_BACKGROUND;
                [currentButton setTag:(i+1)];
            }
            else if(i==9){
                [currentButton setTitle:[NSString stringWithFormat:@"Erase"] forState:UIControlStateNormal];
                currentButton.backgroundColor=COLORS.OPTIONS_BUTTONS_BACKGROUND;
                [currentButton setTag:0];
            }
            else{
                [currentButton setTitle:[NSString stringWithFormat:@"%d", (i+1)] forState:UIControlStateNormal];
                [currentButton.titleLabel setFont:[UIFont systemFontOfSize:30]];
                currentButton.backgroundColor=COLORS.OPTIONS_BUTTONS_BACKGROUND;
                [currentButton setTag:(i+1)];
            }
            [self addSubview:currentButton];
            
            
            originX+=5+size;
        }
        
        
    }
    return self;
}

-(void) numPadButtonPressed: (id) sender{
    //highlights new number that was selected, de-highlights previous one,
    //and updates current value

    [sender setBackgroundColor:COLORS.CELLS_HIGHLIGHT_BACKGROUND];
    UIButton* theButton;
    if (currentValue==0){
        theButton = [numberPad objectAtIndex: (9)];
    }
    else{
      theButton = [numberPad objectAtIndex: (currentValue-1)];
    }
    if (currentValue != ((UIButton*) sender).tag){
       [theButton setBackgroundColor: COLORS.OPTIONS_BUTTONS_BACKGROUND];
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
