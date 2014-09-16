//
//  DemoSpriteGameViewController.m
//  DemoSpriteGame
//
//  Created by yangfs on 14-6-6.
//  Copyright (c) 2014年 ucweb. All rights reserved.
//


#import "DGLabelSpriteNode.h"


@implementation DGLabelSpriteNode


+ (DGLabelSpriteNode*)addLabelSprite:(CGRect)frame
{
	DGLabelSpriteNode* textNode = nil;
	
//	textNode = [DGLabelSpriteNode labelNodeWithText:@"Hello, World!"];
	textNode = [DGLabelSpriteNode labelNodeWithFontNamed:@"Chalkduster"];
//	textNode.fontName = @"STHeitiSC-Medium";
	textNode.text = @"Hello, World!";
	
	textNode.fontSize = 30;
	textNode.fontColor = [UIColor blueColor];
	textNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
	textNode.name = @"labelhelloNode"; ///< 可以用于搜索树中与名称相 匹配的节点。
	
	return textNode;
}


- (void)addActionObj
{
	SKAction* moveUp = [SKAction moveByX:0 y:100 duration:0.5];
	SKAction* zoom = [SKAction scaleTo:2.0 duration:0.25];
	SKAction* pause = [SKAction waitForDuration:0.5];
	SKAction* fadeOut = [SKAction fadeOutWithDuration:0.25];
	SKAction* fadeIn = [SKAction fadeInWithDuration:0.5];
	SKAction* moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeOut, fadeIn]];
	
	[self runAction:moveSequence];
}


@end
