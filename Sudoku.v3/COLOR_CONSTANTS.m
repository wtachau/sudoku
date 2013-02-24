//
//  COLOR_CONSTANTS.m
//  Sudoku.v3
//
//  Created by jarthur on 2/16/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "COLOR_CONSTANTS.h"

@implementation COLOR_CONSTANTS

@synthesize CELLS_DEFAULT_BACKGROUND;
@synthesize BORDER;
@synthesize CELLS_DEFAULT_NUMBERS;
@synthesize CELLS_HIGHLIGHT_NUMBERS;
@synthesize SCREEN_BACKGROUND;
@synthesize CELLS_HIGHLIGHT_BACKGROUND;
@synthesize CELLS_ENTERED_NUMBERS;
@synthesize OPTIONS_BUTTONS_BACKGROUND;
@synthesize OPTIONS_BUTTONS_TEXT;

-(id) init
{
    //defines color scheme of the board.
    self = [super init];
    if (self){
        
        CELLS_DEFAULT_BACKGROUND = [UIColor colorWithRed:(244.0/255) green:(220.0/255) blue:(181.0/255) alpha:1];
        BORDER = [UIColor colorWithRed:(54.0/255) green:(54.0/255) blue:(54.0/255) alpha:1];
        CELLS_DEFAULT_NUMBERS = [UIColor colorWithRed:(54.0/255) green:(54.0/255) blue:(54.0/255) alpha:1];
        CELLS_HIGHLIGHT_NUMBERS = [UIColor redColor];
        SCREEN_BACKGROUND = [UIColor colorWithRed:(0.0/255) green:(104.0/255) blue:(139.0/255) alpha:1];
        CELLS_HIGHLIGHT_BACKGROUND = [UIColor colorWithRed:(78.0/255) green:(238.0/255) blue:(148.0/255) alpha:1];
        CELLS_ENTERED_NUMBERS = [UIColor colorWithRed:(208.0/255) green:(32.0/255) blue:(144.0/255) alpha:1];
        OPTIONS_BUTTONS_BACKGROUND = [UIColor colorWithRed:(240.0/255) green:(255.0/255.0) blue:(255.0/255) alpha:1];
        OPTIONS_BUTTONS_TEXT = [UIColor colorWithRed:(208.0/255) green:(32.0/255) blue:(144.0/255) alpha:1];
        
    }
    
    return self;
}
    


@end
