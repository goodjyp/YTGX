//
//  AppDelegate.h
//  YTShared
//
//  Created by ypj on 2017/5/31.
//  Copyright © 2017年 ypj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import <UserNotifications/UserNotifications.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property float autoSizeScaleX;
@property float autoSizeScaleY;

@end

