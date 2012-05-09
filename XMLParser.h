//
//  XMLParser.h
//  TaiPing
//
//  Created by Tian Neo <neutyz@gmail.com> on 11-11-25.
//  Copyright 2011 bbdtek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject
+ (XMLParser *)sharedInstance;
- (NSArray *)decodeXML:(NSString *)xml;
- (NSString *)encodeXML:(id)object;
@end
