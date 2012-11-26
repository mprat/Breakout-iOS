//
//  GameDataSingleton.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameDataSingleton.h"

//@interface GameDataSingleton() 
//@property (nonatomic) int rows;
//@property (nonatomic) int cols;
//@end

enum
{
    UNIFORM_MODELVIEWPROJECTION_MATRIX,
    //    UNIFORM_NORMAL_MATRIX,
    UNIFORM_TEXTURE,
    NUM_UNIFORMS
};
GLint uniforms[NUM_UNIFORMS];

// Attribute index.
enum
{
    ATTRIB_VERTEX,
    ATTRIB_TEXTURE,
    NUM_ATTRIBUTES
};

@implementation GameDataSingleton

@synthesize rows = _rows;
@synthesize cols = _cols;
@synthesize squares = _squares;
//@synthesize baseModelViewMatrix = _baseModelViewMatrix;

#pragma mark

+(id)sharedInstance {
    static GameDataSingleton *sharedInstance=nil;
    
    if (sharedInstance == nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[GameDataSingleton alloc] init];
        });
    }
    
    return sharedInstance;
}

-(id)init{
    _rows = 5;
    _cols = 5;
//    NSLog(@"r = %d, c = %d", _rows, _cols);
    Square *sq;
    if (self = [super init]){
        _squares = [[NSMutableArray alloc] init];
        for (int i = 0; i < _rows; i++){
            for (int j = 0; j < _cols; j++){
                sq = [[Square alloc] initWithX:1.5*i AndY:1.5*j - 1.0];
                [_squares addObject:sq];
            }
        }
    }
    
//    NSLog(@"length of squares = %d", [_squares count]);
    
    return self;
}

-(void) drawSquaresWithAspect:(float)aspect{
    Square *s;
    GLKMatrix4 _projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 0.1f, 100.0f);
    GLKMatrix4 _baseModelViewMatrix = GLKMatrix4MakeTranslation(-3.0f, 0.0f, -10.0f);
    for (s in _squares){
//        NSLog(@"x = %f, y = %f", [s xcoord], [s ycoord]);
        GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(s.xcoord, s.ycoord, 0.0f);
        modelViewMatrix = GLKMatrix4Multiply(_baseModelViewMatrix, modelViewMatrix);
        GLKMatrix4 holdmat = GLKMatrix4Multiply(_projectionMatrix, modelViewMatrix);
        glUniformMatrix4fv(uniforms[UNIFORM_MODELVIEWPROJECTION_MATRIX], 1, 0, holdmat.m);
        glDrawArrays(GL_TRIANGLES, 0, 6);
    }
}

@end
