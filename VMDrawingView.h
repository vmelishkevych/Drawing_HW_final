//
//  VMDrawingView.h
//  DrawingHomeworkSuper03
//
//  Created by Torris on 3/18/17.
//  Copyright © 2017 Vasiliy Melishkevych. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VMDrawingViewDelegate;


@interface VMDrawingView : UIView

@property (weak,nonatomic) id <VMDrawingViewDelegate> delegate;

@end



@protocol VMDrawingViewDelegate <NSObject>



@property (strong,nonatomic) NSMutableArray* pointsArray;



@end

