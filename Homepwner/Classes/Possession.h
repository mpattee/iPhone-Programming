 //
//  Possession.h
//  RandomPossessions
//
//  Created by Mike Pattee on 1/19/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Possession : NSObject <NSCoding>
	{
	NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;
	NSString *imageKey;
	}
	
@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;
@property (readwrite, nonatomic, retain) NSString *imageKey;

+ (id)randomPossession;

- (id)initWithPossessionName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
- (id)initWithPossessionName:(NSString *)name;

@end
