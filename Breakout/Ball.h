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
}

@property (nonatomic) float xvel;
@property (nonatomic) float yvel;

-(id)initWithX: (float) x AndY: (float) y AndTextured: (BOOL) t AndXVel: (float) xv AndYVel: (float) yv;

@end
