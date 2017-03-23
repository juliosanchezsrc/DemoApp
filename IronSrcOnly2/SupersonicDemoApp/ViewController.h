//
//  ViewController.h
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController;


@property (weak, nonatomic) IBOutlet UIButton *showRVButton;
@property (weak, nonatomic) IBOutlet UIButton *showOWButton;
@property (weak, nonatomic) IBOutlet UIButton *showISButton;
@property (weak, nonatomic) IBOutlet UIButton *loadISButton;
@property (nonatomic, retain) IBOutlet UITextField *appKeyText;
@property (weak, nonatomic) IBOutlet UITextView *consoleOutPut;


@end
