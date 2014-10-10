//
//  Interaction.h
//  PathPlugSDK
//
//  Created by Berk Taner on 15/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  Beacon;
@class SmartNote;
#import "VirtualTag.h"
@class AudioSign;
@interface Interaction : NSObject

@property (nonatomic, retain) NSNumber * id;
/**
 *  tag given on backend
 */
@property (nonatomic, retain) NSString * tag;
/**
 *  allowed distance
 */
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSNumber * priority;
/**
 *  type of interaction (heatmap,audiosign,virtualtag,smartnote)
 */
@property (nonatomic, retain) NSString * interaction_type;
/**
 *  status
 */
@property (nonatomic, retain) NSNumber * active;

// objects this interaction can contain
/**
 *  VirtualTag Object
 */
@property (nonatomic,retain) VirtualTag *virtualTag;
/**
 *  Set of Audio Sign Objects
 */
@property (nonatomic,retain) NSMutableSet *audioSignSet;
/**
 *  Set of SmartNote Objets
 */
@property (nonatomic,retain) NSMutableSet *smartNoteSet;


@property (nonatomic, retain) Beacon *hasBeacon;
@end
