//
//  ViewController.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    COLORS = [[COLOR_CONSTANTS alloc] init];
    
    SCREEN_WIDTH = self.view.bounds.size.width;
    SCREEN_HEIGHT = self.view.bounds.size.height;
    GRID_ORIGIN_X = SCREEN_WIDTH *.10;
    GRID_ORIGIN_Y = SCREEN_HEIGHT *.15;
    GRID_SIZE = MIN(SCREEN_WIDTH, SCREEN_HEIGHT) *.8;
	
    self.view.backgroundColor = COLORS.SCREEN_BACKGROUND;
    
    //We have a medium grid load on default.
    NSString* defaultDifficulty = [[NSString alloc]initWithFormat: @"medium"];
    
    [self createNewGameWithDifficulty:defaultDifficulty];
    
    
}
-(void) createEasyGridModel
{
    //create the Grid Model and Grid Generator, using an easy grid
    theGridModel =[[GridModel alloc] init];
    [theGridModel setTarget: self atAction: @selector(gameIsWon)];
    
    theGridGenerator = [[GridGeneratorFromFile alloc] init];
    [theGridModel setInitValueGivenString:[theGridGenerator getEasyGrid]];
}

-(void) createMediumGridModel
{
    //create the Grid Model and Grid Generator, using a medium grid
    theGridModel =[[GridModel alloc] init];
    [theGridModel setTarget: self atAction: @selector(gameIsWon)];
    
    theGridGenerator = [[GridGeneratorFromFile alloc] init];
    [theGridModel setInitValueGivenString:[theGridGenerator getMediumGrid]];
}

-(void) createHardGridModel
{
    //create the Grid Model and Grid Generator, using a hard grid
    theGridModel =[[GridModel alloc] init];
    [theGridModel setTarget: self atAction: @selector(gameIsWon)];
    
    theGridGenerator = [[GridGeneratorFromFile alloc] init];
    [theGridModel setInitValueGivenString:[theGridGenerator getHardGrid]];
}

-(void) createGridView
{
    //create the frame for grid
    CGRect gridFrame = CGRectMake(GRID_ORIGIN_X, GRID_ORIGIN_Y, GRID_SIZE, GRID_SIZE);
    
    //create the grid itself
    theGrid = [[GridView alloc] initWithFrame:gridFrame];
    [self.view addSubview: theGrid];
    [theGrid setTarget: self atAction: @selector(buttonPressed)];
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++){
            int value = [theGridModel getValueAtRow:row atColumn:column];
            if (value==1){
                [theGrid highlightAtRow: row AtColumn: column WithColor:COLORS.CELLS_HIGHLIGHT_BACKGROUND];
            }
            if (value>0)
                [theGrid setValueAtRow: row atColumn: column forValue: value withColor: COLORS.CELLS_DEFAULT_NUMBERS];
        }
    }
}

-(void) createNumPad
{
    //create the frame for number pad
    int numPadX = GRID_ORIGIN_X;
    int numPadY = GRID_ORIGIN_Y + SCREEN_HEIGHT*.675;
    int numPadWidth = GRID_SIZE;
    int numPadHeight = GRID_SIZE/8.0;
    CGRect numPadFrame = CGRectMake(numPadX, numPadY, numPadWidth, numPadHeight);
    
    //create the number pad grid itself
    theNumPad  = [[NumPad alloc] initWithFrame:numPadFrame];
    [theNumPad setTarget: self atAction: @selector(numPadButtonPressed)];
    [self.view addSubview: theNumPad];
}

-(void) createTimer
{
    //Create Timer
    CGRect timerFrame = CGRectMake(GRID_ORIGIN_X, GRID_ORIGIN_Y-SCREEN_HEIGHT*.115,  GRID_SIZE/3.3,  GRID_SIZE/10.0);
    theTimer=[[Timer alloc] initWithFrame: timerFrame];
    [self.view addSubview:theTimer];
}


