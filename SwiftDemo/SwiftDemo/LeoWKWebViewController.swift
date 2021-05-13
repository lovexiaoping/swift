//
//  LeoWKWebViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

import UIKit
import WebKit

class LeoWKWebViewController: UIViewController , WKNavigationDelegate, WKScriptMessageHandler {

    
    var webView: WKWebView!
        //你的H5网址
        var urls: String = "http://www.baidu.com"
     
        //声明下拉刷新控制器
        var refreshControl = UIRefreshControl()

    // 进度条
    lazy var progressView = UIProgressView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreen.main.bounds
        
        // MARK: --添加WKWebView
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))
        
        // MARK: --添加H5交互.  IosPay 与下面接收js调用方法对应
        // H5在js事件中的代码是 window.webkit.messageHandlers.IosPay.postMessage(参数)

        webView.configuration.userContentController.add(self, name: "IosPay")
        self.view.addSubview(self.webView)

        //为防止链接有中文，转utf-8
        urls = urls.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        let url = URL(string: urls)
        let request = URLRequest(url: url!)
        self.webView.load(request)
        self.webView.navigationDelegate = self


        //侧滑前进、返回
        webView.allowsBackForwardNavigationGestures = true
        
        //给webview添加下拉刷新
        refreshControl.addTarget(self, action:#selector(refresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string:"刷新")
        webView.scrollView.addSubview(refreshControl)

        
        
        
        
        self.progressView.frame = CGRect(x: 0
                    , y: 0 + 44
                                         , width: screen.width
                    , height: 2)
                progressView.progressTintColor = UIColor.red
                progressView.trackTintColor = UIColor.clear
                self.view.addSubview(self.progressView)
        // Do any additional setup after loading the view.
    }
    // 监听网页加载进度
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        self.progressView.progress = Float(webView.estimatedProgress)
    }
    
    //下拉刷新时的具体操作，此处以webview重新加载为例
    var trfa:Bool = false
    @objc func refresh(){
        //刷新页面
        print("刷新页面")
        trfa = true
        webView.reload()
    }
    
    // MARK: --实现WKNavigationDelegate委托协议
    //开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载")
        print("开始加载：" + (webView.url?.absoluteString ?? "123"))
    
    }
    
    //当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回")
        print("内容开始返回：" + (webView.url?.absoluteString ?? urls))
    }
    
    //加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("加载完成")
        print("加载完成：" + (webView.url?.absoluteString ?? urls))
        /// 获取网页title
        self.title = webView.title
        UIView.animate(withDuration: 0.5) {
                    self.progressView.isHidden = true
                }
        if trfa{
            trfa = false
            //加载完成后停止刷新 这个可根据需要写在合适的地方
            refreshControl.endRefreshing()
            print("停止刷新")
            
        }
    }
    
    //加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败 error :  ", error.localizedDescription)
        print("加载失败 error :  " + (webView.url?.absoluteString ?? urls))
        
        UIView.animate(withDuration: 0.5) {
                   self.progressView.progress = 0.0
                   self.progressView.isHidden = true
               }
        
        
        if trfa{
            trfa = false
            //加载完成后停止刷新 这个可根据需要写在合适的地方
            refreshControl.endRefreshing()
            print("停止刷新")
            
        }
    }
    
    //接收js调用方法
    func userContentController(_ userContentController: WKUserContentController,didReceive message: WKScriptMessage) {
        print("--------"+"\(message.name)")
        switch message.name {
        case "IosPay":
            //多个参数
            let dcit2:[String : NSObject] = message.body as! [String : NSObject]
            //单个参数
            let content:String = message.body as! String
            
        default: break
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
