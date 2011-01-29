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
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
	}

- (id)init
	{
	[super init];
	dictionary = [[NSMutableArray alloc] init];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
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
	
- (void)clearCache:(NSNotification *)notification
	{
	NSLog(@"flushing %d images out of the cache", [dictionary count]);
	[dictionary removeAllObjects];
	}


- (void)setImage:(UIImage *)inImage forKey:(NSString *)inKey
	{
	[dictionary setObject:inImage forKey:inKey];
	
	// Create full path for image
	NSString *imagePath = pathInDocumentDirectory(inKey);
	
	// Turn image into JPEG data
	NSData *data = UIImageJPEGRepresentation(inImage, 0.5);
	
	// Write it to full path
	[data writeToFile:imagePath atomically:YES];
	}

- (UIImage *)imageForKey:(NSString *)inKey
	{
	// If Possible get it from the dictionary
	UIImage *result = [dictionary objectForKey:inKey];
	
	if (!result)
		{
		// create UIImage object from file
		result = [UIImage imageWithContentsOfFile:pathInDocumentDirectory(inKey)];
		// If we found an image on the file system, place it into the cache
		if (result) 
			{
			[dictionary setObject:result forKey:inKey];
			}
		else 
			{
			NSLog(@"Error : unable to find %@", pathInDocumentDirectory(inKey));
			}
	}
	return result;
	}

- (void)deleteImageForKey:(NSString *)inKey
	{
	[dictionary removeObjectForKey:inKey];
	NSString *path = pathInDocumentDirectory(inKey);
	[[NSFileManager defaultManager] removeItemAtPath:path error:nil];
	}

@end
