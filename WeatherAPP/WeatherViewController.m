//
//  WeatherViewController.m
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "WeatherViewController.h"
#import "UIColor+Helper.h"
#import "Weather.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "SwitchCityViewController.h"
#import "UIViewController+Segue.h"

@interface WeatherViewController ()

@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIButton *changeCityButton;
@property (nonatomic,strong) UIView *weatherContainerView;
@property (nonatomic,strong) UILabel *temperatureLabel;
@property (nonatomic,strong) UIImageView *weatherConditionImageView;
@property (nonatomic,strong) UILabel *cityLabel;

@property (nonatomic,strong) Weather *weather;
@property (nonatomic,strong) CLLocationManager *locationManager;

@property (nonatomic,strong) NSString *switchedCity;

@end

@implementation WeatherViewController

-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView){
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.image = [UIImage imageNamed:@"background"];
        _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        _backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _backgroundImageView;
}
-(UIButton *)changeCityButton {
    if (!_changeCityButton){
        _changeCityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeCityButton setImage:[UIImage imageNamed:@"switch"] forState:UIControlStateNormal];
        [_changeCityButton setTitleShadowColor:[[UIColor alloc]initWithRed:128 Green:128 Blue:128] forState:UIControlStateNormal];
        _changeCityButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_changeCityButton addTarget:self action:@selector(handleSwitch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeCityButton;
}

-(UIView *)weatherContainerView {
    if (!_weatherContainerView) {
        _weatherContainerView = [[UIView alloc]init];
        _weatherContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _weatherContainerView;
}

-(UILabel *)temperatureLabel {
    if (!_temperatureLabel) {
        _temperatureLabel = [[UILabel alloc]init];
        _temperatureLabel.textAlignment = NSTextAlignmentRight;
        _temperatureLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:100];
        _temperatureLabel.textColor = [UIColor whiteColor];
        _temperatureLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _temperatureLabel;
}

-(UIImageView *)weatherConditionImageView {
    if (!_weatherConditionImageView) {
        _weatherConditionImageView = [[UIImageView alloc]init];
        _weatherConditionImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_weatherConditionImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateWeather:)]];
        _weatherConditionImageView.userInteractionEnabled = YES;
        _weatherConditionImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _weatherConditionImageView;
}

