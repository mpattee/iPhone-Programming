//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by Mike Pattee on 1/26/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;

@interface ItemDetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
	{
	IBOutlet UIImageView *imageView;
	IBOutlet UITextField *nameField;
	IBOutlet UITextField *serialNumberField;
	IBOutlet UITextField *valueField;
	IBOutlet UILabel *dateLabel;
	}

@property (readwrite, nonatomic, assign) Possession *editingPossession;

@end
