//
//  ViewController.h
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GridView.h"
#import "NumPad.h"
#import "GridModel.h"
#import "GridGeneratorFromFile.h"
#import "Timer.h"
#import "ControlButtons.h"

@interface ViewController : UIViewController{
    
    GridView* theGrid;
    NumPad* theNumPad;
    GridModel* theGridModel;
    GridGenerator* theGridGenerator;
    Timer* theTimer;
    ControlButtons* theControlButtons;
    COLOR_CONSTANTS* COLORS;
    int SCREEN_WIDTH;
    int SCREEN_HEIGHT;
    int GRID_ORIGIN_X;
    int GRID_ORIGIN_Y;
    int GRID_SIZE;
    
}

-(void) buttonPressed;
-(void) numPadButtonPressed;
-(void) gameIsWon;
-(void) createEasyGridModel;
-(void) createMediumGridModel;
-(void) createHardGridModel;
-(void) createGridView;
-(void) createNumPad;
-(void) createTimer;
-(void) createNewGameButton;

@end