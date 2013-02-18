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
    COLORS = [[COLOR_CONSTANTS alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void) testInitSetUp {
    STAssertNotNil(theNumPad, @"NumPad Failed to Initialize");
    STAssertNotNil(theGridModel, @"GridModel Failed to Initialize");
    STAssertNotNil(theGridGenerator, @"GridGenerator Failed to Initialize");
    STAssertNotNil(theGrid, @"GridView Failed to Initialize");
}

-(void) testStringTooShort{
    NSString* tooShort = @".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44";
    STAssertThrows([theGridModel setInitValueGivenString:tooShort], @"Invalid String: too short");
}
-(void) testStringTooLong{
    NSString* tooLong = @".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44";
    STAssertThrows([theGridModel setInitValueGivenString:tooLong], @"Invalid String: too long");
}
-(void) testStringInvalidCharacters{
    NSString* invalid = @".abcde.8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23.";
    STAssertThrows([theGridModel setInitValueGivenString:invalid], @"Invalid String: not ints");
}
-(void) testisConsistentNo{
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool consistent = [theGridModel isConsistentAtRow:0 atColumn:2 forNumber:4];
    STAssertTrue((!consistent), @"Inconsistency returned consistent");
}
-(void) testisConsistentYes{
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool consistent = [theGridModel isConsistentAtRow:0 atColumn:2 forNumber:5];
    STAssertTrue(consistent, @"Inconsistency returned consistent");
}
-(void) testisMutableNo{
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool mutable = [theGridModel isMutableAtRow:0 atColumn:1];
    STAssertTrue((!mutable), @"Immutable Value Called mutable");
}
-(void) testisMutableYes{
    [theGridModel setInitValueGivenString:@".4..9..8.8.....4..6.2...91526......1.......933.41.9.2.12.9....7..3..81.44.....23."];
    bool mutable = [theGridModel isMutableAtRow:0 atColumn:2];
    STAssertTrue((mutable), @"Mutable Value Called Immutable");
}

-(void) testInvalidRowNums{
    STAssertThrows([theGridModel updateGridAtRow:8 atColumn:20 forNumber:7], @"Invalid Row and Columnm for Grid Model");
}

-(void) testBlockNumber{
    STAssertEquals([theGridModel blockNumAtRow:0 atColumn:0], 0, @"Wrong Block Number");
}
-(void) testValidValueForGridView{
    STAssertThrows([theGrid setValueAtRow:0 atColumn:0 forValue:10 withColor:COLORS.CELLS_DEFAULT_NUMBERS], @"Invalid value");
}
-(void) testValidValueForGridModel{
    STAssertThrows([theGridModel updateGridAtRow:0 atColumn:0 forNumber:10], @"Invalid value");
}
-(void) testFileNo{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grids10" ofType: @"txt"];
    STAssertNil(path, @"Found file that doesn't exist");
}
-(void) testFileYes{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grids1" ofType: @"txt"];
    STAssertNotNil(path, @"Can't find valid file");
}
-(void) testCurrentValue{
    STAssertEquals([theNumPad currentValue], 1, @"NumPad Current Value Failed to Initialize");
}
                    


@end
