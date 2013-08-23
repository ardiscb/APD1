//
//  DetailsViewController.h
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddComicViewController.h"

@interface DetailsViewController : UIViewController <AddViewDelegate, UITextViewDelegate>
{
    IBOutlet UITextView *comicDetails;
}

-(IBAction)onClick:(id)sender;

@end
