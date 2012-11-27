//
//  Square.h
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject{
    float xcoord;
    float ycoord;
    BOOL on;
    float heightRatio;
    BOOL textured;
}

@property (nonatomic) float xcoord;
@property (nonatomic) float ycoord;
@property (nonatomic) float heightRatio;
@property (nonatomic) BOOL on;
@property (nonatomic) BOOL textured;

-(id)init;
-(id)initWithX: (float) x AndY: (float) y;
-(id)initWithX: (float) x AndY: (float) y AndTextured: (BOOL) t;
-(id)initWithX:(float)x AndY:(float)y AndHeightRatio: (float)hR;
+(BOOL)collisionBetween:(Square *) s1 And: (Square *) s2;

@end
