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
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grids1" ofType: @"txt"];
    NSError* error;
    NSString* readString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    //An NSArray composed of each line in the text
    NSArray *lines = [readString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    //Return a random line from the text
    int gridLine = arc4random() % [lines count];
    theGrid = [lines objectAtIndex:gridLine];
    
    return self;
}

@end

