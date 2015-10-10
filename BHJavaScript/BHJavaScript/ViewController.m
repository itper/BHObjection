//
//  ViewController.m
//  BHJavaScript
//
//  Created by chendi on 15/9/24.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com"]]];
    [self.webView reload];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *url = request.URL.absoluteString;
    NSLog(@"url:%@",url);
    NSString *param = [[url substringFromIndex:[url rangeOfString:@"?"].length>0?[url rangeOfString:@"?"].location:0] substringFromIndex:1];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSLog(@"%@",param);
    if([request.URL.relativePath hasPrefix:@"/native"]){
        
        for (NSString *keyValue in [param componentsSeparatedByString:@"&"]) {
            NSString *key = [keyValue componentsSeparatedByString:@"="][0];
            NSString *value = [keyValue componentsSeparatedByString:@"="][1];
            [dic setObject:value forKey:key];
        }
        NSLog(@"native invoke");
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:[dic valueForKey:@"title"] message:[dic objectForKey:@"value"] preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [controller addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:controller animated:YES completion:nil];
        return NO;
    }
    return YES;
}

-(void)loadComplete{
    static int  i = 0;
    if(i>0)return;
    i++;
    //验证返回值
    //想加载的web添加script节点,自定义一个函数,可以测试通过OC调用JS
    NSString *element = @"var script = document.createElement('script');script.type = 'text/javascript';script.text = 'function myFunction(){return {\"a\":10}.toString();}';document.getElementsByTagName('head')[0].appendChild(script);";
    //验证js调用native
    //同样添加script节点,运行一个设置iFrame的src属性的设置.
    //通过在js中修改一些属性,来达到触发webView发起request的请求,在shouldStartLoadWidthRequest中拦截请求
    //通过设置特定的请求的url间接的去调用OC代码.
    //OC代码在收到特殊url请求处理请求,通过url可以得到参数等
    //然后OC再通过stringByEvaluatingJavaScriptFromString来调用JS的代码,达到回调的效果
    //OC调用JS的回调同样通过这样的流程来实现.
    NSString *createFrame = @"var script = document.createElement('script');script.type='text/javascript';script.text='var messageingIframe;messageingIframe = document.createElement(\"iframe\");messageingIframe.style.display = \"none\";document.documentElement.appendChild(messageingIframe);function test(){messageingIframe.src = \"native?title=hello&value=chendi\";};';document.getElementsByTagName('head')[0].appendChild(script);";
    [_webView stringByEvaluatingJavaScriptFromString:element];
    [_webView stringByEvaluatingJavaScriptFromString:createFrame];
    [_webView stringByEvaluatingJavaScriptFromString:@"test();"];
    NSLog(@"%@",[self->_webView stringByEvaluatingJavaScriptFromString:@"myFunction()"]);
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"web view did start load");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"web view did finish load");
    [self loadComplete];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"web view did failload with error");
}

@end
