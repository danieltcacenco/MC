//
//  MetodaSubstitutiei.m
//  MC
//
//  Created by Tcacenco Daniel on 4/26/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "MetodaSubstitutiei.h"

@implementation MetodaSubstitutiei
@synthesize secondText;

-(NSString *)getCryptForText:simpleText{
    long length;
    unichar *buf;
    unsigned i;
    
    length = [simpleText length];
    buf = malloc( (length + 1) * sizeof(unichar) );
    [simpleText getCharacters:buf];
    buf[length] = (unichar)0;
    for (i = 0; i < length; i++) {
        if (buf[i] >= (unichar)'a' && buf[i] <= (unichar) 'z') {
            buf[i] += 13;
            if (buf[i] > 'z') buf[i] -= 26;
        } else if (buf[i] >= (unichar)'A' && buf[i] <= (unichar) 'Z') {
            buf[i] += 13;
            if (buf[i] > 'Z') buf[i] -= 26;
        }
    }
    secondText = [NSString stringWithCharacters:buf length:length];
    free(buf);
    return secondText;
}

@end
