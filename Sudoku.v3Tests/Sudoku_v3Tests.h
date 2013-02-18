//
//  Sudoku_v3Tests.h
//  Sudoku.v3Tests
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GridView.h"
#import "NumPad.h"
#import "GridModel.h"
#import "GridGeneratorFromFile.h"
#import "COLOR_CONSTANTS.h"

@interface Sudoku_v3Tests : SenTestCase{
    GridView* theGrid;
    NumPad* theNumPad;
    GridModel* theGridModel;
    GridGenerator* theGridGenerator;
    COLOR_CONSTANTS* COLORS;
}
-(void) testInitSetUp;
-(void) testStringTooLong;
-(void) testStringTooShort;
-(void) testStringInvalidCharacters;
-(void) testisConsistentNo;
-(void) testisConsistentYes;
-(void) testisMutableYes;
-(void) testisMutableNo;
-(void) testInvalidRowNums;
-(void) testBlockNumber;
-(void) testValidValueForGridModel;
-(void) testValidValueForGridView;
-(void) testFileNo;
-(void) testFileYes;
-(void) testCurrentValue;

@end
