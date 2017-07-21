//
//  ViewController.m
//  9.29 - Calculator
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UILabel *procedureLabel;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) NSInteger count1;
@property (nonatomic,assign) float firstvalue;
@property (nonatomic,assign) float secondvalue;
@property (nonatomic,assign) float middlevalue;
@property (nonatomic,assign) NSString *storageOperatings;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 1;
    _count1 = 0;
    _middlevalue = 0;
}

- (void)labelshowing:(NSString*)operating{
    _showLabel.text = operating;
    _procedureLabel.text = operating;
}

- (void)sencondClick:(NSString*)operating{
    _showLabel.text = [_showLabel.text stringByAppendingString:operating];
    _procedureLabel.text = [_procedureLabel.text stringByAppendingString:operating];
}

- (void)giveoperating:(NSString*)operatings{
    if(_count == 1){
        [self labelshowing:operatings];
        _count ++;
    }else{
        if ([operatings isEqualToString:@"+"]) {
            _firstvalue = _middlevalue;
        }
        [self sencondClick:operatings];
    }
}
//-----------数字
- (IBAction)number_0:(UIButton *)sender {
    if(_showLabel.text == 0){
        return;
    }else{
    
        if([_showLabel.text hasPrefix:@"0"]){
            return;
        }else{
            [self giveoperating:@"0"];
        }
    }
}
- (IBAction)number_1:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"1"];
}
- (IBAction)number_2:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"2"];
}
- (IBAction)number_3:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"3"];
}
- (IBAction)number_4:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"4"];
}
- (IBAction)number_5:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"5"];
}
- (IBAction)number_6:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"6"];
}
- (IBAction)number_7:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"7"];
}
- (IBAction)number_8:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"8"];
}
- (IBAction)number_9:(UIButton *)sender {
    if(_count1 < 0){
        [self medianstorage];
    }
    [self giveoperating:@"9"];
}

//------运算符
- (IBAction)plus_:(UIButton *)sender {
    [self giveoperating:@"+"];
    _storageOperatings = @"+";
    [self clearLabel];

}
- (IBAction)minus_:(UIButton *)sender {
    [self giveoperating:@"-"];
    _storageOperatings = @"-";
    [self clearLabel];
}
- (IBAction)mutiply_:(UIButton *)sender {
    [self giveoperating:@"*"];
    _storageOperatings = @"*";
    [self clearLabel];
}
- (IBAction)divided_:(UIButton *)sender {
    [self giveoperating:@"/"];
    _storageOperatings = @"/";
    [self clearLabel];
}

//------其它运算符
- (IBAction)clear_AC:(UIButton *)sender {
    _count = 1;
    [self clearzero];
}

- (IBAction)point_:(UIButton *)sender {
    if([_showLabel.text containsString:@"."]){
        return;
    }
    [self giveoperating:@"."];
}
- (IBAction)equal_:(id)sender {
    
    _secondvalue = [_showLabel.text floatValue];
    NSLog(@"%f""%f",_firstvalue,_secondvalue);
    if(_storageOperatings && _firstvalue && _secondvalue){
        _middlevalue = [self Compute:_storageOperatings];
        _showLabel.text = [NSString stringWithFormat:@"%f",_middlevalue];
    }
    _count1 = -1;
    _storageOperatings = nil;
}

- (void)medianstorage{

    _firstvalue = _middlevalue;
}

- (void)clearLabel{
    _firstvalue = [_showLabel.text floatValue];
    _showLabel.text = @"";

}

- (void)clearzero{
    _firstvalue = 0;
    _secondvalue = 0;
    _showLabel.text = @"0";
    _procedureLabel.text = @"0";
    _count1 = 0;
}
//--------四则运算
- (float)Compute:(NSString*)operatings{
    float result = _firstvalue;
    if ([operatings isEqualToString:@"+"]){
        result = _firstvalue + _secondvalue;
    }
    if ([operatings isEqualToString:@"-"]){
        result = _firstvalue - _secondvalue;
    }
    if ([operatings isEqualToString:@"*"]){
        result = _firstvalue * _secondvalue;
    }
    if ([operatings isEqualToString:@"/"]){
        result = _firstvalue / _secondvalue;
    }
    return result;
}


//---------四种方法求解四则运算
- (void)numCompute{

    NSString *operating_plus = @"+";
    NSArray *array = [_showLabel.text componentsSeparatedByString:operating_plus];
    float sum = 0;
    for (NSInteger i = 0; i<array.count; i++) {
        NSString *s = array[i];
        float value1 = [s floatValue];
        
        sum += value1;
    }
    NSString *s = [NSString stringWithFormat:@"%f",sum];
    _showLabel.text = s;

}

- (void)mimusCompute{
    NSString *operating_mimus = @"-";
    NSArray *array = [_showLabel.text componentsSeparatedByString:operating_mimus];
    float sum = 0;
    for (NSInteger i = 0; i<array.count; i++) {
        sum += [array.firstObject floatValue];
        NSString *s = array[i];
        float value1 = [s floatValue];
        sum -= value1;
    }
    NSString *s = [NSString stringWithFormat:@"%f",sum];
    _showLabel.text = s;
    
}

- (void)mutiplyCompute{
    NSString *operating_mutiply = @"*";
    NSArray *array = [_showLabel.text componentsSeparatedByString:operating_mutiply];
    NSLog(@"array = %@",array);
    float sum = 1;
    for (NSInteger i = 0; i<array.count; i++) {
        NSString *s = array[i];
        float value1 = [s floatValue];
        if(value1 == 0){
            _showLabel.text = 0;
        }
        sum *= value1;
    }
    NSString *s = [NSString stringWithFormat:@"%f",sum];
    _showLabel.text = s;
    
}

- (void)dividedCompute{
    NSString *operating_divided = @"/";
    NSArray *array = [_showLabel.text componentsSeparatedByString:operating_divided];
    NSLog(@"array = %@",array);
    float sum = 1;
    for (NSInteger i = 0; i<array.count; i++) {
        sum = [array.firstObject floatValue]*sum;
        NSString *s = array[i];
        float value1 = [s floatValue];
        if(value1 == 0){
            _showLabel.text = 0;
        }
        sum /= value1;
        
    }
    NSString *s = [NSString stringWithFormat:@"%f",sum];
    _showLabel.text = s;
    
}

@end
