
/*
 *****************************************************************************
 * Copyright (C) 2005-2014 UC Mobile Limited. All Rights Reserved
 * File			: DGSpriteObjectFactory.h
 *
 * Description  : 小说 数据请求对象构造工厂
 *
 * Author		: yangfs@ucweb.com
 *
 * Created by yangfs on   2014-06-06.
 * History		: modify: 2014-06-06.
 *
 ******************************************************************************
 **/


#import "DGSpriteMacroDefine.h"
#import <SpriteKit/SpriteKit.h>

#import "DGSpaceshipSprite.h"
#import "DGLabelSpriteNode.h"


@interface DGSpriteObjectFactory : NSObject
{
	
}


+ (DGLabelSpriteNode*)buildLabelSprite:(CGRect)frame;

+ (DGSpaceshipSprite*)buildSpaceShipSprite:(CGRect)frame;

@end

