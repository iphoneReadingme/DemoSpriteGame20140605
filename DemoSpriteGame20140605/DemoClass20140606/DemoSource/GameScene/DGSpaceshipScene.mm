

#import "DGSpriteObjectFactory.h"
#import "DGSpaceshipScene.h"


@interface DGSpaceshipScene()

@property BOOL contentCreated;
@property (nonatomic, retain)SKSpriteNode* shipNode;

@end


@implementation DGSpaceshipScene

- (void)dealloc
{
	self.shipNode = nil;
	
//	[super dealloc];
}

- (void)didMoveToView:(SKView *)view
{
	if(!self.contentCreated)
	{
		[self createSceneContents];
		self.contentCreated = YES;
	}
}

///< 添加一个sprite对象(渲染节点)
- (DGSpaceshipSprite *)addSpaceShipSprite:(CGRect)frame
{
	return [DGSpriteObjectFactory buildSpaceShipSprite:self.frame];
}

- (SKSpriteNode *)newSpaceship
{
	int nFactor = 5;
	DGSpaceshipSprite *hull= [self addSpaceShipSprite:self.frame];
	hull.size = CGSizeMake(64*nFactor,32*nFactor);
	
	///< 重力施加到飞船的物 理体。
	hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hull.size];
//	hull.physicsBody.dynamic = NO;
	
	SKAction* pauseA = [SKAction waitForDuration:1.0];
	SKAction* moveA = [SKAction moveByX:100 y:50.0 duration:1.0];
	SKAction* pauseB = [SKAction waitForDuration:1.0];
	SKAction* moveB = [SKAction moveByX:-100.0 y:-50 duration:1.0];
	
	SKAction* hover = [SKAction sequence:@[pauseA, moveA, pauseB, moveB]];
	
	[hull runAction:[SKAction repeatActionForever:hover]];
	
	SKSpriteNode *light1 = [self newLight];
	light1.position = CGPointMake(-28.0*nFactor, 6.0*nFactor);
	[hull addChild:light1];
	
	SKSpriteNode *light2 = [self newLight];
	light2.position = CGPointMake(28.0*nFactor, 6.0*nFactor);
	[hull addChild:light2];
	
	return hull;
}

- (SKSpriteNode *)newLight
{
	SKSpriteNode *light = [[SKSpriteNode alloc] initWithColor:[SKColor yellowColor] size:CGSizeMake(8*4,8*4)];
	SKAction *blink = [SKAction sequence:@[[SKAction fadeOutWithDuration:0.25],
										   [SKAction fadeInWithDuration:0.25]]];
	
	///< 需要注意的是引入了一种新的动作。 一个重复的动作不断地重复的传递给它的动作。在这种情况下,序列一直重复。
	SKAction *blinkForever = [SKAction repeatActionForever:blink];
	[light runAction: blinkForever];
	
	return light;
}

- (void)createSceneContents
{
	self.backgroundColor = [SKColor grayColor];
	self.scaleMode = SKSceneScaleModeAspectFit;
	
	SKSpriteNode *spaceship = [self newSpaceship];
	spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-150);
	
	[self addChild:spaceship];
	
	self.shipNode = spaceship;
}

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
		}
		else if (nCount == 1)
		{
			_shipNode.position = location;
		}
	}
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
