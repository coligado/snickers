//
//  SnickersMaze.m
//  SnickersMaze
//
//  Created by Lea Coligado on 7/22/13.
//  Copyright (c) 2013 Lea Coligado. All rights reserved.
//

#import "SnickersMaze.h"
#import <SpriteKit/SpriteKit.h>

@implementation SnickersMaze

- (void)drawSnickers {
    SKSpriteNode *snickers = [[SKSpriteNode alloc] initWithImageNamed:@"snickers.png"];
    SKAction *moveIt = [SKAction moveByX:50.0 y:50.0 duration:5];
    [snickers runAction:moveIt];
}

@end
