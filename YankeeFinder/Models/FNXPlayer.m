//
//  FNXPlayer.m
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXPlayer.h"

@implementation FNXPlayer

+ (FNXPlayer *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FNXPlayer *instance = [[FNXPlayer alloc] init];
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

    if ([key isEqualToString:@"Bats"]) {
        [self setValue:value forKey:@"bats"];
    } else if ([key isEqualToString:@"BirthCity"]) {
        [self setValue:value forKey:@"birthCity"];
    } else if ([key isEqualToString:@"BirthCountry"]) {
        [self setValue:value forKey:@"birthCountry"];
    } else if ([key isEqualToString:@"BirthDate"]) {
        [self setValue:value forKey:@"birthDate"];
    } else if ([key isEqualToString:@"BirthState"]) {
        [self setValue:value forKey:@"birthState"];
    } else if ([key isEqualToString:@"FirstInitial"]) {
        [self setValue:value forKey:@"firstInitial"];
    } else if ([key isEqualToString:@"FirstName"]) {
        [self setValue:value forKey:@"firstName"];
    } else if ([key isEqualToString:@"FormalName"]) {
        [self setValue:value forKey:@"formalName"];
    } else if ([key isEqualToString:@"FullName"]) {
        [self setValue:value forKey:@"fullName"];
    } else if ([key isEqualToString:@"HeadShotURL"]) {
        [self setValue:value forKey:@"headShotURL"];
    } else if ([key isEqualToString:@"Height"]) {
        [self setValue:value forKey:@"height"];
    } else if ([key isEqualToString:@"IsPitcher"]) {
        [self setValue:value forKey:@"isPitcher"];
    } else if ([key isEqualToString:@"LastInitial"]) {
        [self setValue:value forKey:@"lastInitial"];
    } else if ([key isEqualToString:@"LastName"]) {
        [self setValue:value forKey:@"lastName"];
    } else if ([key isEqualToString:@"MiddleName"]) {
        [self setValue:value forKey:@"middleName"];
    } else if ([key isEqualToString:@"Number"]) {
        [self setValue:value forKey:@"number"];
    } else if ([key isEqualToString:@"PlayerID"]) {
        [self setValue:value forKey:@"playerID"];
    } else if ([key isEqualToString:@"Position"]) {
        [self setValue:value forKey:@"position"];
    } else if ([key isEqualToString:@"TeamID"]) {
        [self setValue:value forKey:@"teamID"];
    } else if ([key isEqualToString:@"Throws"]) {
        [self setValue:value forKey:@"throws"];
    } else if ([key isEqualToString:@"Weight"]) {
        [self setValue:value forKey:@"weight"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.bats) {
        [dictionary setObject:self.bats forKey:@"bats"];
    }

    if (self.birthCity) {
        [dictionary setObject:self.birthCity forKey:@"birthCity"];
    }

    if (self.birthCountry) {
        [dictionary setObject:self.birthCountry forKey:@"birthCountry"];
    }

    if (self.birthDate) {
        [dictionary setObject:self.birthDate forKey:@"birthDate"];
    }

    if (self.birthState) {
        [dictionary setObject:self.birthState forKey:@"birthState"];
    }

    if (self.firstInitial) {
        [dictionary setObject:self.firstInitial forKey:@"firstInitial"];
    }

    if (self.firstName) {
        [dictionary setObject:self.firstName forKey:@"firstName"];
    }

    if (self.formalName) {
        [dictionary setObject:self.formalName forKey:@"formalName"];
    }

    if (self.fullName) {
        [dictionary setObject:self.fullName forKey:@"fullName"];
    }

    if (self.headShotURL) {
        [dictionary setObject:self.headShotURL forKey:@"headShotURL"];
    }

    if (self.height) {
        [dictionary setObject:self.height forKey:@"height"];
    }

    [dictionary setObject:[NSNumber numberWithBool:self.isPitcher] forKey:@"isPitcher"];

    if (self.lastInitial) {
        [dictionary setObject:self.lastInitial forKey:@"lastInitial"];
    }

    if (self.lastName) {
        [dictionary setObject:self.lastName forKey:@"lastName"];
    }

    if (self.middleName) {
        [dictionary setObject:self.middleName forKey:@"middleName"];
    }

    if (self.number) {
        [dictionary setObject:self.number forKey:@"number"];
    }

    if (self.playerID) {
        [dictionary setObject:self.playerID forKey:@"playerID"];
    }

    if (self.position) {
        [dictionary setObject:self.position forKey:@"position"];
    }

    if (self.teamID) {
        [dictionary setObject:self.teamID forKey:@"teamID"];
    }

    if (self.throws) {
        [dictionary setObject:self.throws forKey:@"throws"];
    }

    if (self.weight) {
        [dictionary setObject:self.weight forKey:@"weight"];
    }

    return dictionary;

}

@end
