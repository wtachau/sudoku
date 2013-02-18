//
//  ViewController.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
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
    
    [self createNewGame];
    
    
}

-(void) createGridModel
{
    //create the Grid Model and Grid Generator
    theGridModel =[[GridModel alloc] init];
    [theGridModel setTarget: self atAction: @selector(gameIsWon)];
    
    theGridGenerator = [[GridGeneratorFromFile alloc] init];
    [theGridModel setInitValueGivenString:[theGridGenerator getGrid]];
}

-(void) createGridView
{
    //create the frame for grid
    CGRect gridFrame = CGRectMake(GRID_ORIGIN_X, GRID_ORIGIN_Y, GRID_SIZE, GRID_SIZE);
    
    //create the grid
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
    
    //create the number pad grid
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


// TODO: Call control buttons new game button?  because an options menu would do different things?
-(void) createControlButtons
{
    //Create ControlButtons
    CGRect controlButtonFrame = CGRectMake(GRID_ORIGIN_X + GRID_SIZE - GRID_SIZE/3.3, GRID_ORIGIN_Y-SCREEN_HEIGHT*.115, GRID_SIZE/3.3,  GRID_SIZE/10.0);
    theControlButtons =[[ControlButtons alloc] initWithFrame: controlButtonFrame];
    [self.view addSubview:theControlButtons];
    [theControlButtons setTarget: self atAction: @selector(controlButtonPressed)];
}

-(void) buttonPressed
{
    int row = theGrid.currentRow;
    int column = theGrid.currentColumn;
    int value = theNumPad.currentValue;
    if ([theGridModel isMutableAtRow:row atColumn:column]){
        if([theGridModel isConsistentAtRow:row atColumn:column forNumber:value]){
            [theGrid setValueAtRow:row atColumn:column forValue:value withColor:COLORS.CELLS_ENTERED_NUMBERS];
            [theGridModel updateGridAtRow:row atColumn:column forNumber:value];
            if (value>0){
                [theGrid highlightAtRow: row AtColumn: column WithColor:COLORS.CELLS_HIGHLIGHT_BACKGROUND];
            }
        }
    }
}

-(void) numPadButtonPressed
{
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

-(void) createNewGame
{
    [self createGridModel];
    [self createNumPad];
    [self createGridView];
    [self createTimer];
    [self createControlButtons];
}

-(void) gameIsWon
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS, YOU'VE WON!"
                                                    message:@"Play Again?"
                                                   delegate:self
                                          cancelButtonTitle:@"Yes!"
                                          otherButtonTitles:@"No, thanks.", nil];
    [alert show];
    
}

-(void) controlButtonPressed
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
                                                    message:@"Your current game will not be saved."
                                                   delegate:self
                                          cancelButtonTitle:@"New Game!"
                                          otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        NSLog(@"Pressed YES");
        //replace appname with any specific name you want
        [self createNewGame];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
