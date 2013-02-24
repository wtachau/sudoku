//
//  GridGenerator.m
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau, Priya Donti, Carson Ramsden.
//  All rights reserved.
//

#import "GridGenerator.h"

@implementation GridGenerator
//returns easy, medium, or hard grid.

-(NSString*) getEasyGrid {
    return easyGrid;
}

-(NSString*) getMediumGrid {
    return mediumGrid;
}

-(NSString*) getHardGrid {
    return hardGrid;
}

@end
