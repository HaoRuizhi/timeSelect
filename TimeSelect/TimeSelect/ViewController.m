//
//  ViewController.m
//  TimeSelect
//
//  Created by haorise on 15-9-9.
//  Copyright (c) 2015年 rise's company. All rights reserved.
//

#import "ViewController.h"
#import "UIViewExt.h"


@interface ViewController ()

@property (nonatomic,retain) UIView *pickerView;
@property (nonatomic,copy) NSString *beginTimeStr;
@property (nonatomic,copy) NSString *timeStr;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTimePicker];
}

- (void)createTimePicker{
    self.pickerView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 260)];
    
    WMCustomDatePicker *picker = [[WMCustomDatePicker alloc]initWithframe:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 214) Delegate:self PickerStyle:WMDateStyle_DayHourMinute];
    picker.minLimitDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    self.beginTimeStr = [dateFormatter stringFromDate:[NSDate date]];
    self.timeStr = [dateFormatter stringFromDate:picker.date];
    
    
    [self.pickerView addSubview:picker];
    self.pickerView.userInteractionEnabled = YES;
    
    
    [self.view addSubview:self.pickerView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(0, 0, 60, 25);
    cancelBtn.backgroundColor = [UIColor clearColor];
    cancelBtn.tag = 105;
    [cancelBtn addTarget:self action:@selector(timePickerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.pickerView addSubview:cancelBtn];
    
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneBtn setTitle:@"完成" forState:UIControlStateNormal];
    [doneBtn setTitleColor:[UIColor colorWithRed:19/255.0f green:137/255.0f blue:208/255.0f alpha:1] forState:UIControlStateNormal];
    doneBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60, 0, 60, 25);
    doneBtn.backgroundColor = [UIColor clearColor];
    doneBtn.tag = 106;
    [doneBtn addTarget:self action:@selector(timePickerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.pickerView addSubview:doneBtn];
    
}

- (void)timePickerBtnClicked:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerView.top = self.view.height;
    }];
    if (btn.tag == 106) {
        self.timeLabel.text = self.timeStr;
        NSLog(@"selectTime = %@",self.timeStr);
    }
}


- (IBAction)timeBtnClick:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        //        self.pickerView.frame = CGRectMake(0, self.view.height-260, [UIScreen mainScreen].bounds.size.width, 300);
        self.pickerView.top = self.view.height-260+44;
    }];
}


#pragma mark - WMCustomDatePickerDelegate
- (void)finishDidSelectDatePicker:(WMCustomDatePicker *)datePicker year:(NSString *)year month:(NSString *)month day:(NSString *)day hour:(NSString *)hour minute:(NSString *)minute weekDay:(NSString *)weekDay
{
    NSLog(@"%@====%@=====%@=====%@=====%@=====%@=====",year,month,day,hour,minute,weekDay);
    
    //    _TF.text = [NSString stringWithFormat:@"%@%@%@%@%@%@",year,month,day,hour,minute,weekDay];
}

- (void)finishDidSelectDatePicker:(WMCustomDatePicker *)datePicker date:(NSDate *)date
{
    if ([date compare:[NSDate date]] == NSOrderedDescending) {
        self.timeStr = [self dateFromString:date withFormat:@"yyyy-MM-dd HH:mm"];
    }
    
}

//根据date返回string
- (NSString *)dateFromString:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSString *dateStr = [inputFormatter stringFromDate:date];
    return dateStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
