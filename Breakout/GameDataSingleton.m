//
//  GameDataSingleton.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameDataSingleton.h"

#define BUFFER_OFFSET(i) ((char *)NULL + (i))

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
    
    //ball
//    sq = [[Square alloc] initWithX:3.0 AndY:-5.25 AndTextured:YES];
    sq = [[Ball alloc] initWithX:3.0 AndY:-5.25 AndTextured:YES AndXVel:0.1 AndYVel:0.1];
    [_squares addObject:sq];
    
    //user-controlled platform
//    sq = [[Square alloc] initWithX:3.0 AndY:-6.0 AndHeightRatio:0.5];
//    [_squares addObject:sq];
    
//    NSLog(@"length of squares = %d", [_squares count]);
    
    
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    //glBlendFunc(GL_ONE, GL_SRC_COLOR);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    return self;
}

-(void) drawSquaresWithAspect:(float)aspect{
    Square *s;
    GLKMatrix4 _projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 0.1f, 100.0f);
    GLKMatrix4 _baseModelViewMatrix = GLKMatrix4MakeTranslation(-3.0f, 0.0f, -10.0f);
    
    for (s in _squares){
        if ([s isKindOfClass:[Ball class]]){
            [(Ball *)s step];
            [self wallCollision:(Ball *)s];
            [self squareCollision:(Ball *)s];
        }
//        NSLog(@"x = %f, y = %f", [s xcoord], [s ycoord]);
        if (s.on){
            GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(s.xcoord, s.ycoord, 0.0f), GLKMatrix4MakeScale(1.0f, s.heightRatio, 1.0f));
//          GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(s.xcoord, s.ycoord, 0.0f);
            modelViewMatrix = GLKMatrix4Multiply(_baseModelViewMatrix, modelViewMatrix);
            GLKMatrix4 holdmat = GLKMatrix4Multiply(_projectionMatrix, modelViewMatrix);
            glUniformMatrix4fv(uniforms[UNIFORM_MODELVIEWPROJECTION_MATRIX], 1, 0, holdmat.m);
        
//          if (s.textured){
                glEnableVertexAttribArray(ATTRIB_TEXTURE);
//          } else {
//              glDisableVertexAttribArray(ATTRIB_TEXTURE);
//          }
        
            glDrawArrays(GL_TRIANGLES, 0, 6);
        }
    }
}

-(void) squareCollision:(Ball *)b{
    Square *s;
    for (s in _squares){
        if (![s isKindOfClass:[Ball class]] && s.on){
            if ([Square collisionBetween:b And:s]){
                s.on = NO;
                [b bounce:s];
            }
        }
    }
}

-(void) wallCollision:(Ball *)b{
    // right or left wall
    if ((fabsf(b.xcoord - 6.5 - b.radius) < 0.1) || (fabsf(b.xcoord + 1.5 + b.radius) < 0.1)) {
        [b reflectY];
    }
    //top
    if (fabsf(b.ycoord - 5.5 - b.radius) < 0.1) {
        [b reflectX];
    }
    //bottom resets
    if (fabsf(b.ycoord + 5.5 + b.radius) < 0.1){
        [b reset];
//        b.yvel = -b.yvel;
    }
}

@end
