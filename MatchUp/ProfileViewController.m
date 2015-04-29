//
//  ProfileViewController.m
//  MatchUp
//
//  Created by JETS on 4/6/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "ProfileViewController.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
	// Do any additional setup after loading the view.
    NSUserDefaults* check = [NSUserDefaults standardUserDefaults];
    
    //if( ![savedName isEqualToString:nil ] && ![savedPassword isEqualToString:nil ]) {
    if( [check boolForKey:@"logged"]) {
        NSString * savedName = [check objectForKey:@"name"];
        NSString * savedImage = [check objectForKey:@"image"];
        
        oldName = savedName ;
        name = savedName ;
        image = savedImage ;
        
        self.nameLabel.text = name ;
        if ([image isEqualToString:@""]) {
            self.imageView.image = [UIImage imageNamed:@"apple4.png"];
        } else {
            //self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:image]];
            NSString *workSpacePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"savedImage.png"];
            
            self.imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:workSpacePath]];
            
        }
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]] ;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeImage:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePickerController animated:YES];
}

- (IBAction)editName:(id)sender {
    self.nameTextField.text = self.nameLabel.text;
    [self.nameTextField setHidden:NO];
    [self.nameLabel setHidden:YES];
}

- (IBAction)save:(id)sender {
    NSMutableString* str = [[NSMutableString alloc] initWithString:@"http://10.145.18.57:8084/IOSGameServer/EditUserInfo?oldname="]  ;
    [str appendString:oldName];
    [str appendString:@"&name="];
    if ([[self.nameTextField text] isEqualToString:@""]) {
        [str appendString:[self.nameLabel text]];
    }else {
        [str appendString:[self.nameTextField text]];
    }
    [str appendString:@"&image="];
    //[str appendString:];
    UIImage* newImage = self.imageView.image ;
    NSString *imageStr =[self imageToNSString:newImage];
    //[str appendString: imageStr];
    if (imgPath == nil ) {
        [str appendString: @""];
    } else {
        [str appendString: imgPath];
    }
    /*
    [str appendString:[imageStr substringWithRange:NSMakeRange(0, imageStr.length/4 )]];
    [str appendString:@"&image1="];
    [str appendString:[imageStr substringWithRange:NSMakeRange(imageStr.length/4 , imageStr.length/4 )]];
    [str appendString:@"&image2="];
    [str appendString:[imageStr substringWithRange:NSMakeRange( imageStr.length/2 , imageStr.length/4 )]];
    [str appendString:@"&image3="];
    [str appendString:[imageStr substringWithRange:NSMakeRange(imageStr.length*3/4 , imageStr.length/4 )]];
    */
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
    [connection start];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    self.imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSURL *imagePathUrl = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    imgPath = [imagePathUrl absoluteString];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    UIImage *image = self.imageView.image;
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:savedImagePath atomically:NO];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.asyncResponse = [NSMutableString new];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString* dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [self.asyncResponse appendString:dataStr];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSDictionary* parsedObj = [NSJSONSerialization JSONObjectWithData:[self.asyncResponse dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    NSString* status = [parsedObj valueForKey:@"status"];
    if ([status isEqualToString:@"SUCCESS"]) {
        [self.nameTextField setHidden:YES];
        [self.nameLabel setHidden:NO];
        if ([self.nameTextField.text isEqualToString:@""]) {
            
        } else {
            self.nameLabel.text = self.nameTextField.text;
        }
        
        NSUserDefaults* saving = [NSUserDefaults standardUserDefaults];
        if ([self.nameTextField.text isEqualToString:@""]) {
            [saving setObject:self.nameLabel.text forKey:@"name"];
        } else {
            [saving setObject:self.nameTextField.text forKey:@"name"];
        }
        
        [saving setObject:imgPath forKey:@"image"];
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your profile data has been updeted!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
        
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Fail!" message:@"Updating failed, choose another name!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", @"Try Again" , nil];
        [alert show];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==1) {
        [self.nameTextField setText:@""];
    }
    
}

-(NSString *)imageToNSString:(UIImage *)image
{
    NSData *imageData = UIImagePNGRepresentation(image);
    //return [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    //return [imageData base64EncodedStringWithOptions:kNilOptions];
    if ([imageData respondsToSelector:@selector(base64EncodedStringWithOptions:)]) {
        return [imageData base64EncodedStringWithOptions:kNilOptions];  // iOS 7+
    } else {
        return [imageData base64Encoding];                              // pre iOS7
    }
}

-(UIImage *)stringToUIImage:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string
                                                      options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
}
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

/*
 CGDataProviderRef provider = CGImageGetDataProvider(newImage.CGImage);
 NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
 const uint8_t* bytes = [data bytes];
 NSString* imageString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
 
 
 NSData *imageData = [UIImagePNGRepresentation(self.imageView.image) base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
 //NSString* imageString = [[NSString alloc] initWithData: [imageData base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength ] encoding:NSDataBase64Encoding64CharacterLineLength];
 NSString* imageString = [NSString stringWithUTF8String:imageData ] ;
 //NSString* imageString = [imageData base64Encoding] ;
 */

@end
