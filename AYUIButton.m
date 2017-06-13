//
//  AYUIButton.m
//
//  Created by Andy Yanok on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AYUIButton.h"


@implementation AYUIButton

+(instancetype)buttonWithType:(UIButtonType)buttonType {
    id Button = [super buttonWithType:buttonType];
    [Button addTarget:Button action:@selector(clearBgColorForButton:) forControlEvents:UIControlEventTouchUpInside];
    [Button addTarget:Button action:@selector(setBgColorForButton:) forControlEvents:UIControlEventTouchDown];
    [Button addTarget:Button action:@selector(clearBgColorForButton:) forControlEvents:UIControlEventTouchDragExit];
    return Button;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    if (backgroundStates == nil)
        backgroundStates = [[NSMutableDictionary alloc] init];
    
    [backgroundStates setObject:backgroundColor forKey:[NSNumber numberWithInt:state]];
    
    if (self.state == state) {
        [self setBackgroundColor:backgroundColor];
    }
}

- (UIColor *)backgroundColorForState:(UIControlState)state {
    return [backgroundStates objectForKey:[NSNumber numberWithInt:state]];
}

-(void)clearBgColorForButton:(id)sender {
    UIColor *normalColor = [self backgroundColorForState:UIControlStateNormal];
    if (normalColor) {
        CATransition *animation = [CATransition animation];
        [animation setType:kCATransitionFade];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.layer addAnimation:animation forKey:@"EaseOut"];
        self.backgroundColor = normalColor;
    }
}


-(void)setBgColorForButton:(id)sender {
    UIColor *selectedColor = [self backgroundColorForState:UIControlStateHighlighted];
    if (selectedColor) {
        self.backgroundColor = selectedColor;
    }
}


@end
