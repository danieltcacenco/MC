//
//  Cifruri.h
//  MC
//
//  Created by Tcacenco Daniel on 4/26/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cifruri : NSObject

@property (nonatomic) NSString *simpleText;
@property (nonatomic) NSString *secondText;

-(NSString *)getCryptForText:simpleText;

@end
