/*
 *****************************************************************************
 * Copyright (C) 2005-2011 iphone Mobile Limited. All Rights Reserved
 * File			: DGLabelSpriteNode.h
 *
 * Description	: 文本显示
 *
 * Author		: yangfs@ucweb.com
 *
 * Created by yangfs on   2014-06-06.
 * History		: modify: 2014-06-06.
 *
 ******************************************************************************
 **/


#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>


@interface DGLabelSpriteNode : SKLabelNode
{
	
}

+ (DGLabelSpriteNode*)addLabelSprite:(CGRect)frame;

- (void)addActionObj;

@end
