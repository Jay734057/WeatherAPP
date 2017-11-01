//
//  SwitchCityViewController.m
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "SwitchCityViewController.h"
#import "UIColor+Helper.h"
#import "UIViewController+Segue.h"

@interface SwitchCityViewController ()

@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIView *inputContainerView;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIButton *getWeatherButton;
@property (nonatomic,strong) UITextField *weatherInputTextView;

@end

@implementation SwitchCityViewController

-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]init];
        _backgroundImageView.image = [UIImage imageNamed:@"cityBackground"];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _backgroundImageView;
}

-(UIView *)inputContainerView {
    if (!_inputContainerView) {
        _inputContainerView = [[UIView alloc]init];
        _inputContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _inputContainerView;
}

-(UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        [_backButton setTitleShadowColor:[[UIColor alloc]initWithRed:128 Green:128 Blue:128] forState:UIControlStateNormal];
        _backButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_backButton addTarget:self action:@selector(handleBackButtonPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

-(UIButton *)getWeatherButton {
    if (!_getWeatherButton) {
        _getWeatherButton = [UIButton buttonWithType: UIButtonTypeSystem];
        [_getWeatherButton setTitle:@"Get Weather" forState:UIControlStateNormal];
        _getWeatherButton.titleLabel.font = [UIFont systemFontOfSize:28];
        [_getWeatherButton setTitleShadowColor:[[UIColor alloc] initWithRed:128 Green:128 Blue:128] forState:UIControlStateNormal];
        [_getWeatherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_getWeatherButton addTarget:self action:@selector(handleGetWeatherButtonPress) forControlEvents:UIControlEventTouchUpInside];
        _getWeatherButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _getWeatherButton;
}

-(UITextField *)weatherInputTextView {
    if (!_weatherInputTextView) {
        _weatherInputTextView = [[UITextField alloc]init];
        _weatherInputTextView.placeholder = @"Enter City Name.";
        _weatherInputTextView.textAlignment = NSTextAlignmentCenter;
        _weatherInputTextView.backgroundColor = [UIColor whiteColor];
        _weatherInputTextView.borderStyle = UITextBorderStyleRoundedRect;
        _weatherInputTextView.adjustsFontSizeToFitWidth = YES;
        _weatherInputTextView.minimumFontSize = 17;
        _weatherInputTextView.font = [UIFont systemFontOfSize:32];
        _weatherInputTextView.delegate = self;
        [_weatherInputTextView becomeFirstResponder];
        _weatherInputTextView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _weatherInputTextView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)setupView {
    [self setupBackgroundView];
    [self setupInputContainerView];
}

-(void)setupBackgroundView {
    [self.view addSubview:self.backgroundImageView];
    [self.backgroundImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
    [self.backgroundImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
    [self.backgroundImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = true;
    [self.backgroundImageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
}

-(void)setupInputContainerView {
    [self.view addSubview:self.inputContainerView];
    
    [self.inputContainerView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
    [self.inputContainerView.heightAnchor constraintEqualToConstant:221].active = true;
    [self.inputContainerView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = true;
    [self.inputContainerView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    
    [self.inputContainerView addSubview:self.getWeatherButton];
    
    [self.getWeatherButton.bottomAnchor constraintEqualToAnchor:self.inputContainerView.bottomAnchor].active = true;
    [self.getWeatherButton.heightAnchor constraintEqualToConstant:32].active = true;
    [self.getWeatherButton.leftAnchor constraintEqualToAnchor:self.inputContainerView.leftAnchor constant:12].active = true;
    [self.getWeatherButton.rightAnchor constraintEqualToAnchor:self.inputContainerView.rightAnchor constant:-12].active = true;
    
    [self.inputContainerView addSubview:self.backButton];
    
    [self.backButton.topAnchor constraintEqualToAnchor:self.inputContainerView.topAnchor constant:20].active = true;
    [self.backButton.heightAnchor constraintEqualToConstant:32].active = true;
    [self.backButton.leftAnchor constraintEqualToAnchor:self.inputContainerView.leftAnchor constant:16].active = true;
    [self.backButton.widthAnchor constraintEqualToConstant:32].active = true;
    
    [self.inputContainerView addSubview:self.weatherInputTextView];
    
    [self.weatherInputTextView.centerXAnchor constraintEqualToAnchor:self.inputContainerView.centerXAnchor].active = true;
    [self.weatherInputTextView.bottomAnchor constraintEqualToAnchor:self.getWeatherButton.topAnchor constant:-20].active = true;
    [self.weatherInputTextView.heightAnchor constraintEqualToConstant:60].active = true;
    [self.weatherInputTextView.widthAnchor constraintEqualToConstant:270].active = true;
}

-(void) handleBackButtonPress{
    [self dismissFromLeft];
}

-(void) handleGetWeatherButtonPress {
    if (self.delegate && self.weatherInputTextView.text) {
        [self.delegate customizedWithCityName:self.weatherInputTextView.text];
        [self dismissFromLeft];
    } else {
        [self dismissFromLeft];
    }
}



@end
