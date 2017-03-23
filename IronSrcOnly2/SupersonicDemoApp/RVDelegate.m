//
//  RVDelegate.m
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.
//

#import "RVDelegate.h"

@interface RVDelegate ()
@property (nonatomic, strong) ViewController            *viewController;
@property (nonatomic, strong) SupersonicPlacementInfo   *placementInfo;
@end

@implementation RVDelegate

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithViewController:(ViewController *)viewController {
    self = [super init];
    
    if (self) {
        _viewController = viewController;
    }
    
    return self;
}

#pragma mark -
#pragma mark SupersonicRVDelegate Functions

// This method is invoked after a successful initialization with Supersonic's servers
// It does not mean that there is a video ready to be presented, but it does mean
// that our SDK has all the information it needs.
- (void)supersonicRVInitSuccess {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicRVInitSuccess\n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
}

// This method is invoked if initialization failed, in which
// case check out 'error'.
- (void)supersonicRVInitFailedWithError:(NSError *)error {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *appendString = @"SupersonicRVInitFailedWithError: %@ \n";
        self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@%@",self.viewController.consoleOutPut.text, appendString,error];
        
    });
}

// This method lets you know whether or not there is a video
// ready to be presented. It is only after this method is invoked
// with 'hasAvailableAds' set to 'YES' that you can should 'showRV'.
- (void)supersonicRVAdAvailabilityChanged:(BOOL)hasAvailableAds {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showRVButton setEnabled:hasAvailableAds];
        
        if(hasAvailableAds == YES){
            NSString *appendString = @"SupersonicRVAdAvailbilty: True \n";
            self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
        }
        else{
            NSString *appendString = @"SupersonicRVAdAvailbilty: False \n";
            self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
        }
        
        
    });
}

// This method gets invoked after the user has been rewarded.
- (void)supersonicRVAdRewarded:(SupersonicPlacementInfo*)placementInfo {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.placementInfo = placementInfo;
    
    NSString *appendString = @"SupersonicRVAdRewarded, \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@%@",self.viewController.consoleOutPut.text, appendString, placementInfo];
    
    
    
    
}

// This method gets invoked when there is a problem playing the video.
// If it does happen, check out 'error' for more information and consult
// our knowledge center for help.
- (void)supersonicRVAdFailedWithError:(NSError *)error {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *appendString = @"SupersonicRVAdFailedWithError: \n";
        self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@%@",self.viewController.consoleOutPut.text, appendString,error];
        
    });
    
}

// This method gets invoked when we take control, but before
// the video has started playing.
- (void)supersonicRVAdOpened {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicRVAdOpended \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
}

// This method gets invoked when we return controlback to your hands.
// We chose to notify you about rewards here and not in 'supersonicRVAdRewarded'.
// This is because reward can occur in the middle of the video.
- (void)supersonicRVAdClosed {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicRVAdClosed \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
    if (self.placementInfo) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Video Reward"
                                                        message:[NSString stringWithFormat:@"You have been rewarded %d %@", [self.placementInfo.rewardAmount intValue], self.placementInfo.rewardName]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        self.placementInfo = nil;
    }
    
    
    
}

// This method gets invoked when the video has started playing.
- (void)supersonicRVAdStarted {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicRVAdStarted \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
}

// This method gets invoked when the video has stopped playing.
- (void)supersonicRVAdEnded {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicRVAdEnded \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
}

@end
