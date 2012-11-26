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
@synthesize on = _on;

-(id) init {
    self = [super init];
    if (self){
        _xcoord = 0;
        _ycoord = 0;
        _on = true;
    }
    return self;
}

-(id) initWithX:(float)x AndY :(float)y {
    self = [super init];
    if (self){
        _xcoord = x;
        _ycoord = y;
        _on = true;
    }
    return self;
}

@end
