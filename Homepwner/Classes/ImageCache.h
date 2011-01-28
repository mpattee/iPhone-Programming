//
//  ImageCache.h
//  Homepwner
//
//  Created by Mike Pattee on 1/26/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageCache : NSObject 
	{
	NSMutableDictionary *dictionary;
	}

+ (ImageCache *)sharedImageCache;
- (void)setImage:(UIImage *)inImage forKey:(NSString *)inKey;
- (UIImage *)imageForKey:(NSString *)inKey;
- (void)deleteImageForKey:(NSString *)inKey;

@end
