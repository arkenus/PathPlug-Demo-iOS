//
//  Beacon.h
//  PathPlugSDK
//
//  Created by Berk Taner on 15/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Interaction;
/**
 *  Beacon Object to encapsulate data
 */
@interface Beacon : NSObject

/**
 *  shows if beacon is active
 */
@property (nonatomic, retain) NSNumber * active;
/**
 *  Base signal strentgh form api
 */
@property (nonatomic, retain) NSNumber * base_signal_strength;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * last_distance;
/**
 *  Major Value
 */
@property (nonatomic, retain) NSNumber * major;
/**
 *  minor value
 */
@property (nonatomic, retain) NSNumber * minor;
/**
 *  given name
 */
@property (nonatomic, retain) NSString * name;
/**
 *  Device UUID
 */
@property (nonatomic, retain) NSString * puuid;
/**
 *  tag given on Backend
 */
@property (nonatomic, retain) NSString * tag;
/**
 *  estimote,gimbal,kontakt
 */
@property (nonatomic, retain) NSString * type;
/**
 *  set of interactions
 */
@property (nonatomic, retain) NSMutableSet *hasInteraction;
@end

@interface Beacon (CoreDataGeneratedAccessors)

- (void)addHasInteractionObject:(Interaction *)value;
- (void)removeHasInteractionObject:(Interaction *)value;
- (void)addHasInteraction:(NSSet *)values;
- (void)removeHasInteraction:(NSSet *)values;

@end
