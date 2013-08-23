//
//  CollectionViewController.m
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomCollectionCellView.h"
#import "DetailsViewController.h"
#import "ViewController.h"
#import "AddComicViewController.h"

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
    comicCovers = [[NSArray alloc] initWithObjects:
                   [UIImage imageNamed:@"comic1.jpg"],
                   [UIImage imageNamed:@"comic2.jpg"],
                   [UIImage imageNamed:@"comic3.jpg"],
                   [UIImage imageNamed:@"comic4.jpg"],
                   [UIImage imageNamed:@"comic5.jpg"],
                   [UIImage imageNamed:@"comic6.jpg"], nil];
    
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


-(IBAction)onClick:(id)sender
{
    ViewController *mainView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    if(mainView != nil)
    {
        [self presentViewController:mainView animated:true completion:nil];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [comicCovers count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //create custom cell
    CustomCollectionCellView *cell = [comicCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    if(cell != nil)
    {
        UIImageView *cellImage = [comicCovers objectAtIndex:indexPath.row];
        cell.collectionCellImage.image = cellImage;
//        CustomCollectionCellView *customCell = [[CustomCollectionCellView alloc] init];
//        
//        cell.collectionCellImage.image = customCell.collectionCellImage.image;
        
        NSLog(@"row=%d", indexPath.row);
        return cell;
        
        NSLog(@"Success!!");
    }
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *detailsView = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
    if(detailsView != nil)
    {
        [self presentViewController:detailsView animated:true completion:nil];
    }
}

@end
