//
//  Ball.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize xvel = _xvel;
@synthesize yvel = _yvel;
@synthesize xvelinit = _xvelinit;
@synthesize yvelinit = _yvelinit;
@synthesize xcoordinit = _xcoordinit;
@synthesize ycoordinit = _ycoordinit;

-(id)initWithX: (float) x AndY: (float) y AndTextured: (BOOL) t AndXVel: (float) xv AndYVel: (float) yv{
    self = [super initWithX:x AndY: y AndTextured: t];
    _xvel = xv;
    _yvel = yv;
    _xvelinit = xv;
    _yvelinit = yv;
    _xcoordinit = x;
    _ycoordinit = y;
    return self;
}

-(void)step{
    super.xcoord += _xvel;
    super.ycoord += _yvel;
}

-(void)reset{
    super.xcoord = _xcoordinit;
    super.ycoord = _ycoordinit;
    _xvel = _xvelinit;
    _yvel = _yvelinit;
}

@end
