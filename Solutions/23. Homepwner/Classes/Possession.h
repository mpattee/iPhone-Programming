//
//  Possession.h
//  RandomPossessions
//
//  Created by bhardy on 7/29/09.
//  Copyright 2009 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Possession : NSObject <NSCoding> {
	NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;
	NSString *imageKey;
	UIImage *thumbnail;
    NSString *inheritorName, *inheritorNumber; 
} 
@property (nonatomic, copy) NSString *inheritorName; 
@property (nonatomic, copy) NSString *inheritorNumber;
@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (readonly) NSDate *dateCreated;
@property (nonatomic, copy) NSString *imageKey;
@property (readonly, retain) UIImage *thumbnail;

- (void)setThumbnailFromImage:(UIImage *)image;

+ (id)randomPossession;

- (id)initWithPossessionName:(NSString *)name 
							valueInDollars:(int)value
								serialNumber:(NSString *)sNumber;

- (id)initWithPossessionName:(NSString *)name;

@end
