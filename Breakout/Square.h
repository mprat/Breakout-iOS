//
//  Square.h
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject{
    int xcoord;
    int ycoord;
    BOOL on;
}

@property (nonatomic) int xcoord;
@property (nonatomic) int ycoord;
@property (nonatomic) BOOL on;

-(id)init;
-(id)init: (int) x: (int) y;

@end
