//
//  Screen.m
//  SnickersMaze
//
//  Created by Lea Coligado on 7/22/13.
//  Copyright (c) 2013 Lea Coligado. All rights reserved.
//

#import "Screen.h"

@interface Screen ()
@property BOOL contentCreated;
@property SKView *parentView;
@end

@implementation Screen

int score;

// Object: dog
- (void)newDog {
    SKSpriteNode *dog = [[SKSpriteNode alloc] initWithImageNamed:@"snickers.png"];
    SKNode *playerNode = [self childNodeWithName:@"playerNode"];
    
    // Set position of dog
    dog.position = CGPointMake(playerNode.position.x, playerNode.position.y);
    dog.zRotation = playerNode.zRotation;
    dog.anchorPoint = CGPointMake(2.0, 0.5);
    
    [self addChild:dog];
    dog.name = @"Snickers";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Grab touch data
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:_parentView];
    SKNode *playerNode = [self childNodeWithName:@"playerNode"];
    SKNode *cursorNode = [self childNodeWithName:@"cursorNode"];
    
   cursorNode.position = CGPointMake(self.frame.size.width - pos.y, self.frame.size.height - pos.x);
    playerNode.position = cursorNode.position;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:_parentView];
    SKNode *playerNode = [self childNodeWithName:@"playerNode"];
    SKNode *cursorNode = [self childNodeWithName:@"cursorNode"];
    
    // Set the cursor's position to the finger and update player location.
    cursorNode.position = CGPointMake(self.frame.size.width - pos.y, self.frame.size.height - pos.x);
    playerNode.position = cursorNode.position;
}

- (SKSpriteNode *)newCursorNode {
    SKSpriteNode *cursorNode = [[SKSpriteNode alloc] initWithImageNamed:@"snickers.png"];
    cursorNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    cursorNode.name = @"cursorNode";
    return cursorNode;
}

- (SKSpriteNode *)newPlayerNode {
    SKSpriteNode *playerNode = [[SKSpriteNode alloc] initWithImageNamed:@"cesar.png"];
    playerNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    playerNode.name = @"playerNode";
    
    return playerNode;
}

@end
