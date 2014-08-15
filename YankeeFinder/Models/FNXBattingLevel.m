//
//  FNXBattingLevel.m
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXBattingLevel.h"

@implementation FNXBattingLevel

+ (FNXBattingLevel *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FNXBattingLevel *instance = [[FNXBattingLevel alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"Abbr"]) {
        [self setValue:value forKey:@"abbr"];
    } else if ([key isEqualToString:@"LevelID"]) {
        [self setValue:value forKey:@"levelID"];
    } else if ([key isEqualToString:@"Name"]) {
        [self setValue:value forKey:@"name"];
    } else if ([key isEqualToString:@"SortOrder"]) {
        [self setValue:value forKey:@"sortOrder"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.abbr) {
        [dictionary setObject:self.abbr forKey:@"abbr"];
    }

    if (self.levelID) {
        [dictionary setObject:self.levelID forKey:@"levelID"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.sortOrder) {
        [dictionary setObject:self.sortOrder forKey:@"sortOrder"];
    }

    return dictionary;

}

@end
