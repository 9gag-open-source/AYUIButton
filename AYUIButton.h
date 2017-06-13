//
//  AYUIButton.h
//
//  Created by Andy Yanok on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

/*
    This subclass was created to be able to set the background color for UIControlState
*/

@interface AYUIButton : UIButton 
{
@private
    NSMutableDictionary *backgroundStates;
@public
    
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
- (UIColor*)backgroundColorForState:(UIControlState)state;

@end
