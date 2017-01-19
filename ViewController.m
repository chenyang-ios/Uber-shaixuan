//
//  ViewController.m
//  仿U步筛选栏
//
//  Created by 小菊花 on 17/1/19.
//  Copyright © 2017年 com.qiji.www. All rights reserved.
//

#import "ViewController.h"
#import "SEFilterKnob.h"
#import "SEFilterControlList.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
// 414
#define kScale kScreenWidth/375.0f

#define kkScale kScreenWidth/414.0f

#define khScale kScreenHeight/667.0f

@interface ViewController ()
{
    
    
    NSArray *timeArray ;
    
    NSArray *locationArray;
    
    NSArray *piceArray;
    
    
    
    SEFilterControlList *filter;
    
    UIView *dicengbackeView;
    
    UIView  *Button_UIView;
    
    UIScrollView *_backsrollView;
    
    UIImageView *imageView1;
    
    UIImageView *imageView2;
    
    UIImageView *imageView3;
    
     NSMutableDictionary  *shaixuan;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor  whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
     shaixuan = [NSMutableDictionary dictionary];
    
    [ self    loadData];
    
    [self   shuaxin];
    
    
    
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dianji)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
}

/**
 *  加载数据
 */
- (void)loadData{
    
    timeArray = @[@"6小时之内",@"12小时之内",@"24小时之内"];
    
    locationArray = @[@"全城",@"附近1km",@"附近3千米",@"附近5千米",@"附近10千米"];
    
    piceArray = @[@"价格不限",@"0-5元",@"5-20元",@"20-50元",@"50-100元"];
    
}
/**
 *  加载UI视图
 */
-(void)shuaxin{
    
    dicengbackeView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-140, kScreenWidth, 420)];
    
    dicengbackeView.backgroundColor = [UIColor colorWithWhite:0.850 alpha:1.000];
    
    [self.view addSubview:dicengbackeView];
    
    filter = [[SEFilterControlList alloc]initWithFrame:CGRectMake((kScreenWidth-300)/2, -5, 300, 30) Titles:[NSArray arrayWithObjects:@"时间", @"附近", @"价格",nil]];
    
    filter.userInteractionEnabled = YES;
    
    [filter addTarget:self action:@selector(filterValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    [filter setProgressColor:[UIColor groupTableViewBackgroundColor]];//设置滑杆的颜色
    
    [filter setTitlesFont:[UIFont fontWithName:@"Didot" size:16]];
    
    [filter setTopTitlesColor:[UIColor blackColor]];//设置滑块上方字体颜色
    
    [filter setSelectedIndex:0];//设置当前选中
    
    [dicengbackeView addSubview:filter];
    
    
    Button_UIView  = [[UIView alloc]initWithFrame:CGRectMake(0, 70,kScreenWidth,240)];
    
    Button_UIView.backgroundColor = [UIColor colorWithWhite:0.730 alpha:1.000];
    
    [dicengbackeView addSubview:Button_UIView];
    
    _backsrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , 240)];
    
    _backsrollView.pagingEnabled = YES;
    
    _backsrollView.userInteractionEnabled = YES;
    
    _backsrollView.contentSize =CGSizeMake(kScreenWidth*3, 0);
    //设置是否滚动
    _backsrollView.scrollEnabled = NO;
    
    [Button_UIView addSubview:_backsrollView];
    
    imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _backsrollView.frame.size.height)];
    
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, _backsrollView.frame.size.height)];
    
    imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, _backsrollView.frame.size.height)];
#pragma mark ==========Loading===================
    imageView1.userInteractionEnabled = YES;
    
    imageView2.userInteractionEnabled = YES;
    
    imageView3.userInteractionEnabled = YES;
    
