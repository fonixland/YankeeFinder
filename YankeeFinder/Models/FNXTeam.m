//
//  FNXTeam.m
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXTeam.h"

@implementation FNXTeam

+ (FNXTeam *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FNXTeam *instance = [[FNXTeam alloc] init];
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
    } else if ([key isEqualToString:@"City"]) {
        [self setValue:value forKey:@"city"];
    } else if ([key isEqualToString:@"FullName"]) {
        [self setValue:value forKey:@"fullName"];
    } else if ([key isEqualToString:@"LeagueID"]) {
        [self setValue:value forKey:@"leagueID"];
    } else if ([key isEqualToString:@"Name"]) {
        [self setValue:value forKey:@"name"];
    } else if ([key isEqualToString:@"TeamID"]) {
        [self setValue:value forKey:@"teamID"];
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

    if (self.city) {
        [dictionary setObject:self.city forKey:@"city"];
    }

    if (self.fullName) {
        [dictionary setObject:self.fullName forKey:@"fullName"];
    }

    if (self.leagueID) {
        [dictionary setObject:self.leagueID forKey:@"leagueID"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.teamID) {
        [dictionary setObject:self.teamID forKey:@"teamID"];
    }

    return dictionary;

}

@end
