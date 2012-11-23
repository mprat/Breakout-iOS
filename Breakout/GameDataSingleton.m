//
//  GameDataSingleton.m
//  Breakout
//
//  Created by Michele Pratusevich on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameDataSingleton.h"

@implementation GameDataSingleton

#pragma mark

+(id)sharedInstance:(int) rows : (int) cols {
    static GameDataSingleton *sharedInstance=nil;
    
    if (sharedInstance == nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[self alloc] init];
        });
    }
    
    return sharedInstance;
}

-(id)init: (int) rows : (int) cols{
    if (self = [super init]){
        for (int i = 0; i < rows; i++){
            for (int j = 0; j < cols; j++){
                [squares addObject:[[Square alloc]init:i:j]];
            }
        }
    }
    
    return self;
}

@end
