//
//  COLOR_CONSTANTS.h
//  Sudoku.v3
//
//  Created by jarthur on 2/16/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COLOR_CONSTANTS : NSObject {

    UIColor* CELLS_DEFAULT_BACKGROUND;
    UIColor* BORDER;
    UIColor* CELLS_DEFAULT_NUMBERS;
    UIColor* CELLS_HIGHLIGHT_NUMBERS;
    UIColor* SCREEN_BACKGROUND;
    UIColor* CELLS_HIGHLIGHT_BACKGROUND;
    UIColor* CELLS_ENTERED_NUMBERS;
    UIColor* OPTIONS_BUTTONS_BACKGROUND;
    UIColor* OPTIONS_BUTTONS_TEXT;
}

@property (readonly) UIColor* CELLS_DEFAULT_BACKGROUND;
@property (readonly) UIColor* BORDER;
@property (readonly) UIColor* CELLS_DEFAULT_NUMBERS;
@property (readonly) UIColor* CELLS_HIGHLIGHT_NUMBERS;
@property (readonly) UIColor* SCREEN_BACKGROUND;
@property (readonly) UIColor* CELLS_HIGHLIGHT_BACKGROUND;
@property (readonly) UIColor* CELLS_ENTERED_NUMBERS;
@property (readonly) UIColor* OPTIONS_BUTTONS_BACKGROUND;
@property (readonly) UIColor* OPTIONS_BUTTONS_TEXT;


@end
