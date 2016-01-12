//
//  MainViewController.m
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "MainViewController.h"

#import "wordTestObj.h"

#import "ClickTest.h"

#import <JavaScriptCore/JavaScriptCore.h>

@interface MainViewController ()<wordTestObjDelegate,ClikTestDelegate,UIWebViewDelegate>

@property (nonatomic,strong) wordTestObj*objc;

@property (nonatomic,strong) ClickTest *cl;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setUpWordsTest];
    
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    NSURLRequest *requser = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
//    [webview loadRequest:requser];
//        [webview loadHTMLString:@"index.htm" baseURL:nil];
    NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
//    NSString *path = [NSBundle mainBundle]pathForResource: ofType:
    
    NSString *filePath  = [resourcePath stringByAppendingPathComponent:@"index.html"];
    NSString *htmlstring =[[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    JSLog(@"%@",resourcePath);
    JSLog(@"%@",htmlstring);
    JSLog(@"%@",filePath);
    
//    [webview loadHTMLString:htmlstring  baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle]  bundlePath]]];
//    webview.delegate = self;
    
    
    //http://www.html5tricks.com/demo/html5-canvas-choujiang/index.html
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *rqy = [NSURLRequest requestWithURL:url];
    [webview loadRequest:rqy];
    webview.delegate = self;
    [self.view addSubview:webview];
}


//网页加载之前就会调用
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    return YES;
}

//网页开始加载时调用
- (void)webViewDidStartLoad:(UIWebView *)webView{
}

//网页加载完成调用
- (void)webViewDidFinishLoad:(UIWebView *)webView{

    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *alertJS = @"alert('test js in oc')"; //准备执行的js代码。
    [context evaluateScript:alertJS];//通过oc方法调用js的alert；
    
}

//网页加载失败调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];


}

-(void)setUpWordsTest{
    
    wordTestObj *words = [wordTestObj test];

    self.objc = words;
    
    self.objc.delegate = self;
    
    [words setUpFirst:self];

}

-(void)setUpClickTest{

    ClickTest *clik = [[ClickTest alloc]initWithController:self];
    
    clik.delegate = self;
    
    self.cl = clik;
    
    [self.cl beganTest];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -wordTestDelegate

-(void)wordDidFinishTest:(wordTestObj *)wordobj{

    JSLog(@"finfshtest in the controller");
    
    self.objc = nil;
    
}

#pragma mark -clickTestDelegate
-(void)clickTestDidFinish:(ClickTest *)test{

    self.cl = nil;

}



@end
