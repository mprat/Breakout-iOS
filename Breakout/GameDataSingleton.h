//
//  GameDataSingleton.h
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#include "Square.h"

@interface GameDataSingleton : NSObject{
    NSMutableArray *squares;
    int rows;
    int cols;
}

@property (nonatomic, retain) NSMutableArray *squares;
@property (nonatomic) int rows;
@property (nonatomic) int cols;
//@property (nonatomic) GLKMatrix4 *baseModelViewMatrix;

+ (id)sharedInstance;
- (void) drawSquaresWithAspect:(float) aspect;

@end
