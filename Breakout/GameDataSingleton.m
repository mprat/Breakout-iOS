//
//  GameDataSingleton.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameDataSingleton.h"

@implementation GameDataSingleton

#pragma mark

+(id)sharedInstance:(int) rows : (int) cols {
    static GameDataSingleton *sharedInstance=nil;
    
    if (sharedInstance == nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[self alloc] init];
        });
    }
    
    return sharedInstance;
}

-(id)init: (int) rows : (int) cols{
    NSLog(@"r = %d, c = %d", rows, cols);
    if (self = [super init]){
        for (int i = 0; i < rows; i++){
            for (int j = 0; j < cols; j++){
                Square *sq = [sq initWithX:1.5*i AndY:1.5*j];
                [squares addObject:sq];
            }
        }
    }
    
    return self;
}

-(void) drawSquares{
    Square *s;
    for (s in squares){
        NSLog(@"x = %f, y = %f", [s xcoord], [s ycoord]);
    }
}

@end
