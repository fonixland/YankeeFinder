//
//  FNXStats.m
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXStats.h"

#import "FNXBatting.h"
#import "FNXPitching.h"

@implementation FNXStats

+ (FNXStats *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FNXStats *instance = [[FNXStats alloc] init];
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

    if ([key isEqualToString:@"Batting"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FNXBatting *populatedMember = [FNXBatting instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.batting = myMembers;

        }

    } else if ([key isEqualToString:@"Pitching"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FNXPitching *populatedMember = [FNXPitching instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.pitching = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"Batting"]) {
        [self setValue:value forKey:@"batting"];
    } else if ([key isEqualToString:@"Pitching"]) {
        [self setValue:value forKey:@"pitching"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.batting) {
        [dictionary setObject:self.batting forKey:@"batting"];
    }

    if (self.pitching) {
        [dictionary setObject:self.pitching forKey:@"pitching"];
    }

    return dictionary;

}

@end
