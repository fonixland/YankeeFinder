//
//  FNXBatting.m
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXBatting.h"

#import "FNXBattingLevel.h"
#import "FNXBattingTeam.h"

@implementation FNXBatting


+ (FNXBatting *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FNXBatting *instance = [[FNXBatting alloc] init];
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

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"Level"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.level = [FNXBattingLevel instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"Team"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.team = [FNXBattingTeam instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"AB"]) {
        [self setValue:value forKey:@"aB"];
    } else if ([key isEqualToString:@"B1"]) {
        [self setValue:value forKey:@"b1"];
    } else if ([key isEqualToString:@"B2"]) {
        [self setValue:value forKey:@"b2"];
    } else if ([key isEqualToString:@"B3"]) {
        [self setValue:value forKey:@"b3"];
    } else if ([key isEqualToString:@"CI"]) {
        [self setValue:value forKey:@"cI"];
    } else if ([key isEqualToString:@"CS"]) {
        [self setValue:value forKey:@"cS"];
    } else if ([key isEqualToString:@"HBP"]) {
        [self setValue:value forKey:@"hBP"];
    } else if ([key isEqualToString:@"HR"]) {
        [self setValue:value forKey:@"hR"];
    } else if ([key isEqualToString:@"IBB"]) {
        [self setValue:value forKey:@"iBB"];
    } else if ([key isEqualToString:@"Level"]) {
        [self setValue:value forKey:@"level"];
    } else if ([key isEqualToString:@"LevelID"]) {
        [self setValue:value forKey:@"levelID"];
    } else if ([key isEqualToString:@"PA"]) {
        [self setValue:value forKey:@"pA"];
    } else if ([key isEqualToString:@"PlayerID"]) {
        [self setValue:value forKey:@"playerID"];
    } else if ([key isEqualToString:@"RBI"]) {
        [self setValue:value forKey:@"rBI"];
    } else if ([key isEqualToString:@"SB"]) {
        [self setValue:value forKey:@"sB"];
    } else if ([key isEqualToString:@"SF"]) {
        [self setValue:value forKey:@"sF"];
    } else if ([key isEqualToString:@"SH"]) {
        [self setValue:value forKey:@"sH"];
    } else if ([key isEqualToString:@"SO"]) {
        [self setValue:value forKey:@"sO"];
    } else if ([key isEqualToString:@"Team"]) {
        [self setValue:value forKey:@"team"];
    } else if ([key isEqualToString:@"TeamID"]) {
        [self setValue:value forKey:@"teamID"];
    } else if ([key isEqualToString:@"UBB"]) {
        [self setValue:value forKey:@"uBB"];
    } else if ([key isEqualToString:@"YearID"]) {
        [self setValue:value forKey:@"yearID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.aB) {
        [dictionary setObject:self.aB forKey:@"aB"];
    }

    if (self.b1) {
        [dictionary setObject:self.b1 forKey:@"b1"];
    }

    if (self.b2) {
        [dictionary setObject:self.b2 forKey:@"b2"];
    }

    if (self.b3) {
        [dictionary setObject:self.b3 forKey:@"b3"];
    }

    if (self.cI) {
        [dictionary setObject:self.cI forKey:@"cI"];
    }

    if (self.cS) {
        [dictionary setObject:self.cS forKey:@"cS"];
    }

    if (self.g) {
        [dictionary setObject:self.g forKey:@"g"];
    }

    if (self.hBP) {
        [dictionary setObject:self.hBP forKey:@"hBP"];
    }

    if (self.hR) {
        [dictionary setObject:self.hR forKey:@"hR"];
    }

    if (self.iBB) {
        [dictionary setObject:self.iBB forKey:@"iBB"];
    }

    if (self.level) {
        [dictionary setObject:self.level forKey:@"level"];
    }

    if (self.levelID) {
        [dictionary setObject:self.levelID forKey:@"levelID"];
    }

    if (self.pA) {
        [dictionary setObject:self.pA forKey:@"pA"];
    }

    if (self.playerID) {
        [dictionary setObject:self.playerID forKey:@"playerID"];
    }

    if (self.r) {
        [dictionary setObject:self.r forKey:@"r"];
    }

    if (self.rBI) {
        [dictionary setObject:self.rBI forKey:@"rBI"];
    }

    if (self.sB) {
        [dictionary setObject:self.sB forKey:@"sB"];
    }

    if (self.sF) {
        [dictionary setObject:self.sF forKey:@"sF"];
    }

    if (self.sH) {
        [dictionary setObject:self.sH forKey:@"sH"];
    }

    if (self.sO) {
        [dictionary setObject:self.sO forKey:@"sO"];
    }

    if (self.team) {
        [dictionary setObject:self.team forKey:@"team"];
    }

    if (self.teamID) {
        [dictionary setObject:self.teamID forKey:@"teamID"];
    }

    if (self.uBB) {
        [dictionary setObject:self.uBB forKey:@"uBB"];
    }

    if (self.yearID) {
        [dictionary setObject:self.yearID forKey:@"yearID"];
    }

    return dictionary;

}

@end
