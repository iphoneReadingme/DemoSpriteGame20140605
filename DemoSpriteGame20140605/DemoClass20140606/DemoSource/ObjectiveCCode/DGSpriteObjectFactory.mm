


#import "DGSpriteObjectFactory.h"


@implementation DGSpriteObjectFactory


+ (SKNode*)buildDGSpriteObjWithType:(DGSpriteType)type withFrame:(CGRect)frame
{
    SKNode* pNode = nil;
    
    switch(type)
    {
        case DGSpriteTypeLabel:
        {
			pNode = [DGLabelSpriteNode addLabelSprite:frame];
			
            break;
        }
        case DGSpriteTypeImage:
        {
            pNode = [DGSpaceshipSprite addSpaceShipSprite:frame];
            break;
        }
        default:
            assert(false);
            break;
            
    }
    
    return pNode;
}


+ (DGLabelSpriteNode*)buildLabelSprite:(CGRect)frame
{
	return (DGLabelSpriteNode*)[DGSpriteObjectFactory buildDGSpriteObjWithType:DGSpriteTypeLabel withFrame:frame];
}

+ (DGSpaceshipSprite*)buildSpaceShipSprite:(CGRect)frame
{
	return (DGSpaceshipSprite*)[DGSpriteObjectFactory buildDGSpriteObjWithType:DGSpriteTypeImage withFrame:frame];
}

@end

