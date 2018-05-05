//
//  ViewController.m
//  TxtPicker
//
//  Created by Mac on 2018/5/5.
//  Copyright © 2018年 saint. All rights reserved.
//

#import "ViewController.h"
#import "TxtPicker.h"

@interface ViewController ()<TxtPickerDelegate>

@property (nonatomic, strong) TxtPicker * txtPicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.txtPicker = [[TxtPicker alloc] initWithArr:@[@"1",@"2",@"3"]];
    self.txtPicker.txtPickerDelegate = self;
    [self.view addSubview:self.txtPicker];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.txtPicker becomeFirstResponder];
}

#pragma mark TxtPickerDelegate

-(void)selectedWithStr:(NSString *)str row:(NSInteger)row{
    NSLog(@"\n str = %@, \n row=%ld",str,row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
