# 时间选择器
` 支持多种格式YearMonthDayHourMinute，YearMonthDay,MonthDayHourMinute,HourMinute,DayHourMinute,DayHourMinuteHourMinute这里只展示一种格式,超出范围的颜色也同样支持添加，可以设置需要显示的时间间隔

//效果图
![](https://github.com/HaoRuizhi/timeSelect/blob/master/TimeSelect/时间选择.gif)



使用方法：
WMCustomDatePicker *picker = [[WMCustomDatePicker alloc]initWithframe:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 214) Delegate:self PickerStyle:WMDateStyle_DayHourMinute];
picker.minLimitDate = [NSDate date];
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
