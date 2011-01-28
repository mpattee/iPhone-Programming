//
//  ImageCache.m
//  Homepwner
//
//  Created by Mike Pattee on 1/26/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import "ImageCache.h"

static ImageCache *sharedImageCache;

@implementation ImageCache

- (void)dealloc
	{
	[dictionary release];
	[super dealloc];
	}

- (id)init
	{
	[super init];
	dictionary = [[NSMutableArray alloc] init];
	return self;
	}
	
+ (ImageCache *)sharedImageCache
	{
	if (!sharedImageCache) 
		{
		sharedImageCache = [[ImageCache alloc] init];
		}
	return sharedImageCache;
	}
	
+ (id)allocWithZone:(NSZone *)zone
	{
	if (!sharedImageCache) 
		{
		sharedImageCache = [super allocWithZone:zone];
		return sharedImageCache;
		}
	else 
		{
		return nil;
		}
	}
	
- (id)copyWithZone:(NSZone *)zone
	{
	return self;
	}
	
- (void)release
	{
	// no op
	}


- (void)setImage:(UIImage *)inImage forKey:(NSString *)inKey
	{
	[dictionary setObject:inImage forKey:inKey];
	}

- (UIImage *)imageForKey:(NSString *)inKey
	{
	return [dictionary objectForKey:inKey];
	}

- (void)deleteImageForKey:(NSString *)inKey
	{
	[dictionary removeObjectForKey:inKey];
	}

@end
