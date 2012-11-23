//
//  Square.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Square.h"

@implementation Square

@synthesize xcoord;
@synthesize ycoord;
@synthesize on;

-(id) init {
    self = [super init];
    if (self){
        xcoord = 0;
        ycoord = 0;
        on = true;
    }
    return self;
}

-(id) init:(int)x :(int)y {
    self = [super init];
    if (self){
        xcoord = x;
        ycoord = y;
        on = true;
    }
    return self;
}

@end
