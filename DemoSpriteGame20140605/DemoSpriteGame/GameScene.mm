//
//  GameScene.m
//  DemoSpriteGame
//
//  Created by yangfs on 14-6-6.
//  Copyright (c) 2014年 ucweb. All rights reserved.
//


#import "DGSpriteObjectFactory.h"
#import "GameScene.h"
#import "DGSpaceshipScene.h"



@interface GameScene()

@property BOOL contentCreated;   ///< 跟踪场景是否已创建其内容

@property (nonatomic, retain)DGLabelSpriteNode* helloLabel;
@property (nonatomic, retain)DGSpaceshipSprite* shipNode;

@end


@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
	
	// 每当视图呈现场景时,didMoveToView:方法都会被调用。
	// 但是,在这种情况下,场景的 内容应只在场景第一次呈现时进行配置。
	// 因此,这段代码使用先前定义的属性 (contentCreated)来跟踪场景的内容是否已经被初始化。
	
	if (!_contentCreated)
	{
		[self createSceneContents];
		
		_contentCreated = YES;
	}
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
			[self addActionObj];
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
	self.shipNode = [DGSpriteObjectFactory buildSpaceShipSprite:self.frame];
//	[self addChild:_shipNode];
}

///< 添加一个文本对象(渲染节点)
- (void)addLabelSprite
{
	self.helloLabel = [DGSpriteObjectFactory buildLabelSprite:self.frame];
	[self addChild:_helloLabel];
}

- (void)createSceneContents
{
	// 场景在绘制它的子元素之前用背景色绘制视图的区域。注意使用 SKColor 类创建 color 对 象。事实上,SKColor 不是一个类,它是一个宏,在 iOS 上映射为 UIColor 而在 OS X 上它映射为 NSColor。它的存在是为了使创建跨平台的代码更容易。
//	self.backgroundColor = [SKColor blueColor];
	
	///< 场景的缩放(scale)模式决定如何进行缩放以适应视图。
	self.scaleMode = SKSceneScaleModeAspectFit;
	
	[self addSpaceShipSprite];  ///< 图片精灵
	[self addLabelSprite];      ///< 显示文本
}


- (void)addActionObj
{
	SKAction* moveUp = [SKAction moveByX:0 y:100 duration:0.5];
	SKAction* zoom = [SKAction scaleTo:2.0 duration:0.25];
	SKAction* pause = [SKAction waitForDuration:0.5];
	SKAction* fadeOut = [SKAction fadeOutWithDuration:0.25];
	SKAction* fadeIn = [SKAction fadeInWithDuration:0.5];
	SKAction* moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeOut, fadeIn]];
	
	[_helloLabel runAction:moveSequence completion:^{
		SKScene * spaceshipScene = [[DGSpaceshipScene alloc] initWithSize:self.size];
		SKTransition *doors= [SKTransition doorsOpenVerticalWithDuration:0.5];
		[self.view presentScene:spaceshipScene transition:doors];
	}];
}


@end
