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
#import "CustomCollectionCellView.h"

#define BACKBTN 0
#define SAVEBTN 1
#define VIEW_ALBUM_BTN 2
#define CAPTURE_BTN 3

@interface AddComicViewController ()

@end

@implementation AddComicViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    scrollView.contentSize = CGSizeMake(295.0f, 700.0f);
    
    [super viewWillAppear:true];
}
- (void)viewDidLoad
{    
    comicTitle.delegate = self;
    issueNumber.delegate = self;
    publisher.delegate = self;
    releaseYear.delegate = self;
    
    //Close keyboard when clicked off UITextField
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

//closes keyboard
-(void)closeKeyboard {
    [comicTitle resignFirstResponder];
    [issueNumber resignFirstResponder];
    [publisher resignFirstResponder];
    [releaseYear resignFirstResponder];
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
        NSLog(@"comic title: %@", comicTitle.text);
//        if(delegate != nil)
//        {
            [delegate DidSave:comicTitle.text number:issueNumber.text pub:publisher.text year:releaseYear.text];
//        }
        NSLog(@"comic title: %@", comicTitle.text);
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
    if(button.tag == VIEW_ALBUM_BTN)
    {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        if(pickerController != nil)
        {
            pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerController.delegate = self;
            pickerController.allowsEditing = false;
            [self presentViewController:pickerController animated:true completion:nil];
        }
    }
    if(button.tag == CAPTURE_BTN)
    {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        if(pickerController != nil)
        {
            pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            pickerController.delegate = self;
            pickerController.allowsEditing = false;
            [self presentViewController:pickerController animated:true completion:nil];
        }
    }
}
//user selected an image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", [info description]);
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if(selectedImage != nil)
    {
        //CustomCollectionCellView *customCell = [[CustomCollectionCellView alloc] init];
        imageView.image = selectedImage;
    }
    
    UIImageWriteToSavedPhotosAlbum(selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [picker dismissViewControllerAnimated:true completion:nil];
}

-(void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if (error != nil)
    {
        NSLog(@"%@", [error description]);
    }
    else
    {
        NSLog(@"Save successfull!");
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:true completion:nil];
}

@end
