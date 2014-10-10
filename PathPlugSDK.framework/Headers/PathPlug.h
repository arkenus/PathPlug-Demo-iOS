//
//  PathPlug.h
//  PathPlugSDK
//
//  Created by Berk Taner on 04/07/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlugData.h"

#import "Beacon.h"
#import "Interaction.h"
#import "VirtualTag.h"
#import "SmartNote.h"
#import "AudioSign.h"

@import CoreLocation;
@class PathPlug;
/**
 *  PathPlugDelegate is delegate method to pass data from framework.
 */
@protocol PathPlugDelegate <NSObject>
@optional
/**
 *  Returns audio sign interaction information encapsulated in a Plug Data
 *
 *  @param pathPlug PathPlug Object
 *  @param data     PlugData Object
 */
-(void)pathPlug:(PathPlug*)pathPlug getAssistanceData:(PlugData*)data;
/**
 *  Returns real time sightings of Beacons and their distances
 *
 *  @param pathPlug PathPlug Object
 *  @param beacon   Beacon Object
 *  @param distance distance in meters
 */
-(void)pathPlug:(PathPlug *)pathPlug updatedBeaconData:(Beacon*)beacon andDistance:(double)distance;
/**
 *  Returns virtual tag interaction information encapsulated in a Plug Data
 *
 *  @param pathPlug PathPlug Object
 *  @param data     PlugData Object
 */
-(void)pathPlug:(PathPlug *)pathPlug getVirtualtagData:(PlugData*)data;

/**
 *  Fired when Heatmap is active and region enter/exit action happens
 *
 *  @param pathPlug PathPlug object
 *  @param data     check for actionType for Enter | Exit
 *  @param beacon   Beacon Object
 */
-(void)pathPlug:(PathPlug *)pathPlug getHeatmapData:(PlugData*)data forBeacon:(Beacon*)beacon;
/**
 *  Fired when a beacon with smartnote object is seen
 *
 *  @param pathPlug PathPlug object
 *  @param data     PlugData Object
 */
-(void)pathPlug:(PathPlug *)pathPlug getSmartNoteData:(PlugData*)data;


/**
 *  Fired when data is completely downloaded from API and ready to use
 *
 *  @param pathPlug PathPlug Object
 *  @param result   YES when download finished
 */
-(void)pathPlug:(PathPlug *)pathPlug isFrameworkReady:(BOOL)result;
@end
/**
 *  PathPlug Object. Heart and soul of framework
 */
@interface PathPlug : NSObject<CLLocationManagerDelegate>
/**
 *  Returns a singleton instance of PathPlug for you to use
 *
 *  @return PathPlug Object
 */
+(PathPlug*)sharedPlug;
/**
 *  You need to use API Key and Secret obtained from www.pathplug.com generated for your application.
 *
 *  @param app_key   key for your application
 *  @param appSecret secret for your application
 */
-(void)initWithAppKey:(NSString*)app_key andAppSecret:(NSString*)appSecret;
/**
 *  Stops PathPlug Service
 */
-(void)stopService;
/**
 *  Starts PathPlug Service
 */
-(void)startService;
/**
 *  Gives you a list of beacons.
 *
 *  @return array of beacons
 */
-(NSArray*)getBeaconList;

@property(nonatomic,assign) id<PathPlugDelegate> delegate;

//time intervals for interactions
/**
 *  Refresh Interval for AudioSign Interaction
 */
@property (nonatomic) NSTimeInterval assitanceRefreshInterval;
/**
 *  Refresh Interval for Virtual Tag Interaction
 */
@property (nonatomic) NSTimeInterval virtualTagRefreshInterval;
/**
 *  Refresh Interval for Smart Note Interaction
 */
@property (nonatomic) NSTimeInterval smartNoteRefreshInterval;
//checker for invidiaul components
/**
 *  Used to enable AudioSign
 */
@property BOOL AssitanceEnabled;
/**
 *  Used to enable Heatmaps
 */
@property BOOL HeatmapEnabled;
/**
 *  Used to enable smartnote
 */
@property BOOL SmartNoteEnabled;
/**
 *  Used to enable real time beacon information delegate
 */
@property BOOL BeaconInfoEnabled;
/**
 *  Used to enable Virtual Tag
 */
@property BOOL VirtualTagEnabled;
/**
 *  Refresh interval for data
 */
@property (nonatomic) NSTimeInterval dataRefreshInterval;


@end
