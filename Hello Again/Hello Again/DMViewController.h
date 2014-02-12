//
//  DMViewController.h
//  Hello Again
//
//  Created by David McLaren on 2/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

- (IBAction)buttonPressed:(id)sender;

@end
