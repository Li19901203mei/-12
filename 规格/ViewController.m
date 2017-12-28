//
//  ViewController.m
//  规格
//
//  Created by aa on 2017/12/28.
//  Copyright © 2017年 weiyankeji. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
//尺寸
#define SCREEN_WIDTH(w) w*[[UIScreen mainScreen] bounds].size.width/375
#define SCREEN_HEIGHT(H) H*[[UIScreen mainScreen] bounds].size.height/667
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray * btnMutableArray; //存储button的可变数组
@property(nonatomic,assign)BOOL selet; //存储button的可变数组
@property(nonatomic,strong)NSMutableArray * ckggMuArr; //存储button的可变数组
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _ckggMuArr = [[NSMutableArray alloc]initWithObjects:@"155",@"15635655",@"154535435",@"15435455",@"155",@"155",@"15543545",@"1535355", nil];
    [self dianJiView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dianJiView
{
    
    UIButton *btn;
    float upX = SCREEN_WIDTH(10);
    float upY = SCREEN_HEIGHT(118);
    
        for (int i = 0; i<_ckggMuArr.count; i++) {
            NSString *str = [_ckggMuArr objectAtIndex:i] ;
            
            NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont boldSystemFontOfSize:14] forKey:NSFontAttributeName];
            CGSize size = [str sizeWithAttributes:dic];
            if ( upX > (self.view.frame.size.width-size.width-SCREEN_WIDTH(20))) {
                upX = SCREEN_WIDTH(10);
                upY += SCREEN_HEIGHT(30);
            }
            
            btn= [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(upX, upY, size.width+SCREEN_WIDTH(30),SCREEN_HEIGHT(25));
            [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
            [btn setTitleColor:[UIColor blackColor] forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [btn setTitle:[_ckggMuArr objectAtIndex:i] forState:0];
            btn.layer.cornerRadius = SCREEN_WIDTH(8);
            btn.layer.borderColor = [UIColor clearColor].CGColor;
            btn.layer.borderWidth = 0;
            [btn.layer setMasksToBounds:YES];
            
            [self.view addSubview:btn];
            btn.tag = i;
//            [btn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
            upX+=size.width+SCREEN_WIDTH(32);
            btn.selected = _selet;
            [_btnMutableArray addObject:btn];
        }
    
    
}

@end