-(void) createControlButtons
{
    //Create the "new game" button
    CGRect controlButtonFrame = CGRectMake(GRID_ORIGIN_X + GRID_SIZE - GRID_SIZE/3.3, GRID_ORIGIN_Y-SCREEN_HEIGHT*.115, GRID_SIZE/3.3,  GRID_SIZE/10.0);
    theControlButtons =[[ControlButtons alloc] initWithFrame: controlButtonFrame];
    [self.view addSubview:theControlButtons];
    [theControlButtons setTarget: self atAction: @selector(controlButtonPressed)];
}

-(void) buttonPressed
{
    //this method is called if a button on the grid is pressed.
    //If possible within the game parameters, it changes the number
    //on the grid to that currently highlighted in the number pad.
    int row = theGrid.currentRow;
    int column = theGrid.currentColumn;
    int value = theNumPad.currentValue;
    if ([theGridModel isMutableAtRow:row atColumn:column]){
        if([theGridModel isConsistentAtRow:row atColumn:column forValue:value]){
            [theGrid setValueAtRow:row atColumn:column forValue:value withColor:COLORS.CELLS_ENTERED_NUMBERS];
            [theGridModel updateGridAtRow:row atColumn:column forValue:value];
            if (value>0){
                [theGrid highlightAtRow: row AtColumn: column WithColor:COLORS.CELLS_HIGHLIGHT_BACKGROUND];
            }
        }
    }
}

-(void) numPadButtonPressed
{
    //this checks which number in the number pad is pressed, and highlights
    //all instances of that number on the grid.
    int numPadvalue = theNumPad.currentValue;
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++){
            int gridValue = [theGridModel getValueAtRow:row atColumn:column];
            if (numPadvalue==gridValue&&numPadvalue>0){
                [theGrid highlightAtRow: row AtColumn: column WithColor:COLORS.CELLS_HIGHLIGHT_BACKGROUND];
            }
            else{
                [theGrid highlightAtRow: row AtColumn: column WithColor: COLORS.CELLS_DEFAULT_BACKGROUND];
            }
        }
    }
}

-(void) createNewGameWithDifficulty:(NSString*) level
{
    //this creates a new game, creating either an easy, medium, or hard initial grid
    //depending on the inputted string.
    
    if ([level isEqualToString:[[NSString alloc] initWithFormat:@"easy"]]){
        [self createEasyGridModel];
    }
    else if ([level isEqualToString:[[NSString alloc] initWithFormat:@"medium"]]){
        [self createMediumGridModel];
    }
    else{
        [self createHardGridModel];
    }
    [self createNumPad];
    [self createGridView];
    [self createTimer];
    [self createControlButtons];
}

-(void) gameIsWon
{
    //This congratulates the user if he wins the game.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS, YOU'VE WON!"
                                                    message:@"Play Again?"
                                                   delegate:self
                                          cancelButtonTitle:@"Yes!"
                                          otherButtonTitles:@"No, thanks.", nil];
    alert.tag=1;
    [alert show];
    
}

-(void) controlButtonPressed
{
    //if the "new game" button is clicked, it asks if the user is sure
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
                                                    message:@"Your current game will not be saved."
                                                   delegate:self
                                          cancelButtonTitle:@"New Game!"
                                          otherButtonTitles:@"Cancel", nil];
    alert.tag=1;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //if the user was sure he wanted a new game, this asks the user how difficult
    //he wants his new game to be.  It then loads a game of the selected difficulty.
    if (alertView.tag==1){
        if (buttonIndex == [alertView cancelButtonIndex]) {
            UIAlertView *alert = [[UIAlertView alloc] init];
            [alert setTitle:@"Please Select Difficulty:"];
            [alert setDelegate:self];
            [alert addButtonWithTitle:@"Easy"];
            [alert addButtonWithTitle:@"Medium"];
            [alert addButtonWithTitle:@"Hard"];
            alert.tag=2;
            [alert show];
        }
    }
    else{
        if (buttonIndex == 0) {
            [self createNewGameWithDifficulty:([[NSString alloc]initWithFormat: @"easy"])];
        }
        else if (buttonIndex==1){
            [self createNewGameWithDifficulty:([[NSString alloc]initWithFormat: @"medium"])];
        }
        else{
            [self createNewGameWithDifficulty:([[NSString alloc]initWithFormat: @"hard"])];
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
