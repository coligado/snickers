//
//  DogScene.m
//  SnickersMaze
//
//  Created by Lea Coligado on 7/22/13.
//  Copyright (c) 2013 Lea Coligado. All rights reserved.
//

#import "DogScene.h"

@interface DogScene ()

@property BOOL contentCreated;

@end

@implementation DogScene

- (void)didMoveToView:(SKView *)view {
    if (!self.contentCreated) {
        [self createSceneContent];
        self.contentCreated = YES;
    }
}

- (void)createSceneContent {
    //self.backgroundColor = [SKColor redColor];
    self.scaleMode = SKSceneScaleModeAspectFill;
    [self drawGrid];
    [self addChild:[self newDogNode]];
}
    
static inline CGFloat skRand(CGFloat delta) {
    int r = rand() % 4;
    if (r == 0) r = 3;
    return r * delta;
}

- (void)drawGrid {
    CGFloat mazeHeight = self.size.height - 300.0;  // 50 pixel margins top and bottom
    CGFloat mazeWidth = self.size.width - 100.0;    // 50 pixel margins on sides
    CGFloat yD = mazeHeight / 5.0;
    CGFloat xD = mazeWidth / 5.0;

    /* y coords
     150
     295
     440
     584
     729
     */
    
    /* x coords
     100
     233
     367
     501
     634 */
    
    for (int i = 0; i < 5; i++) {
        CGFloat yPos = 150.0 + i * yD;
        NSLog(@"yPos = %f", yPos);
        SKSpriteNode *wall = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(skRand(xD), 15.0)];
        // Must be above snickers node
        wall.position = CGPointMake(skRand(xD),yPos);
        wall.name = @"horizontal";
        wall.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:wall.size];
        wall.physicsBody.dynamic = NO;
        [self addChild:wall];
    }
    
    for (int i = 0; i < 5; i++) {
        CGFloat xPos = 100.0 + i * xD;
        NSLog(@"xPos = %f", xPos);
        SKSpriteNode *wall = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(15.0, mazeHeight)];
        wall.position = CGPointMake(xPos, skRand(yD));
        wall.name = @"vertical";
        [self addChild:wall];
    }
}

- (SKSpriteNode *)newDogNode {
//    SKSpriteNode *dogNode = [[SKSpriteNode alloc] initWithColor:[SKColor orangeColor] size:CGSizeMake(64, 32)];
    SKSpriteNode *dogNode = [[SKSpriteNode alloc] initWithImageNamed:@"snoop"];
    dogNode.position = CGPointMake(150.0, self.size.height - 100.0);
    dogNode.name = @"Snickers";
    
    /*
    SKAction *trot = [SKAction sequence:@[
                                          [SKAction waitForDuration:1.0],
                                          [SKAction moveByX:50.0 y:25.0 duration:5],
                                          [SKAction waitForDuration:2.0],
                                          [SKAction moveByX:50.0 y:25.0 duration:5]]];
    [dogNode runAction:[SKAction repeatActionForever:trot]];
    */
    // Add  physics body to the spaceship
    dogNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:dogNode.size];
    dogNode.physicsBody.dynamic = YES;
    return dogNode;
}

// TOUCHES
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKNode *dogNode = [self childNodeWithName:@"Snickers"];
    if (dogNode) {
        dogNode.name = nil;
        SKAction *moveUp = [SKAction moveByX:0 y:100.0 duration:0.5];
        SKAction *zoom = [SKAction scaleTo: 2.0 duration:0.25];
        SKAction *pause =[SKAction waitForDuration:0.5];
        SKAction *fadeAway = [SKAction fadeInWithDuration:0.25];
        SKAction *remove = [SKAction removeFromParent];
        SKAction *moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeAway, remove]];
        [dogNode runAction:moveSequence];
    }
}

- (void)didSimulatePhysics {
    [self enumerateChildNodesWithName:@"rock" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0) [node removeFromParent];
    }];
}

@end
