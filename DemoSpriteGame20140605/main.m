//
//  main.m
//  WebkitDemos
//
//  Created by yangfs on 14-5-13.
//  Copyright (c) 2014年 ucweb. All rights reserved.
//

#import "NBGHUnitTestMacroDefine.h"

#ifndef Enable_NBGHUnitTest_MacroDefine

#import <UIKit/UIKit.h>

#import "WebkitDemosAppDelegate.h"

int main(int argc, char * argv[])
{
	@autoreleasepool {
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([WebkitDemosAppDelegate class]));
	}
}

#endif

