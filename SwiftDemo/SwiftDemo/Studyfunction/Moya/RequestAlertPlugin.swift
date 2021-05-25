//
//  RequestAlertPlugin.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

import UIKit
import Moya
//import Result

/*
 请求状态指示插件）
 这个是本文的重点，自定义插件要实现 PluginType 协议接口。该协议定义了如下四个方法分别对应请求的四个阶段：
 prepare：准备发起请求。我们可以在这里对请求进行修改，比如再增加一些额外的参数。
 willSend：开始发起请求。我们可以在这里显示网络状态指示器。
 didReceive：收到请求响应。我们可以在这里根据结果自动进行一些处理，比如请求失败时将失败信息告诉用户，或者记录到日志中。
 process：处理请求结果。我们可以在 completion 前对结果进行进一步处理。
 
 */

final class RequestAlertPlugin: PluginType {

    //当前的视图控制器
       private let viewController: UIViewController
        
       //活动状态指示器（菊花进度条）
       private var spinner: UIActivityIndicatorView!
        
       //插件初始化的时候传入当前的视图控制器
       init(viewController: UIViewController) {
           self.viewController = viewController
            
           //初始化活动状态指示器
        self.spinner = UIActivityIndicatorView(style: .gray)
           self.spinner.center = self.viewController.view.center
       }
        
       //开始发起请求
       func willSend(_ request: RequestType, target: TargetType) {
           //请求时在界面中央显示一个活动状态指示器
           viewController.view.addSubview(spinner)
           spinner.startAnimating()
       }
        
       //收到请求
       func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
           //移除界面中央的活动状态指示器
           spinner.removeFromSuperview()
           spinner.stopAnimating()
            
           //只有请求错误时会继续往下执行
           guard case let Result.failure(error) = result else { return }
            
           //弹出并显示错误信息
           let message = error.errorDescription ?? "未知错误"
           let alertViewController = UIAlertController(title: "请求失败",
                                                       message: "\(message)",
                                                       preferredStyle: .alert)
           alertViewController.addAction(UIAlertAction(title: "确定", style: .default,
                                                       handler: nil))
           viewController.present(alertViewController, animated: true)
       }

}
