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
}

@property (nonatomic) float xcoord;
@property (nonatomic) float ycoord;
@property (nonatomic) BOOL on;

-(id)init;
-(id)initWithX: (float) x AndY: (float) y;

@end
