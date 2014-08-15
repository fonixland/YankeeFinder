//
//  FNXStats.h
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FNXStats : NSObject 

@property (nonatomic, copy) NSArray *batting;
@property (nonatomic, copy) NSArray *pitching;

+ (FNXStats *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
