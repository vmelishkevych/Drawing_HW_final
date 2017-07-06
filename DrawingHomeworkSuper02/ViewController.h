//
//  ViewController.h
//  DrawingHomeworkSuper03
//
//  Created by Torris on 3/18/17.
//  Copyright © 2017 Vasiliy Melishkevych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMDrawingView.h"

@class VMDrawingView;



@interface ViewController : UIViewController <VMDrawingViewDelegate>

#pragma mark - Common

- (IBAction)actionOnButtonReset:(id)sender;

@property (weak, nonatomic) IBOutlet VMDrawingView *drawingView;

@property (weak, nonatomic) IBOutlet UISwitch *erasingMode;


@property (weak, nonatomic) IBOutlet UISlider *eraseSize;



#pragma mark - Point

@property (weak, nonatomic) IBOutlet UISwitch *stylePoint;

@property (weak, nonatomic) IBOutlet UISlider *pointColorRed;
@property (weak, nonatomic) IBOutlet UISlider *pointColorGreen;
@property (weak, nonatomic) IBOutlet UISlider *pointColorBlue;
@property (weak, nonatomic) IBOutlet UISlider *pointColorOpacity;

@property (weak, nonatomic) IBOutlet UISlider *pointSize;





#pragma mark - Star

@property (weak, nonatomic) IBOutlet UISwitch *styleStar;

@property (weak, nonatomic) IBOutlet UISlider *starColorRed;

@property (weak, nonatomic) IBOutlet UISlider *starColorGreen;

@property (weak, nonatomic) IBOutlet UISlider *starColorBlue;
@property (weak, nonatomic) IBOutlet UISlider *starColorOpacity;

@property (weak, nonatomic) IBOutlet UISlider *starSize;
@property (weak, nonatomic) IBOutlet UISlider *starAngles;



#pragma mark - Rect

@property (weak, nonatomic) IBOutlet UISwitch *styleRect;

@property (weak, nonatomic) IBOutlet UISlider *rectColorRed;
@property (weak, nonatomic) IBOutlet UISlider *rectColorGreen;
@property (weak, nonatomic) IBOutlet UISlider *rectColorBlue;
@property (weak, nonatomic) IBOutlet UISlider *rectColorOpacity;
@property (weak, nonatomic) IBOutlet UISlider *rectSize;

@property (weak, nonatomic) IBOutlet UISlider *rectAngles;





#pragma mark - Circle

@property (weak, nonatomic) IBOutlet UISwitch *styleCircle;

@property (weak, nonatomic) IBOutlet UISlider *circleColorRed;
@property (weak, nonatomic) IBOutlet UISlider *circleColorGreen;
@property (weak, nonatomic) IBOutlet UISlider *circleColorBlue;
@property (weak, nonatomic) IBOutlet UISlider *circleColorOpacity;
@property (weak, nonatomic) IBOutlet UISlider *circleSize;


@property (weak, nonatomic) IBOutlet UISlider *circleRatio;




#pragma mark - VMDrawingViewDelegate

@property (strong,nonatomic) NSMutableArray* pointsArray;


@end

