//
//  VMDrawingView.m
//  DrawingHomeworkSuper03
//
//  Created by Torris on 3/18/17.
//  Copyright © 2017 Vasiliy Melishkevych. All rights reserved.
//

#import "VMDrawingView.h"

@implementation VMDrawingView


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    for (NSDictionary* parametersOfCoord in self.delegate.pointsArray) {

        
        CGPoint currentCoord = CGPointFromString([parametersOfCoord objectForKey:@"currentCoord"]);
        
        NSNumber* erasingMode = [parametersOfCoord objectForKey:@"erasingMode"];
        BOOL erasingModeBool = [erasingMode boolValue];
        
        NSNumber* eraseSize = [parametersOfCoord objectForKey:@"eraseSize"];
        NSInteger eraseSizeInt = (NSInteger)[eraseSize floatValue];


        if (erasingModeBool) {
            
            [self onErasing:context inPoint:currentCoord withSize:eraseSizeInt];
            
        } else {
        
        NSNumber* stylePoint = [parametersOfCoord objectForKey:@"stylePoint"];
            BOOL stylePointBool = [stylePoint boolValue];
        
            if (stylePointBool) {
                
                UIColor* pointColor =  [parametersOfCoord objectForKey:@"pointColor"];
                
                NSNumber* pointSize = [parametersOfCoord objectForKey:@"pointSize"];
                NSInteger pointSizeInt = (NSInteger)[pointSize floatValue];
                
                [self onPointStyle:context inPoint:currentCoord withSize:pointSizeInt withColor:pointColor];

            }
            

        NSNumber* styleStar = [parametersOfCoord objectForKey:@"styleStar"];
        BOOL styleStarBool = [styleStar boolValue];
        
            if (styleStarBool) {
                
                UIColor* starColor =  [parametersOfCoord objectForKey:@"starColor"];
                
                NSNumber* starSize = [parametersOfCoord objectForKey:@"starSize"];
                NSInteger starSizeInt = (NSInteger)[starSize floatValue];
                
                NSNumber* starAngles = [parametersOfCoord objectForKey:@"starAngles"];
                NSInteger starAnglesInt = (NSInteger)[starAngles floatValue];
                
                if (starAnglesInt %2 != 1) {
                    
                    starAnglesInt++;
                };
                
                [self onStarStyle:context inPoint:currentCoord withSize:starSizeInt withColor:starColor withAngles:starAnglesInt];
                
            }

        NSNumber* styleRect = [parametersOfCoord objectForKey:@"styleRect"];
        BOOL styleRectBool = [styleRect boolValue];

            if (styleRectBool) {
                
                
                UIColor* rectColor =  [parametersOfCoord objectForKey:@"rectColor"];
                
                NSNumber* rectSize = [parametersOfCoord objectForKey:@"rectSize"];
                NSInteger rectSizeInt = (NSInteger)[rectSize floatValue];
                
                NSNumber* rectAngles = [parametersOfCoord objectForKey:@"rectAngles"];
                NSInteger rectAnglesInt = (NSInteger)[rectAngles floatValue];
                
                if (rectAnglesInt > 4 && rectAnglesInt %2 != 0) {
                    
                    rectAnglesInt++;

                };
                
                if (rectAnglesInt == 4) {
                    
                    [self onRectStyle:context inPoint:currentCoord withSize:rectSizeInt withColor:rectColor];

                } else {
                 
                    [self onStarStyle:context inPoint:currentCoord withSize:rectSizeInt withColor:rectColor withAngles:rectAnglesInt * 2];
                    
                }
            }
            
        
        NSNumber* styleCircle = [parametersOfCoord objectForKey:@"styleCircle"];
        BOOL styleCircleBool = [styleCircle boolValue];

            if (styleCircleBool) {
                
                UIColor* circleColor =  [parametersOfCoord objectForKey:@"circleColor"];
                
                NSNumber* circleSize = [parametersOfCoord objectForKey:@"circleSize"];
                NSInteger circleSizeInt = (NSInteger)[circleSize floatValue];
                
                NSNumber* circleRatio = [parametersOfCoord objectForKey:@"circleRatio"];
                CGFloat circleRatioInt = [circleRatio floatValue] / 10.f;
                
                [self onCircleStyle:context inPoint:currentCoord withSize:circleSizeInt withColor:circleColor withRatio:circleRatioInt];

            }
        }
        
    }
    
}

#pragma mark - Help methods

- (void) onErasing:(CGContextRef) context inPoint:(CGPoint) point withSize:(NSInteger) size {
    
    CGContextAddArc(context, point.x, point.y, size, 0, 2*M_PI, NO);

    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillPath(context);
    
}

- (void) onPointStyle:(CGContextRef) context inPoint:(CGPoint) point withSize:(NSInteger) size withColor:(UIColor*) color {
    
    CGContextAddArc(context, point.x, point.y, size, 0, 2*M_PI, NO);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    
}


- (void) onStarStyle:(CGContextRef) context  inPoint:(CGPoint) point withSize:(NSInteger) size withColor:(UIColor*) color withAngles:(NSInteger) angles {

    CGRect square =  CGRectMake(point.x - size / 2,
                                point.y - size / 2,
                                size,
                                size);
    
    square = CGRectIntegral(square);
    
    
    NSInteger radiusStar = (NSInteger)CGRectGetWidth(square) / 2;
    
    
    CGFloat originAngle  = - M_PI / 2;
    
    CGFloat rotationAngle  = M_PI * 4 / angles;
    
    // drawing star:
    
    
        for (int i = 0; i <= angles; i++) {
            
            
            NSInteger rotationX = (NSInteger)(CGRectGetMidX(square) + radiusStar * cos(originAngle + rotationAngle * i));
            NSInteger rotationY = (NSInteger)(CGRectGetMidY(square) + radiusStar * sin(originAngle + rotationAngle * i));
            
            (i == 0) ? CGContextMoveToPoint(context, rotationX, rotationY) : CGContextAddLineToPoint(context, rotationX, rotationY);
            
        }
    
        CGContextSetLineWidth(context, 1.f);
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextStrokePath(context);
    
}

- (void) onRectStyle:(CGContextRef) context  inPoint:(CGPoint) point withSize:(NSInteger) size withColor:(UIColor*) color {
    
    CGRect square =  CGRectMake(point.x - size / 2,
                                point.y - size / 2,
                                size,
                                size);
    
    square = CGRectIntegral(square);
    
    CGContextAddRect(context, square);
    
    CGContextSetLineWidth(context, 1.f);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
    
}




- (void) onCircleStyle:(CGContextRef) context  inPoint:(CGPoint) point withSize:(NSInteger) size withColor:(UIColor*) color withRatio:(CGFloat) ratio {
 
    CGRect square =  CGRectMake(point.x - size / 2,
                                point.y - size / 2,
                                size,
                                size * ratio);
    
    square = CGRectIntegral(square);

    CGContextAddEllipseInRect(context, square);
     
     CGContextSetLineWidth(context, 1.f);
     CGContextSetStrokeColorWithColor(context, color.CGColor);
     CGContextStrokePath(context);
    
}




@end
