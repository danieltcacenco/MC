//
//  Location.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "Location.h"

@implementation Location

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _title = [jsonDictionary objectForKey:@"title"];
        _laboratorTitle = [jsonDictionary objectForKey:@"laboratorTitle"];
        _info = [jsonDictionary objectForKey:@"info"];
        _image = [jsonDictionary objectForKey:@"imagine"];
        _image2 = [jsonDictionary objectForKey:@"imagine2"];
        //[_title setValue:[jsonDictionary objectForKey:@"title"] forKey:@"name"];
        
        
    }
    
    return self;
}

@end
