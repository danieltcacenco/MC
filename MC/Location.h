//
//  Location.h
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *title;
@property (readonly) NSString *laboratorTitle;
@property (readonly) NSString *info;
@property (readonly) NSString *image;
@property (readonly) NSString *image2;




@end
