//
//  ViewController.m
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "AddComicViewController.h"

#define ADDCOMIC 0
#define VIEWCOLLECTION 1

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = sender;
    if(button.tag == ADDCOMIC)
    {
        AddComicViewController *addView = [[AddComicViewController alloc] initWithNibName:@"AddComicViewController" bundle:nil];
        if(addView != nil)
        {
            [self presentViewController:addView animated:true completion:nil];
        }
    }
    if(button.tag == VIEWCOLLECTION)
    {
        CollectionViewController *collectView = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];
        if(collectView != nil)
        {
            [self presentViewController:collectView animated:true completion:nil];
        }
    }
}

@end
