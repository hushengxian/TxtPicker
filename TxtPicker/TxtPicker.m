//
//  TxtPicker.m
//  TxtPicker
//
//  Created by Mac on 2018/5/5.
//  Copyright © 2018年 saint. All rights reserved.
//

#import "TxtPicker.h"

@interface TxtPicker ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIToolbar * toorbar;

@property (nonatomic, strong) UIPickerView * pickerView;

@property (nonatomic, strong) NSArray * arrData;

@end

@implementation TxtPicker

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(UIToolbar *)toorbar {
    if (!_toorbar) {
        _toorbar  = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        
        UIBarButtonItem * cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(onClcikPickerCancel)];
        
        UIBarButtonItem * holderItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem * doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(onClcikPickerDone)];
        
        _toorbar.items = @[cancelItem,holderItem,doneItem];
        
    }
    return _toorbar;
}

-(UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

-(instancetype)initWithArr:(NSArray *)arr {
    if ([super init]) {
        _arrData = arr;
        self.inputAccessoryView = self.toorbar;
        self.inputView = self.pickerView;
    }
    return self;
}

#pragma mark - UIPickerViewDelegate,UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _arrData.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _arrData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_txtPickerDelegate && [_txtPickerDelegate respondsToSelector:@selector(selectedWithStr:row:)]) {
        [_txtPickerDelegate  selectedWithStr:_arrData[row] row:row];
    }
}

#pragma mark - onClick

-(void)onClcikPickerCancel {
    [[self currentViewController].view endEditing:YES];
}

-(void)onClcikPickerDone {
    [[self currentViewController].view endEditing:YES];
}

//获取Window当前显示的ViewController
- (UIViewController*)currentViewController{
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end

