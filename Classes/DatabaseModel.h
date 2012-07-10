//
//  DatabaseModel.h
//  LearningWords
//
//  Created by Papp Laszlo on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseModel : NSObject {
    NSString  *tableName;
}

+(BOOL) open:(NSString*) path;
+(void) close;

+(id) database;

@end
