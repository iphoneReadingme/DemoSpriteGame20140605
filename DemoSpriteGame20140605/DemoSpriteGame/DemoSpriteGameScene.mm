//
//  DemoSpriteGameMyScene.m
//  DemoSpriteGame
//
//  Created by yangfs on 14-6-6.
//  Copyright (c) 2014年 ucweb. All rights reserved.
//

#import "DemoSpriteGameScene.h"

@implementation DemoSpriteGameScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
		
		///< 添加节点
		CGPoint pt = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
		[self addSpriteObject:pt];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
	
	for (UITouch *touch in touches)
	{
		//CGPoint location = [touch locationInNode:self];
		
		//[self addSpriteObject:location];
		//NSLog(@"===location=%@", NSStringFromCGPoint(location));
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	for (UITouch *touch in touches)
	{
		CGPoint location = [touch locationInNode:self];
		
		//[self addSpriteObject:location];
		NSLog(@"===location=%@", NSStringFromCGPoint(location));
		int nCount = [touch tapCount];
		if (nCount == 2)
		{
			///< 双击打印测试信息
			//self.touchOne()
		}
		else if (nCount == 1)
		{
			;
		}
	}
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


///< 添加一个sprite对象(渲染节点)
- (void)addSpriteObject:(CGPoint)location
{
	SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
	
	sprite.position = location;
	
	SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
	
	[sprite runAction:[SKAction repeatActionForever:action]];
	
	[self addChild:sprite];
}


@end
