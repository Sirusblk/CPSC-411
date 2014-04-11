//
//  TransitRoute.h
//  Mass Transit
//
//  Created by David McLaren on 4/5/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitRoute : NSObject

@property NSString* route_id;
@property NSString* route_long_name;
@property NSString* route_color;        //Optional
@property NSString* route_text_color;   //Optional

-(id) initWithID:(NSString*) routeID longName:(NSString*) routeLongName;
-(id) initWithID:(NSString*) routeID longName:(NSString*) routeLongName color:(NSString*) routeColor textColor:(NSString*) routeTextColor;

@end
