//
//  GameDataSingleton.h
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Square.h"

@interface GameDataSingleton : NSObject{
    NSMutableArray *squares;
}

+ (id)sharedInstance: (int) rows: (int) cols;

@end
