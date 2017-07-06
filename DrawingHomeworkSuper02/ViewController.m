//
//  ViewController.m
//  DrawingHomeworkSuper03
//
//  Created by Torris on 3/18/17.
//  Copyright © 2017 Vasiliy Melishkevych. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Views

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.drawingView.delegate = self;
    
    self.pointsArray = [NSMutableArray array];

    
    UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];

    longPressGesture.numberOfTouchesRequired = 1;
    longPressGesture.minimumPressDuration = 0.01f;
    longPressGesture.allowableMovement = 100;

    
    [self.drawingView addGestureRecognizer:longPressGesture];

    
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.drawingView setNeedsDisplay];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  - Gestures

- (void) handlePanGesture:(UIPanGestureRecognizer*) panGesture {
    
    CGPoint coordOnDrawingView = [panGesture locationInView:self.drawingView];

    
    UIView* view = [self.drawingView hitTest:coordOnDrawingView withEvent:nil];
    
    if ([view isEqual:self.drawingView]) {
        
        
        NSDictionary* parametersOfCoord = @{
                                            
                                            
                                            @"currentCoord":NSStringFromCGPoint(coordOnDrawingView),
                                            
                                            @"erasingMode":[NSNumber numberWithBool:self.erasingMode.on],
                                            
                                            @"eraseSize":[NSNumber numberWithFloat:self.eraseSize.value],
                                            
                                            
                                            @"stylePoint":[NSNumber numberWithBool:self.stylePoint.on],
                                            
                                            @"pointColor":[UIColor colorWithRed:self.pointColorRed.value
                                                                          green:self.pointColorGreen.value
                                                                           blue:self.pointColorBlue.value
                                                                          alpha:self.pointColorOpacity.value],
                                            
                                            @"pointSize":[NSNumber numberWithFloat:self.pointSize.value],
                                            
                                            
                                            
                                            
                                            @"styleStar":[NSNumber numberWithBool:self.styleStar.on],
                                    
                                            @"starColor":[UIColor colorWithRed:self.starColorRed.value
                                                                          green:self.starColorGreen.value
                                                                           blue:self.starColorBlue.value
                                                                          alpha:self.starColorOpacity.value],
                                            
                                            @"starSize":[NSNumber numberWithFloat:self.starSize.value],
                                           
                                            @"starAngles":[NSNumber numberWithFloat:self.starAngles.value],
                                            
                                            
                                            
                                            
                                            
                                            @"styleRect":[NSNumber numberWithBool:self.styleRect.on],
                                            
                                            @"rectColor":[UIColor colorWithRed:self.rectColorRed.value
                                                                         green:self.rectColorGreen.value
                                                                          blue:self.rectColorBlue.value
                                                                         alpha:self.rectColorOpacity.value],
                                            
                                            @"rectSize":[NSNumber numberWithFloat:self.rectSize.value],
                                            
                                            @"rectAngles":[NSNumber numberWithFloat:self.rectAngles.value],
                                            
                                            
                                            
                                            

                                            @"styleCircle":[NSNumber numberWithBool:self.styleCircle.on],
                                            
                                            @"circleColor":[UIColor colorWithRed:self.circleColorRed.value
                                                                         green:self.circleColorGreen.value
                                                                          blue:self.circleColorBlue.value
                                                                         alpha:self.circleColorOpacity.value],
                                            
                                            @"circleSize":[NSNumber numberWithFloat:self.circleSize.value],

                                            @"circleRatio":[NSNumber numberWithFloat:self.circleRatio.value]
                                            
                                            
                                            };
 
        [self.pointsArray addObject:parametersOfCoord];
        
        [self.drawingView setNeedsDisplay];

        
    }
 
}

#pragma mark - Outlets actions

- (IBAction)actionOnButtonReset:(id)sender {
    
    [self.pointsArray removeAllObjects];
    
    [self.drawingView setNeedsDisplay];
}


@end
