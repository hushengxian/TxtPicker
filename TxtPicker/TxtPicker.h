//
//  TxtPicker.h
//  TxtPicker
//
//  Created by Mac on 2018/5/5.
//  Copyright © 2018年 saint. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TxtPickerDelegate <NSObject>

-(void)selectedWithStr:(NSString *)str row:(NSInteger)row;

@end

@interface TxtPicker : UITextField

@property (nonatomic, assign) id <TxtPickerDelegate>  txtPickerDelegate;

-(instancetype)initWithArr:(NSArray *)arr;

@end

