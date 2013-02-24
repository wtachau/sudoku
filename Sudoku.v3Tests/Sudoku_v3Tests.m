//
//  Sudoku_v3Tests.m
//  Sudoku.v3Tests
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import "Sudoku_v3Tests.h"

@implementation Sudoku_v3Tests

- (void)setUp
{
    [super setUp];
    
    theNumPad = [[NumPad alloc] init];
    theGrid = [[GridView alloc] init];
    theGridGenerator = [[GridGeneratorFromFile alloc] init];
    theGridModel = [[GridModel alloc] init];
    theTimer= [[Timer alloc] init];
    COLORS = [[COLOR_CONSTANTS alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void) testInitSetUp {
    //Makes sure everything initializes
    STAssertNotNil(theNumPad, @"NumPad Failed to Initialize");
    STAssertNotNil(theGridModel, @"GridModel Failed to Initialize");
    STAssertNotNil(theGridGenerator, @"GridGenerator Failed to Initialize");
    STAssertNotNil(theGrid, @"GridView Failed to Initialize");
    STAssertNotNil(theTimer, @"Timer Failed to Initialize");
}

-(void) testGridGeneratorLength
{
    //Makes sure random grid isn't too long/short
    NSString* testString = [theGridGenerator getEasyGrid];
    NSString* testString2 = [theGridGenerator getMediumGrid];
    NSString* testString3 = [theGridGenerator getHardGrid];
    NSUInteger length = 81;
    STAssertEquals(testString.length, length, @"Easy GridGenerator has too many or too few numbers");
    STAssertEquals(testString2.length, length, @"Medium GridGenerator has too many or too few numbers");
    STAssertEquals(testString3.length, length, @"Hard GridGenerator has too many or too few numbers");
}

-(void) testGridGeneratorContent
{
    //tests whether grid has invalid characters such as /n or /r or " "
    NSString* testString = [theGridGenerator getEasyGrid];
    NSString* secondString = [[NSString alloc] init];
    secondString = [testString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    secondString = [testString stringByReplacingOccurrencesOfString:@" " withString:@""];
    secondString = [testString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    STAssertEquals(testString,secondString, @"GridGenerator string contains invalid characters.");
    
}

-(void) testStringTooShort{
    //Tests with too-short input string
    NSString* tooShort = @".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44";
    STAssertThrows([theGridModel setInitValueGivenString:tooShort], @"Invalid String: too short");
}

-(void) testStringTooLong{
    //tests with too-long input string
    NSString* tooLong = @".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44";
    STAssertThrows([theGridModel setInitValueGivenString:tooLong], @"Invalid String: too long");
}

-(void) testStringInvalidCharacters{
    //tests with input string consisting of letters,
    //rather than just digits and periods
    NSString* invalid = @".abcde.8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23.";
    STAssertThrows([theGridModel setInitValueGivenString:invalid], @"Invalid String: not ints");
}

-(void) testisConsistentNo{
    //makes sure "false" is returned when value is
    //inconsistent at the given row/column
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool consistent = [theGridModel isConsistentAtRow:0 atColumn:2 forValue:4];
    STAssertTrue((!consistent), @"Inconsistency returned consistent");
}

-(void) testisConsistentYes{
    //makes sure "true" is returned when value is
    //consistent at the given row/column
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool consistent = [theGridModel isConsistentAtRow:0 atColumn:2 forValue:5];
    STAssertTrue(consistent, @"Inconsistency returned consistent");
}

-(void) testisConsistentInvalid
{
    //tests negative or too-big values as input for the
    //isConsistent funciton
    STAssertThrows([theGridModel isConsistentAtRow:0 atColumn:0 forValue:10] , @"GridModel is checking a value that is greater than 9");
    STAssertThrows([theGridModel isConsistentAtRow:0 atColumn:0 forValue:-5] , @"GridModel is checking a negative value");
}
-(void) testisMutableNo{
    //test isMutable for not mutable input
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool mutable = [theGridModel isMutableAtRow:0 atColumn:1];
    STAssertTrue((!mutable), @"Immutable Value Called mutable");
}
-(void) testisMutableYes{
    //tests isMutable for mutable input
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool mutable = [theGridModel isMutableAtRow:0 atColumn:2];
    STAssertTrue((mutable), @"Mutable Value Called Immutable");
}

-(void) testInvalidRowNums{
    //tries invalid index
    STAssertThrows([theGridModel updateGridAtRow:8 atColumn:20 forValue:7], @"Invalid Row and Columnm for Grid Model");
}

-(void) testBlockNumber{
    //makes sure block number is correctly defined
    STAssertEquals([theGridModel blockNumAtRow:0 atColumn:0], 0, @"Wrong Block Number");
}
-(void) testValidValueForGridView{
    //tests invalid input for grid class
    STAssertThrows([theGrid setValueAtRow:0 atColumn:0 forValue:10 withColor:COLORS.CELLS_DEFAULT_NUMBERS], @"Invalid value");
}
-(void) testValidValueForGridModel{
    //tests invalid input for grid model class
    STAssertThrows([theGridModel updateGridAtRow:0 atColumn:0 forValue:10], @"Invalid value");
}
-(void) testFileNo{
    //makes sure it DOESN'T find file that doesn't exist
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grids10" ofType: @"txt"];
    STAssertNil(path, @"Found file that doesn't exist");
}
-(void) testFilesYes{
    //makes sure it finds file that is read from for
    //the grid generator 
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grids1" ofType: @"txt"];
    STAssertNotNil(path, @"Can't find valid file");
}
-(void) testCurrentValue{
    //makes sure numPad initializes with the current value as 1
    STAssertEquals([theNumPad currentValue], 1, @"NumPad Current Value Failed to Initialize");
}
-(void) testInitialGridIsValid{
    //makes sure there are at most 9 of any number in the initial grid
    [theGridModel setInitValueGivenString:([theGridGenerator getMediumGrid])];
    int testArray[10];
    for (int m=0; m<10;m++){
        testArray[m] = 0;
    }
    for (int row=0; row <9; row++){
        for (int column=0; column<9;column++){
            int testValue = [theGridModel getValueAtRow:row atColumn:column];
            testArray[testValue]++;
        }
    }
    for (int k=1; k<10; k++){
        STAssertFalse(testArray[k] > 9, @"Too many of value %d in grid model cells", k);
    }
    
}
                    


@end
