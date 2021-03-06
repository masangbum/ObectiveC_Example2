//
//  MainViewController.m
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [self onTimer];          // 타이머를 설정합니다.
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    // 현재 시간을 뷰에 표현할 폰트를 설정합니다.
    [clockDisplay setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:64.0]];
    
    //pAlarmOnOff = NO;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)onTimer {
    int phour, pminute, psecond;
    
    NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour| NSCalendarUnitMinute |NSCalendarUnitSecond;
    
    
    NSDate *date = [NSDate date];        // 현재 시간을 구합니다.
    NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
    phour = (int)[comps hour];           // 현재 시간 : 시
    pminute = (int)[comps minute];       // 현재 시간 : 분
    psecond = (int)[comps second];       // 현재 시간 : 초
    
    // 현재시간을 화면에 출력합니다.
    clockDisplay.text = [NSString stringWithFormat:@"%02d:%02d:%02d",phour, pminute, psecond];
    
    pClockView.pHour = phour;
    pClockView.pMinute = pminute;
    pClockView.pSecond = psecond;
    // 아날로그 시계뷰를 다시 그립니다.
    [pClockView setNeedsDisplay];
    
    if (self.pAlarmOnOff == YES)
        if (self.pAlarmHour == phour && self.pAlarmMinute == pminute && psecond == 0)
            [self messageDisplay];
}


- (void)messageDisplay{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"알람시계" message:@"약속시간입니다." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction*defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
