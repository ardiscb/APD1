//
//  CollectionViewController.h
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    IBOutlet UICollectionView *comicCollectionView;
    NSArray *comicCovers;
}

-(IBAction)onClick:(id)sender;

@end
