//
//  RVDelegate.h
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Supersonic/Supersonic.h>
#import "ViewController.h"

@interface RVDelegate : UIViewController <SupersonicRVDelegate>

- (instancetype)initWithViewController:(ViewController *)viewController;

@end
