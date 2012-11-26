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

-(id)initWithX: (float) x AndY: (float) y AndTextured: (BOOL) t AndXVel: (float) xv AndYVel: (float) yv{
    self = [super initWithX:x AndY: y AndTextured: t];
    _xvel = xv;
    _yvel = yv;
    return self;
}

@end
