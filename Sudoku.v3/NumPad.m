//
//  NumPad.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "NumPad.h"

@implementation NumPad
@synthesize currentValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor blackColor];
        int size = (self.bounds.size.width-(20+5*8)) *(1/9.0);
        int originX=10;
        int originY=(self.bounds.size.height-size)/2;
        numberPad = [[NSMutableArray alloc] init];
        for(int i = 0; i<9; i++){
            
            [numberPad addObject:[[UIButton alloc] initWithFrame:CGRectMake(originX, originY, size, size)]];
            
            [((UIButton*)[numberPad objectAtIndex:i]) addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [((UIButton*)[numberPad objectAtIndex:i]) setTitle:[NSString stringWithFormat:@"%d", (i+1)] forState:UIControlStateNormal];
            [((UIButton*)[numberPad objectAtIndex:i]) setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [((UIButton*)[numberPad objectAtIndex:i]) setTag:i+1];
            
            //tag of 0 means initial, 1 means not
            if (i==0){
                
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor whiteColor];
            }
            else{
                
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor lightGrayColor];
            }
            [self addSubview:(UIButton*)[numberPad objectAtIndex:i]];
            
            
            originX+=5+size;
            currentValue = 1;
        }
        
        
    }
    return self;
}

-(void) buttonPressed: (id) sender{
    [sender setBackgroundColor:[UIColor whiteColor]];
    UIButton* theButton = [numberPad objectAtIndex: currentValue-1];
    [theButton setBackgroundColor: [UIColor lightGrayColor]];
    
    currentValue= ((UIButton*) sender).tag;
}

-(NSString*) getValue{
    for (int i=0;i<9;i++){
        if (((UIButton*)[numberPad objectAtIndex:i]).tag==1){
            return [NSString stringWithFormat:@"%d", (i+1)];
        }
    }
    return @"";
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
