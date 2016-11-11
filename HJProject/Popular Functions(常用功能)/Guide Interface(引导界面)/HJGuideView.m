//
//  HJGuideView.m
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "HJGuideView.h"
#import "Header.h"

@interface HJGuideView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *bigScrollView; // 滚动视图
@property (nonatomic, strong) NSMutableArray *imageArray;  // 图片数组
@property (nonatomic, strong) UIPageControl *pageControl;  // 页面控制器

@end

@implementation HJGuideView

- (void)dealloc
{
    NSLog(@"引导页释放");
}

/**
 添加启动界面
 
 @param imageNameArr   图片数组名字，放在工程根目录下的图片,如:Resource
 @param viewController 引导图结束后切换的视图控制器
 @param firstOpen      布尔是否为第一次打开
 */
+ (void)hj_guideWithImageNameArr:(NSArray *)imageNameArr
                  viewController:(UIViewController *)viewController
                       firstOpen:(BOOL)firstOpen;
{
    if (!firstOpen) {
        return;
    }
    HJGuideView *guideView = [HJGuideView new];
    guideView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    guideView.imageArray = @[@"1",@"2", @"3",@"4"].mutableCopy;
    [viewController.view addSubview:guideView];
    
    // 设置滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.contentSize = CGSizeMake((guideView.imageArray.count + 1)*SCREEN_WIDTH, SCREEN_HEIGHT);
    scrollView.pagingEnabled = YES;//设置分页
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = guideView;
    [guideView addSubview:scrollView];
    guideView.bigScrollView = scrollView;
    
    // 添加引导图片
    for (int i = 0; i < guideView.imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        // 放在根目录下的图片 Resource , 优化内存
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:guideView.imageArray[i] ofType:@"png"]];
        imageView.image = image;
        [scrollView addSubview:imageView];
    }
    
    // 设置页面控制器
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 60, 0, 40)];
    pageControl.numberOfPages = guideView.imageArray.count;
    pageControl.backgroundColor = [UIColor clearColor];
    [guideView addSubview:pageControl];
    guideView.pageControl = pageControl;
    
    // 添加手势
    UITapGestureRecognizer *singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:guideView action:@selector(handleSingleTapFrom)];
    singleRecognizer.numberOfTapsRequired = 1;
    [scrollView addGestureRecognizer:singleRecognizer];
}


- (void)handleSingleTapFrom
{
    if (_pageControl.currentPage == 3) {
        
        [self dismiss];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _bigScrollView) {
        
        CGPoint offSet = scrollView.contentOffset;
        
        _pageControl.currentPage = offSet.x/(self.bounds.size.width);//计算当前的页码
        [scrollView setContentOffset:CGPointMake(self.bounds.size.width * (_pageControl.currentPage), scrollView.contentOffset.y) animated:YES];
        
    }
    
    if (scrollView.contentOffset.x == (_imageArray.count) *SCREEN_WIDTH) {
        
        [self dismiss];
    }
    
}

- (void)dismiss
{
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
