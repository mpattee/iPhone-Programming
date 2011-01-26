 //
//  Possession.h
//  RandomPossessions
//
//  Created by Mike Pattee on 1/19/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Possession : NSObject 
	{
	NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;
	}
	
@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

+ (id)randomPossession;

- (id)initWithPossessionName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
- (id)initWithPossessionName:(NSString *)name;

@end
