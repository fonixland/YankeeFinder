//
//  FNXRequest.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FNXRequestCallback)(NSData * response, NSError * error);

/**
 *  Request class used by CSRequestController; Not to be accessed directly.
 */
@interface FNXRequest : NSObject

-(void)sendAsyncRequest:(NSMutableURLRequest *)theRequest withCallback:(FNXRequestCallback)callback;

@end