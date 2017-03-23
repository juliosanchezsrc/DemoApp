//
//  ISDelegate.m
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.
//

#import "ISDelegate.h"
#import <Supersonic/Supersonic.h>


@interface ISDelegate ()

@property (nonatomic, strong) ViewController *viewController;
@end

@implementation ISDelegate

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
#pragma mark SupersonicISDelegate Functions

// This method gets invoked after a successful initialization of the product.
- (void)supersonicISInitSuccess {
    NSString *appendString = @"SupersonicISInitSuccess \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.loadISButton setEnabled:YES];
    });
    
    
    
}


// This method gets invoked after a failed attempt to initialize Interstitial.
// If it does happen, check out 'error' for more information and consult our
// Knowledge center.
- (void)supersonicISInitFailedWithError:(NSError *)error {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *appendString = @"SupersonicISFailedWithError: \n";
        self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@%@",self.viewController.consoleOutPut.text, appendString,error];
        
    });
    
    
}

- (void)supersonicISReady {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showISButton setEnabled:YES];
        
        NSString *appendString = @"SupersonicISReady \n";
        self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
        
    });
    
}

- (void)supersonicISFailed {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showISButton setEnabled:NO];
        
        NSString *appendString = @"SupersonicISFailed \n";
        self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
        
    });
    
}

- (void)supersonicISAdOpened {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicISOpened \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
}

// The method will be called each time the Interstitial windows has opened successfully.
- (void)supersonicISShowSuccess {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicISShowSuccess \n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
    
}

// This method gets invoked after a failed attempt to load Interstitial.
// If it does happen, check out 'error' for more information and consult our
// Knowledge center.
- (void)supersonicISShowFailWithError:(NSError *)error {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *appendString = @"SupersonicISShowFailedWithError: \n";
        self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@%@",self.viewController.consoleOutPut.text, appendString,error];
        
    });
    
    
    
}

// This method lets you know whether or not there is an ad
// ready to be presented. It is only after this method is invoked
// with 'available' set to 'YES' that you should call 'showIS'.
- (void)supersonicISAdAvailable:(BOOL)available {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showISButton setEnabled:available];
        
        if(available == YES){
            NSString *appendString = @"SupersonicISAdAvailbilty: True \n";
            self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
        }else{
            NSString *appendString = @"SupersonicISAdAvailbilty: False \n";
            self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
        }
        
        
        
    });
    
    
}

// This method will be called each time the user had clicked the Interstitial ad.
- (void)supersonicISAdClicked {
    
    NSString *appendString = @"SupersonicISAdClicked\n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
}

// This method get invoked after the Interstitial window had closed and control
// returns to your application.
- (void)supersonicISAdClosed {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    NSString *appendString = @"SupersonicISAdClosed\n";
    self.viewController.consoleOutPut.text = [NSString stringWithFormat:@"%@%@",self.viewController.consoleOutPut.text, appendString];
    
    
}

@end
