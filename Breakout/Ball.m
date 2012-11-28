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
    self.xcoord += _xvel;
    self.ycoord += _yvel;
}

-(void)reset{
    self.xcoord = _xcoordinit;
    self.ycoord = _ycoordinit;
    _xvel = _xvelinit;
    _yvel = _yvelinit;
}

-(void)bounce: (Square *) s{
    if ((self.ycoord < s.ycoord - self.radius*.4) || (self.ycoord > s.ycoord + self.radius*0.4)){
        self.yvel = -self.yvel;
    } else if ((self.xcoord < s.xcoord - self.radius*.4) || (self.xcoord > s.xcoord + self.radius*0.4)){
        self.xvel = -self.xvel;
    }
}

@end