#pragma mark ==========Loading===================
    for (int g =0; g<3; g++) {
        
        UIButton *button1 = [UIButton  buttonWithType:UIButtonTypeCustom];
        
        button1.frame = CGRectMake(0, (180/3)*g, kScreenWidth, 180/3);
        button1.backgroundColor = [UIColor colorWithWhite:0.850 alpha:1.000];
        
        [button1 setTitle:timeArray[g] forState:UIControlStateNormal];
        
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button1.tag = 100+g;
        
        button1.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        button1.layer.borderColor = [[UIColor colorWithWhite:0.837 alpha:1.000] CGColor];
        
        button1.layer.borderWidth = 1.0f;
        
        [button1 addTarget:self action:@selector(timebtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [imageView1 addSubview:button1];
        
    }
    
    for (int k =0; k<5; k++) {
        
        UIButton *button2 = [UIButton  buttonWithType:UIButtonTypeCustom];
        
        button2.frame = CGRectMake(0, (180/5)*k, kScreenWidth, 180/5);
        button2.backgroundColor = [UIColor colorWithWhite:0.850 alpha:1.000];
        
        [button2 setTitle:locationArray[k] forState:UIControlStateNormal];
        
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button2.tag = 200+k;
        
        button2.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        button2.layer.borderColor = [[UIColor colorWithWhite:0.837 alpha:1.000] CGColor];
        
        button2.layer.borderWidth = 1.0f;
        
        [imageView2 addSubview:button2];
        
        [button2 addTarget:self action:@selector(timebtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    for (int y =0; y<5; y++) {
        
        UIButton *button3 = [UIButton  buttonWithType:UIButtonTypeCustom];
        
        button3.frame = CGRectMake(0, (180/5)*y, kScreenWidth, 180/5);
        
        button3.backgroundColor = [UIColor colorWithWhite:0.850 alpha:1.000];
        
        [button3 setTitle:piceArray[y] forState:UIControlStateNormal];
        
        [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button3.tag = 300+y;
        
        button3.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        button3.layer.borderColor = [[UIColor colorWithWhite:0.837 alpha:1.000] CGColor];
        
        button3.layer.borderWidth = 1.0f;
        
        [imageView3 addSubview:button3];
        
        [button3 addTarget:self action:@selector(timebtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [_backsrollView addSubview:imageView1];
    
    [_backsrollView addSubview:imageView2];
    
    [_backsrollView addSubview:imageView3];
    
}

- (void)filterValueChanged:(SEFilterControlList *)sender{
    
    NSLog(@"%d",sender.SelectedIndex);
    switch (sender.SelectedIndex) {
        case 0:{
            
            break;
        }
        case 1:{
            
            break;
        }
        case 2:{
            
            break;
        }
        default:
            break;
    }
    
    _backsrollView.contentOffset = CGPointMake([sender SelectedIndex]*kScreenWidth, 0);
    
//    self.table.contentInset = UIEdgeInsetsMake(0, 0, 230, 0);
    
    [UIView animateWithDuration:0.2 animations:^{
        
        
        [UIView animateWithDuration:0.2 animations:^{
            
            dicengbackeView.frame = CGRectMake(0,kScreenHeight-310 , kScreenWidth,310);
        }];
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)timebtn:(UIButton *)sender{
    
    switch (sender.tag) {
        case  100:{
            
            [shaixuan setObject:@"6" forKey:@"times"];
            
            [self dianji];
            [self chuanzhi];
            
            break;
        }
        case  101:{
            
            
            
            [shaixuan setObject:@"12" forKey:@"times"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            break;
        }
        case  102:{
            
            [shaixuan setObject:@"24" forKey:@"times"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            break;
        }
            
        case  200:{
            
            
            [shaixuan setObject:@"0" forKey:@"nearby"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
            
        case  201:{
            
            
            
            [shaixuan setObject:@"1" forKey:@"nearby"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
            
        case  202:{
            
            
            
            [shaixuan setObject:@"3" forKey:@"nearby"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
            
            
        case  203:{
            
            
            
            [shaixuan setObject:@"5" forKey:@"nearby"];
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
            
            
        case  204:{
            
            
            
            [shaixuan setObject:@"10" forKey:@"nearby"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
            
        case  300:{
            
            
            
            [shaixuan setObject:@"0" forKey:@"pricenumber"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
        case  301:{
            
            
            
            [shaixuan setObject:@"1" forKey:@"pricenumber"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            break;
        }
        case  302:{
            
            
            
            [shaixuan setObject:@"2" forKey:@"pricenumber"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
        case  303:{
            
            [shaixuan setObject:@"3" forKey:@"pricenumber"];
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
        case  304:{
            
            [shaixuan setObject:@"4" forKey:@"pricenumber"];
            
            
            [self dianji];
            //            [self  pianyi];
            [self chuanzhi];
            
            break;
        }
        default:
            break;
    }
#pragma mark ===================
    
}


-(void)dianji{
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        dicengbackeView.frame = CGRectMake(0, kScreenHeight-135, kScreenWidth, 370);
    }];
}
//将参数传给后台，请求数据
-(void)chuanzhi{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
