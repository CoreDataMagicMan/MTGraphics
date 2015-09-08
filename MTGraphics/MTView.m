//
//  MTView.m
//  MTGraphics
//
//  Created by mtt0150 on 15/9/8.
//  Copyright (c) 2015年 MT. All rights reserved.
//

#import "MTView.h"

@implementation MTView

//UIview绘图
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //[self drawRectWithContext:context];
    //[self drawRectByUIKitWithContext:context];
    //[self drawEllipse:context];
    //[self drawArc:context];
    //[self drawCurve:context];
    [self drawTextInRect:context];
}
//绘制矩形
- (void)drawRectWithContext:(CGContextRef)context{
    //添加要绘制的矩形对象
    CGRect rect1 = CGRectMake(20, 50, 280, 50);
    //将要绘制的矩形对象添加到上下文当中
    CGContextAddRect(context, rect1);
    [[UIColor blueColor] set];
    //绘制的方式是以填充边界的形式
    CGContextDrawPath(context, kCGPathFillStroke);
    
}
- (void)drawRectByUIKitWithContext:(CGContextRef)context{
    CGRect rect2 = CGRectMake(20, 150, 280, 50);
    CGContextAddRect(context, rect2);
    CGRect rect3 = CGRectMake(20, 250, 280, 50);
    CGContextAddRect(context, rect3);
    [[UIColor yellowColor] set];
    //设置填充
    UIRectFill(rect2);
    [[UIColor redColor] setStroke];
    //设置边框
    UIRectFrame(rect3);
    
}
//绘制圆形
- (void)drawEllipse:(CGContextRef)context{
    //绘制椭圆或者圆形首先也要创建一个矩形
    CGRect rect = CGRectMake(50, 50, 250, 250);
    //添加该对象到上下文中
    CGContextAddEllipseInRect(context, rect);
    [[UIColor purpleColor] set];
    //开始启用上下文绘图
    CGContextDrawPath(context, kCGPathFillStroke);

}
//绘制弧形
- (void)drawArc:(CGContextRef)context{
    //创建弧形对象,各个参数的意义
    //(x,y)圆心的坐标
    //radius：圆的半径
    //startangle：起始的弧度
    //endangle:结束的弧度
    //clockwise：1是逆时针描绘，0是顺时针
    CGContextAddArc(context, self.bounds.size.width / 2, self.bounds.size.height / 2, 100, 0, M_PI_2, 1);
    [[UIColor yellowColor] set];
    CGContextDrawPath(context, kCGPathFillStroke);
}
//绘制曲线(又称为是“贝塞尔曲线”)
- (void)drawCurve:(CGContextRef)context{
    CGContextMoveToPoint(context, 20, 100);
    //添加一个二次贝塞尔曲线，只有一个control point点
    CGContextAddQuadCurveToPoint(context, 160, 0, 300, 100);
    CGContextMoveToPoint(context, 20, 500);
    //添加一个三次贝塞尔曲线，有两个控制点
    CGContextAddCurveToPoint(context, 80, 300, 240, 500, 300, 300);
    //共同设置边框和填充色
    [[UIColor redColor] setStroke];
    [[UIColor yellowColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
}
//绘制一段文本内容到一个指定的rect矩形宽内
- (void)drawTextInRect:(CGContextRef)context{
    CGRect rect = CGRectMake(20, 50, 280, 300);
    NSString *string = @"Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find.";
    //设置字体
    UIFont *font = [UIFont systemFontOfSize:12.0];
    UIColor *redColor = [UIColor redColor];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    NSTextAlignment alignment = NSTextAlignmentLeft;
    style.alignment = alignment;
    //字符串的绘制函数
    [string drawInRect:rect withAttributes:@{NSFontAttributeName:font,
                                             NSForegroundColorAttributeName:redColor,
                                             NSParagraphStyleAttributeName:style
                                             }];
    
}
@end
