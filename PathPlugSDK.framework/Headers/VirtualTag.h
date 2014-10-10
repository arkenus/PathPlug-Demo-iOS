//
//  VirtualTag.h
//  PathPlugSDK
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  VirtualTag Object to encapsulte interaction information
 */
@interface VirtualTag : NSObject


/**
 *  URL of image file
 */
@property NSString *image;
/**
 *  Title Text
 */
@property NSString *title;
/**
 *  Description Text
 */
@property NSString *tag_description;
/**
 *  Price value
 */
@property NSNumber *price;
/**
 *  Sale Price Value
 */
@property NSNumber *sale_price;

@end
