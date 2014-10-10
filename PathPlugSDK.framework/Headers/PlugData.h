//
//  PlugData.h
//  PathPlugSDK
//
//  Created by Berk Taner on 04/07/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  VirtualTag;
/**
 *  PlugData Object to encapsulate information
 */
@interface PlugData : NSObject
@property (strong,nonatomic) NSDate *timestamp;
@property double distance;
@property (strong,nonatomic) NSString *actionType;
// objects this object can contain
@property (nonatomic,retain) VirtualTag *virtualTag;
@property (nonatomic,retain) NSSet *audioSignSet;
@property (nonatomic,retain) NSSet *smartNoteSet;




@end
