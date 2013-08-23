//
//  AddComicViewController.h
//  LongboxApp
//
//  Created by Courtney Ardis on 8/12/13.
//  Copyright (c) 2013 Courtney Ardis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddViewDelegate <NSObject>
@required
-(void)DidSave:(NSString*)comicTitle number:(NSString*)issueNumber pub:(NSString*)publisher year:(NSString*)releaseYear;
@end

@interface AddComicViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate>
{
    IBOutlet UIView *addView;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *comicTitle;
    IBOutlet UITextField *issueNumber;
    IBOutlet UITextField *publisher;
    IBOutlet UITextField *releaseYear;
    id<AddViewDelegate> delegate;
    
    IBOutlet UIButton *viewAlbumBtn;
    IBOutlet UIButton *captureBtn;
    IBOutlet UIImageView *imageView;
}

-(IBAction)onClick:(id)sender;
-(void)closeKeyboard;

@property (strong) id<AddViewDelegate> delegate;
@end
