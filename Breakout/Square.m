//
//  Square.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Square.h"

@implementation Square

@synthesize xcoord = _xcoord;
@synthesize ycoord = _ycoord;
@synthesize heightRatio = _heightRatio;
@synthesize on = _on;
@synthesize textured = _textured;
@synthesize radius = _radius;

-(id) init {
    self = [super init];
    if (self){
        _xcoord = 0;
        _ycoord = 0;
        _on = true;
        _heightRatio = 1;
        _textured = NO;
        _radius = 0.5;
    }
    return self;
}

-(id) initWithX:(float)x AndY :(float)y {
    self = [super init];
    if (self){
        _xcoord = x;
        _ycoord = y;
        _on = true;
        _heightRatio = 1;
        _textured = NO;
        _radius = 0.5;
    }
    return self;
}

-(id) initWithX:(float)x AndY : (float) y AndTextured:(BOOL)t{
    self = [self initWithX:x AndY:y];
    _textured = t;
    return self;
}

-(id) initWithX:(float)x AndY:(float)y AndHeightRatio:(float)hR{
    self = [self initWithX:x AndY:y];
    _heightRatio = hR;
    return self;
}

+(BOOL) collisionBetween:(Square *)s1 And:(Square *)s2{
//    NSLog(@"dist sq = %f", pow(s1.xcoord - s2.xcoord, 2) + pow(s1.ycoord - s2.ycoord, 2));
    if (abs(pow(s1.xcoord - s2.xcoord, 2) + pow(s1.ycoord - s2.ycoord, 2) - s1.radius*s1.radius) < 0.05){
        return YES;
    }
    return NO;
}

@end
