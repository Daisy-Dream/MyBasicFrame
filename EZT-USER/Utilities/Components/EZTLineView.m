//
//  EZTLineView.m
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "EZTLineView.h"
#import "EZTUIUtils.h"
@interface EZTLineView ()
{
    BOOL _isVertical;
    BOOL _notDrawing;
    
    UIColor *_color;
}

@end

@implementation EZTLineView

- (id)initWithFrame:(CGRect)frame
{
    NSAssert(YES, @"not!");
    return self;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color
{
    return [self initWithFrame:frame color:color vertical:NO];
}

- (id)initGrayLineWithFrame:(CGRect)frame
                   vertical:(BOOL)isVertical
         isFirstPixelOpaque:(BOOL)isFirstOpaque
{
    return [self initWithFrame:frame
                      vertical:isVertical
            isFirstPixelOpaque:isFirstOpaque
                     lineColor:LineColor];
}

- (id)initWithFrame:(CGRect)frame
           vertical:(BOOL)isVertical
 isFirstPixelOpaque:(BOOL)isFirstOpaque
          lineColor:(UIColor *)color
{
    _notDrawing = YES;
    
    self = [super initWithFrame:frame];
    
    if (nil != self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        _isVertical = isVertical;
        
        CGRect lineFrame = (CGRect){self.frame.origin,self.bounds.size};
        
        UIImage *image = [EZTUIUtils getLineImageWithIsVertical:isVertical
                                             isFirstPixelOpaque:isFirstOpaque
                                                 highlightColor:color];
        if (_isVertical) {
            
            self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lineFrame.size.width = 1;
            
        }else{
            
            self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lineFrame.size.height = 1;
        }
        
        [self setFrame:lineFrame];
        [self setImage:[image stretchableImageWithLeftCapWidth:2 topCapHeight:2]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color vertical:(BOOL)isVertical
{
    _isVertical = isVertical;
    
    if (_isVertical) {
        frame.size.width = 1;
    }else{
        frame.size.height = 1;
    }
    
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        _color = color;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (_notDrawing) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置画1像素时需要设置的坐标偏移，才能画出1像素的直线
    CGFloat offSet = 0.0f;
    
    if (_isVertical) {
        
        //画1像素垂直基准线
        [self drawLineFrom:CGPointMake(offSet, 0.f)
                   toPoint:CGPointMake(offSet, self.bounds.size.height)
                  andWidth:0.5f
                  andColor:_color.CGColor
                 inContext:context];
        
    }else{
        
        //画1像素水平基准线
        [self drawLineFrom:CGPointMake(offSet, 0.f)
                   toPoint:CGPointMake(self.bounds.size.width, 0.f)
                  andWidth:0.5f
                  andColor:_color.CGColor
                 inContext:context];
    }
    
}

- (void)drawLineFrom:(CGPoint)originPoint
             toPoint:(CGPoint)destPoint
            andWidth:(CGFloat)width
            andColor:(CGColorRef)color
           inContext:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, color);
    CGContextMoveToPoint(context, originPoint.x, originPoint.y);
    CGContextAddLineToPoint(context, destPoint.x, destPoint.y);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context , kCGLineCapSquare);
    CGContextStrokePath(context);
}

@end
