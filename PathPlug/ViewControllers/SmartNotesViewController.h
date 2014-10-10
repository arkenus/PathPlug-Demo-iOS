//
//  SmartNotesViewController.h
//  PathPlug
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmartNotesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;



@end
