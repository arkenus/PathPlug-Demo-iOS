//
//  SmartNote.h
//  PathPlugSDK
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  SmartNote Object to encapsulte interaction information
 */
@interface SmartNote : NSObject

/**
 *  URL of image file
 */
@property NSString *image;
/**
 *  Start DateTime
 */
@property NSDate *startDate;
/**
 *  End DateTime
 */
@property NSDate *endDate;
/**
 *  Title Text
 */
@property NSString *title;
/**
 *  Information Text
 */
@property NSString *information;
@end
