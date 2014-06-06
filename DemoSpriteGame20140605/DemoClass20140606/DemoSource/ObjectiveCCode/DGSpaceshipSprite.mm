//
//  DemoSpriteGameViewController.m
//  DemoSpriteGame
//
//  Created by yangfs on 14-6-6.
//  Copyright (c) 2014年 ucweb. All rights reserved.
//


#import "DGSpaceshipSprite.h"

@implementation DGSpaceshipSprite



+ (DGSpaceshipSprite*)addSpaceShipSprite:(CGRect)frame
{
	DGSpaceshipSprite* shipNode = nil;
	
	shipNode = [DGSpaceshipSprite spriteNodeWithImageNamed:@"Spaceship"];
	
	shipNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));;
	shipNode.xScale = 0.5f;
	shipNode.yScale = 0.5f;
	
	///< 旋转
	SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
	[shipNode runAction:[SKAction repeatActionForever:action]];
	
	return shipNode;
}



@end
