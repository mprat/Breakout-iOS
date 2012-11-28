//
//  Ball.h
//  Breakout
//
//  Created by Michele Pratusevich on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Square.h"

@interface Ball : Square {
    float xvel;
    float yvel;
    float xvelinit;
    float yvelinit;
    float xcoordinit;
    float ycoordinit;
}

@property (nonatomic) float xvel;
@property (nonatomic) float yvel;
@property (nonatomic) float xvelinit;
@property (nonatomic) float yvelinit;
@property (nonatomic) float xcoordinit;
@property (nonatomic) float ycoordinit;

-(id)initWithX: (float) x AndY: (float) y AndTextured: (BOOL) t AndXVel: (float) xv AndYVel: (float) yv;
-(void)step;
-(void)reset;
-(void)bounce: (Square *) s;

@end
