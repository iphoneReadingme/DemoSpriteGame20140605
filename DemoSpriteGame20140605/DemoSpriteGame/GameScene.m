//
//  GameScene.m
//  DemoSpriteGame
//
//  Created by yangfs on 14-6-6.
//  Copyright (c) 2014年 ucweb. All rights reserved.
//


#import "DGSpaceshipSprite.h"
#import "DGLabelSpriteNode.h"
#import "GameScene.h"

//#import "DemoSpriteGame-Bridging-Header.h"
#import "DemoTest-Swift.h"


@interface GameScene()

@property (nonatomic, retain)DGLabelSpriteNode* helloLabel;
@property (nonatomic, retain)DGSpaceshipSprite* shipNode;

@end


@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 65;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
	
	///< 添加节点
	//CGPoint pt = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
	//[self addSpriteObject:pt];
	
	[self addSpaceShipSprite];
	[self addLabelSprite];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	/* Called when a touch begins */
	
	//for (UITouch *touch in touches)
	{
		//CGPoint location = [touch locationInNode:self];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	for (UITouch *touch in touches)
	{
		CGPoint location = [touch locationInNode:self];
		
		//[self addSpriteObject:location];
		NSLog(@"===location=%@", NSStringFromCGPoint(location));
		int nCount = (int)[touch tapCount];
		if (nCount == 2)
		{
			///< 双击打印测试信息
			//self.touchOne()
			[self addSwiftDemoTest];
		}
		else if (nCount == 1)
		{
			_helloLabel.position = location;
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

///< 添加一个sprite对象(渲染节点)
- (void)addSpaceShipSprite
{
	self.shipNode = [DGSpaceshipSprite addSpaceShipSprite:self.frame];
	[self addChild:_shipNode];
}

///< 添加一个文本对象(渲染节点)
- (void)addLabelSprite
{
	self.helloLabel = [DGLabelSpriteNode addLabelSprite:self.frame];
	[self addChild:_helloLabel];
}

- (void)addSwiftDemoTest
{
	Demo* demo = [[Demo alloc] initWithName:@"hi"];
	NSLog(@"the instance is [%@]", demo);
	DemoTest* demoTest = [[DemoTest alloc] initWithName:@"hi"];
	NSLog(@"the instance is [%@]", demoTest);
	[demoTest testFun];
}

@end
