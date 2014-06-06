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
	
	textNode = [DGLabelSpriteNode labelNodeWithFontNamed:@"Chalkduster"];
	
	textNode.text = @"Hello, World!";
	textNode.fontSize = 30;
	//textNode.fontColor = [UIColor blueColor];
	textNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
	
	return textNode;
}



@end
