//
//  GridGenerator.h
//  Sudoku.v3
//
//  Created by Jessica Schroeder on 2/10/13.
//  Copyright (c) 2013 Jessica Schroeder, Alana Shine, Will Tachau. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GridGenerator;

@interface GridGenerator : NSObject {
    NSString* theGrid;
}

-(NSString*) getGrid;



@end

