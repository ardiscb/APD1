//
//  DetailsViewController.m
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import "DetailsViewController.h"
#import "CollectionViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

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
    CollectionViewController *collectView = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];
    if(collectView != nil)
    {
        [self presentViewController:collectView animated:true completion:nil];
    }
}

@end
