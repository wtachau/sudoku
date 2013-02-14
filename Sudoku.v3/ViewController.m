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
	
    self.view.backgroundColor = [UIColor whiteColor];
    
    //create the Grid Model and Grid Generator
    theGridModel =[[GridModel alloc] init];
    theGridGenerator = [[GridGeneratorFromFile alloc] init];
    [theGridModel setInitValueGivenString:[theGridGenerator getGrid]];
    
    
    //create the frame for number pad
    int numPadX = self.view.bounds.size.width *.10;
    int numPadY = self.view.bounds.size.height *.8;
    int numPadWidth = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.8;
    int numPadHeight = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.1;
    CGRect numPadFrame = CGRectMake(numPadX, numPadY, numPadWidth, numPadHeight);
    
    //create the number pad grid
    theNumPad  = [[NumPad alloc] initWithFrame:numPadFrame];
    [self.view addSubview: theNumPad];
    
    //create the frame for grid
    int originX = self.view.bounds.size.width *.10;
    int originY = self.view.bounds.size.height *.10;
    int size = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.8;
    CGRect gridFrame = CGRectMake(originX, originY, size, size);

    //create the grid
    theGrid = [[GridView alloc] initWithFrame:gridFrame];
    [self.view addSubview: theGrid];
    [theGrid setTarget: self atAction: @selector(buttonPressed)];
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++){
            int value = [theGridModel getValueAtRow:row atColumn:column];
            if (value>0)
                [theGrid setValueAtRow: row atColumn: column forValue: value withColor: [UIColor blackColor]];
        }
    }
}

-(void) buttonPressed
{
    int row = theGrid.currentRow;
    int column = theGrid.currentColumn;
    int value = theNumPad.currentValue;
    if ([theGridModel isMutableAtRow:row atColumn:column]){
        if([theGridModel isConsistentAtRow:row atColumn:column forNumber:value]){
            [theGrid setValueAtRow:row atColumn:column forValue:value withColor:[UIColor blueColor]];
            [theGridModel updateGridAtRow:row atColumn:column forNumber:value];
        }
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
