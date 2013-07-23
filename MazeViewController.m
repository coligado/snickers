//
//  MazeViewController.m
//  SnickersMaze
//
//  Created by Lea Coligado on 7/22/13.
//  Copyright (c) 2013 Lea Coligado. All rights reserved.
//

#import "MazeViewController.h"
#import "DogScene.h"
#import <SpriteKit/SpriteKit.h>

@interface MazeViewController ()

@end

@implementation MazeViewController

- (void)loadView {
    self.view = [[SKView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SKView *dogView = (SKView *)self.view;
    
    dogView.showsDrawCount = YES;
    dogView.showsNodeCount = YES;
    dogView.showsFPS = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    DogScene *dog = [[DogScene alloc] initWithSize:CGSizeMake(768, 1024)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene:dog];
    
    /*
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    Screen *scene = [[Screen alloc] initWithSize: CGSizeMake(screenHeight, screenWidth)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene:scene];
    */
}



/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
} */

@end
