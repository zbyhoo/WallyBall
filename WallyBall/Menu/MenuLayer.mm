//
//  MenuScene.m
//  WallyBall
//
//  Created by Zbigniew Kominek on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "CCScene.h"
#import "CCSprite.h"
#import "CCMenuItem.h"
#import "CCMenu.h"
#import "CCDirector.h"
#import "CCTransition.h"

//TODO delete
#import "HelloWorldLayer.h"

@interface MenuLayer (Private)

- (void) setUpMenu;

- (void) playTapped:(CCMenuItem*)menuItem;

@end

@implementation MenuLayer

+ (id) scene
{
    CCScene* scene = [CCScene node];
    MenuLayer* menuNode = [MenuLayer node];
    [scene addChild:menuNode];
    
    return scene;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        CCSprite* titleSprite = [CCSprite spriteWithFile:@"title.png"];
        titleSprite.position = CGPointMake(250, 250);
        [self addChild:titleSprite];
        
        [self setUpMenu];
    }
    return self;
}

- (void) setUpMenu
{
    CCMenuItemImage* menuItemPlay = [CCMenuItemImage itemFromNormalImage:@"menu_play_button.png"
                                                           selectedImage:@"menu_play_button_selected.png"
                                                                target:self
                                                              selector:@selector(playTapped:)];
    
    CCMenu* mainMenu = [CCMenu menuWithItems:menuItemPlay, nil];
    [mainMenu alignItemsVertically];
    [self addChild:mainMenu];
}

- (void) playTapped:(CCMenuItem*)menuItem
{
    CCTransitionFade* transition = [CCTransitionFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]];
    [[CCDirector sharedDirector] replaceScene:transition];
}

@end
