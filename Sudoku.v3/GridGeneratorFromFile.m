//
//  GridGeneratorFromFile.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "GridGeneratorFromFile.h"

@implementation GridGeneratorFromFile

-(id) init {
    
    //This reads in the file and saves text as an NSString
    NSString* Path = [[NSBundle mainBundle] pathForResource:@"grids1" ofType: @"txt"];
    NSError* error;
    NSString* readString = [[NSString alloc] initWithContentsOfFile:Path encoding:NSUTF8StringEncoding error:&error];
    
    //this gets all the lines
    lines = [readString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

    return self;
    
}

-(NSString*) getEasyGrid{
    //easy grids are in the first third of the file; this method chooses a
    //random grid from this section
    
    int gridLine = arc4random() % ([lines count]/3);
    easyGrid = [lines objectAtIndex:gridLine];
    return easyGrid;
    
}
-(NSString*) getMediumGrid{
    //medium grids are in the second third of the file; this method chooses a
    //random grid from this section
    int gridLine = (arc4random() % ([lines count]/3))+([lines count]/3)-1;
    mediumGrid = [lines objectAtIndex:gridLine];
    
    return mediumGrid;
}
-(NSString*) getHardGrid{
    //hard grids are in the last third of the file; this method chooses a
    //random grid from this section
    
    int gridLine = (arc4random() % ([lines count]/3))+(2*[lines count]/3)-1;
    hardGrid = [lines objectAtIndex:gridLine];
    return hardGrid;
}

@end

/*
 //
 //  GridGeneratorFromFile.m
 //  Sudoku.v3
 //
 //  Created by Jessica Schroeder on 2/10/13.
 //  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
 //
 
 #import "GridGeneratorFromFile.h"
 
 @implementation GridGeneratorFromFile
 
 -(id) init {
 //nothing is initialized because we don't know which file
 //we want to read from yet.  We therefore simply return self.
  return self;
 
 }
 
 -(NSString*) getEasyGrid{
 //This reads in the file and saves text as an NSString
 NSString* easyPath = [[NSBundle mainBundle] pathForResource:@"easyGrids" ofType: @"txt"];
 NSError* error;
 NSString* readEasyString = [[NSString alloc] initWithContentsOfFile:easyPath encoding:NSUTF8StringEncoding error:&error];
 
 //An NSArray composed of each line in the text 
 NSArray *easyLines = [readEasyString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
 
 //Return a random line from the text
 int gridLine = arc4random() % [easyLines count];
 easyGrid = [easyLines objectAtIndex:gridLine];
 return easyGrid;
 
 }
 -(NSString*) getMediumGrid{
 //This reads in the file and saves text as an NSString
 NSString* mediumPath = [[NSBundle mainBundle] pathForResource:@"mediumGrids" ofType: @"txt"];
 NSError* error;
 NSString* readMediumString = [[NSString alloc] initWithContentsOfFile:mediumPath encoding:NSUTF8StringEncoding error:&error];
 
 
 
 //An NSArray composed of each line in the text
 NSArray *mediumLines = [readMediumString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
 
 //Return a random line from the text
 int gridLine = arc4random() % [mediumLines count];
 mediumGrid = [mediumLines objectAtIndex:gridLine];
 return mediumGrid;
 }
 
 -(NSString*) getHardGrid{
 //This reads in the file and saves text as an NSString
 NSError* error;
 NSString* hardPath = [[NSBundle mainBundle] pathForResource:@"hardGrids" ofType: @"txt"];
 NSString* readHardString = [[NSString alloc] initWithContentsOfFile:hardPath encoding:NSUTF8StringEncoding error:&error];
 
  //An NSArray composed of each line in the text
 NSArray *hardLines = [readHardString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
 
  //Return a random line from the text
 int gridLine = arc4random() % [hardLines count];
 hardGrid = [hardLines objectAtIndex:gridLine];
 return hardGrid;
 }
 
 @end
 
*/

