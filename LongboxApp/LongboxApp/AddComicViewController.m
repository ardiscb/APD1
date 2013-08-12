//
//  AddComicViewController.m
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import "AddComicViewController.h"
#import "CollectionViewController.h"
#import "ViewController.h"

#define BACKBTN 0
#define SAVEBTN 1

@interface AddComicViewController ()

@end

@implementation AddComicViewController

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
    UIButton *button = sender;
    if(button.tag == BACKBTN)
    {
        ViewController *main = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        if(main != nil)
        {
            [self presentViewController:main animated:true completion:nil];
        }
    }
    if(button.tag == SAVEBTN)
    {
        UIAlertView *saveAlert = [[UIAlertView alloc] initWithTitle:@"Comic Saved!" message:@"Your comic information has been saved to your collection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if(saveAlert != nil)
        {
            [saveAlert show];
        }
        
        CollectionViewController *collectView = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];
        if(collectView != nil)
        {
            [self presentViewController:collectView animated:true completion:nil];
        }
    }
}

@end
