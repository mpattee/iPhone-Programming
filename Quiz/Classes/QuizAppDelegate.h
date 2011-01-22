//
//  QuizAppDelegate.h
//  Quiz
//
//  Created by Mike Pattee on 1/19/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizAppDelegate : NSObject <UIApplicationDelegate> 
	{
	int currentQuestionIndex;
	
	// the model objects
	NSMutableArray *questions;
	NSMutableArray *answers;
	
	// The view objects
	IBOutlet UILabel *questionField;
	IBOutlet UILabel *answerField;
	
    UIWindow *window;
	}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end

