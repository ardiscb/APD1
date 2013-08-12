//
//  CollectionViewController.m
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomCollectionCellView.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //Create nib for CustomCollectionCellView
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionCellView" bundle:nil];
    if(nib != nil)
    {
        //register nib
        [comicCollectionView registerNib:nib forCellWithReuseIdentifier:@"CustomCell"];
    }

    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //create custom cell
    CustomCollectionCellView *cell = [comicCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    if(cell != nil)
    {
        NSLog(@"row=%d", indexPath.row);
        return cell;
        
        NSLog(@"Success!!");
    }
    return nil;
}

@end