-(UILabel *)cityLabel {
    if(!_cityLabel) {
        _cityLabel = [[UILabel alloc]init];
        _cityLabel.font = [UIFont systemFontOfSize:33];
        _cityLabel.textColor = [UIColor whiteColor];
        _cityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _cityLabel;
}

-(void)updateWeather: (nullable UIImageView*) sender{
    [SVProgressHUD show];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

-(void)handleSwitch: (nullable UIButton *) sender{
    SwitchCityViewController *controller = [[SwitchCityViewController alloc]init];
    controller.delegate = self;
    
    [self presentFromRight:controller];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    [self setupLocationManager];
}

-(void)setupView {
    [self setupBackgroundView];
    [self setupSwitchButton];
    [self setupWeatherContainerView];
}

-(void)setupBackgroundView {
    [self.view addSubview:self.backgroundImageView];
    [self.backgroundImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.backgroundImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.backgroundImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.backgroundImageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}

-(void)setupSwitchButton {
    [self.view addSubview:self.changeCityButton];
    [self.changeCityButton.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor constant: 20].active = YES;
    [self.changeCityButton.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.changeCityButton.heightAnchor constraintEqualToConstant:50].active = YES;
    [self.changeCityButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -16].active = YES;
}

-(void)setupWeatherContainerView {
    [self.view addSubview:self.weatherContainerView];
    [self.weatherContainerView.heightAnchor constraintEqualToConstant:480].active = YES;
    [self.weatherContainerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [self.weatherContainerView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.weatherContainerView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;

    [self.weatherContainerView addSubview:self.temperatureLabel];
    [self.temperatureLabel.topAnchor constraintEqualToAnchor:self.weatherContainerView.topAnchor].active = YES;
    [self.temperatureLabel.widthAnchor constraintEqualToConstant:268].active = YES;
    [self.temperatureLabel.heightAnchor constraintEqualToConstant:128].active = YES;
    [self.temperatureLabel.rightAnchor constraintEqualToAnchor:self.weatherContainerView.rightAnchor constant: -16].active = YES;

    [self.weatherContainerView addSubview:self.cityLabel];
    [self.cityLabel.bottomAnchor constraintEqualToAnchor:self.weatherContainerView.bottomAnchor].active = YES;
    [self.cityLabel.heightAnchor constraintEqualToConstant:96].active = YES;
    [self.cityLabel.leftAnchor constraintEqualToAnchor:self.weatherContainerView.leftAnchor constant:16].active = YES;
    [self.cityLabel.rightAnchor constraintEqualToAnchor:self.weatherContainerView.rightAnchor constant: -16].active = YES;

    [self.weatherContainerView addSubview:self.weatherConditionImageView];
    [self.weatherConditionImageView.topAnchor constraintEqualToAnchor:self.temperatureLabel.bottomAnchor constant: 2].active = YES;
    [self.weatherConditionImageView.bottomAnchor constraintEqualToAnchor:self.cityLabel.topAnchor constant:-2].active = YES;
    [self.weatherConditionImageView.leftAnchor constraintEqualToAnchor:self.weatherContainerView.leftAnchor constant:16].active = YES;
    [self.weatherConditionImageView.rightAnchor constraintEqualToAnchor:self.weatherContainerView.rightAnchor constant: -16].active = YES;
}

//MARK: - JSON Parsing
/***************************************************************/
-(void)updateWeatherData:(NSDictionary *)data{
    if ([data objectForKey:@"main"]){
        self.weather = [[Weather alloc] init];
        self.weather.temperature = [[[data objectForKey:@"main"] objectForKey:@"temp"] doubleValue] - 273.15;
        self.weather.city = [data objectForKey:@"name"];
        self.weather.condition = [[[[data objectForKey:@"weather"] objectAtIndex:0] objectForKey:@"id"] intValue];
        self.weather.weatherIconName = [self.weather updateWeatherIconWithCondition: self.weather.condition];
        
        NSLog(@"%@", self.weather);

        [self updateUIWithWeatherData];
    } else {
        self.cityLabel.text = @"Weather Unvailable";
    }
}

//MARK: - UI Updates
/***************************************************************/
-(void)updateUIWithWeatherData{
    self.cityLabel.text = self.weather.city;
    self.temperatureLabel.text = [NSString stringWithFormat: @"%d℃", self.weather.temperature];
    self.weatherConditionImageView.image = [UIImage imageNamed:self.weather.weatherIconName];
}

//MARK: - Location manager
/***************************************************************/
-(void)setupLocationManager{
    [SVProgressHUD show];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

//MARK: - Networking
/***************************************************************/
-(void)getWeatherDataWithUrl: (NSString *) url Parameters:(NSDictionary *) paramaters{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:paramaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        [self updateWeatherData:responseObject];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        self.cityLabel.text = @"Connection Issues!";
        [SVProgressHUD dismiss];
    }];
}

//MARK: - Location Manager Delegate Methods
/***************************************************************/
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations objectAtIndex:locations.count - 1];
    if (location.horizontalAccuracy > 0) {
        [self.locationManager stopUpdatingLocation];
        self.locationManager.delegate = nil;
        
        NSString *latitude = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
        NSString *longitude = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
        
        NSDictionary *coordinate = @{@"lat" : latitude, @"lon" : longitude, @"appid" : @APP_ID};
        
        [self getWeatherDataWithUrl:@WEATHER_URL Parameters:coordinate];
        
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@",error);
    self.cityLabel.text = @"City Unavailable!";
    [SVProgressHUD dismiss];
    
}

-(void)customizedWithCityName:(NSString *)city {
    [SVProgressHUD show];
    self.switchedCity = city;
    NSDictionary *parameters = @{@"q" : city, @"appid" : @APP_ID};
    [self getWeatherDataWithUrl:@WEATHER_URL Parameters:parameters];
    [SVProgressHUD dismiss];
}



@end
