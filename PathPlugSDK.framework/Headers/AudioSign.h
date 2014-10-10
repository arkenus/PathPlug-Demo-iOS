//
//  AudioSign.h
//  PathPlugSDK
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  AudioSign Object to encapsulte interaction information
 */
@interface AudioSign : NSObject

/**
 *  Message text
 */
@property NSString *sign_message;
/**
 *  Language for text
 */
@property NSString *language;
@end
