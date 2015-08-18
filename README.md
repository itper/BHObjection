<link rel="stylesheet" href="http://yandex.st/highlightjs/6.1/styles/default.min.css">
<script src="http://yandex.st/highlightjs/6.1/highlight.min.js"></script>
<script>
hljs.tabReplace = ' ';
hljs.initHighlightingOnLoad();
</script>

# BHObjection
demo of objection

##### 依赖注入框架，基于接口（_Protocol_）类似于Spring的一些功能
Spring中通过 java 的标注,实现对 module 的注入,在 OC 中需要手写 Module, 然后在类方法+load注入 module 建立起 Class 和 Interface 之间的关系,当使用一个类的时候,通过接口去实例化.


```objective-c
<pre><code>
+(void)load{
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector?:[JSObjection createInjector];
    injector = [injector withModule:[self new]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure{
    [self bindClass:NSClassFromString(@"ViewControllerA") 
    toProtocol:@protocol(ViewControllerAProtocol)];
}
</code></pre>
```
