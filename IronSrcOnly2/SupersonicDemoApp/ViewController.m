//
//  ViewController.m
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.

#import "ViewController.h"
#import "RVDelegate.h"
#import "OWdelegate.h"
#import "ISDelegate.h"
#import <Supersonic/SUSupersonicAdsConfiguration.h>
#import <Supersonic/SupersonicIntegrationHelper.h>
#import <QuartzCore/QuartzCore.h>

#define USERID @"demoapp"
#define APPKEY @"437ae1ad"

@interface ViewController ()

@property (nonatomic, strong) id<SupersonicRVDelegate>  rvDelegate;
@property (nonatomic, strong) id<SupersonicOWDelegate>  owDelegate;
@property (nonatomic, strong) id<SupersonicISDelegate>  isDelegate;
@property (nonatomic, weak) IBOutlet UILabel            *versionLabel;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (weak, nonatomic) IBOutlet UIButton *clicktoinit;

@end

@implementation ViewController

#pragma mark -
#pragma mark Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI setup
    self.versionLabel.text = [NSString stringWithFormat:@"sdk version %@",
                              [[Supersonic sharedInstance] getVersion]];
    
    _userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    for (UIButton *button in @[self.showISButton, self.showOWButton, self.showRVButton, self.loadISButton]) {
        button.layer.cornerRadius = 10.0f;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 3.5f;
        button.layer.borderColor = [[UIColor grayColor] CGColor];
        
      
    }
    
    _clicktoinit.layer.cornerRadius = 10.0f;
    _clicktoinit.layer.masksToBounds = YES;
    _clicktoinit.layer.borderWidth = 3.5f;
    _clicktoinit.layer.borderColor = [[UIColor grayColor] CGColor];
    
    //appkey defaults
    NSString *defAppKey = [_userDefaults stringForKey:@"APPKEY_DEFAULT"];
    
    if(defAppKey != nil){
        [_appKeyText setText:defAppKey];
    }
    
    [SUSupersonicAdsConfiguration getConfiguration].useClientSideCallbacks = @(YES);
    
    //Supersonic tracking SDK
    [SupersonicEventsReporting reportAppStarted];
    
    
}



// Scroll down the file to find out what happens when you click a button...

- (IBAction)initButton:(UIButton *)clicktoinit {
    
    
    // Before initializing any of our products (Rewarded video, Offerwall or Interstitial) you must set
    // their delegates. Take a look at these classes and you will see that they each implement a product
    // protocol. This is our way of letting you know what's going on, and if you don't set the delegates
    // we will not be able to communicate with you.
    // We're passing 'self' to our delegates because we want
    // to be able to enable/disable buttons to match ad availability.
    self.rvDelegate = [[RVDelegate alloc] initWithViewController:self];
    self.owDelegate = [[OWdelegate alloc] initWithViewController:self];
    self.isDelegate = [[ISDelegate alloc] initWithViewController:self];
    
    [[Supersonic sharedInstance] setRVDelegate:self.rvDelegate];
    [[Supersonic sharedInstance] setOWDelegate:self.owDelegate];
    [[Supersonic sharedInstance] setISDelegate:self.isDelegate];
    
    //checking defaults for appkey
    NSString *appKeyText = [_appKeyText text];
    [_userDefaults setObject:appKeyText forKey:@"APPKEY_DEFAULT"];
    [_userDefaults synchronize];
    
    //User id
    NSString *userId = [[Supersonic sharedInstance] getAdvertiserId];
    
    if([userId length] == 0){
        //If we couldn't get the advertiser id, we will use a default one.
        userId = USERID;
    }
    
    self.consoleOutPut.text = [NSString stringWithFormat:@"UserID:%@ \n", userId];
    
    //init
    [[Supersonic sharedInstance] initRVWithAppKey:appKeyText withUserId:userId];
    [[Supersonic sharedInstance] initOWWithAppKey:appKeyText withUserId:userId];
    [[Supersonic sharedInstance] initISWithAppKey:appKeyText withUserId:userId];
    
    [SupersonicIntegrationHelper validateIntegration];
      
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)showRVButtonTapped:(id)sender {
    
    // After calling 'setRVDelegate' and 'initRVWithAppKey:withUserId'
    // you are ready to present an ad. You can supply a placement
    // by calling 'showRVWithPlacementName', or you can simply
    // call 'showRV'. In this case the SDK will use the default
    // placement one created for you.
    [[Supersonic sharedInstance] showRV];
}

- (IBAction)showOWButtonTapped:(id)sender {
    
    // This will present the Offerwall. Unlike Rewarded
    // Videos there are no placements.
    [[Supersonic sharedInstance] showOW];
    
}

- (IBAction)showISButtonTapped:(id)sender {
    
    // This will present the Interstitial. Unlike Rewarded
    // Videos there are no placements.
    [[Supersonic sharedInstance] showISWithViewController:self];
    
}

- (IBAction)loadISButtonTapped:(id)sender {
    
    // This will load the Interstitial. Unlike Rewarded
    // Videos there are no placements.
    [[Supersonic sharedInstance] loadIS];
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
