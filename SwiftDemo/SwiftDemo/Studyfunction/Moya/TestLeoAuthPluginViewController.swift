//
//  TestLeoAuthPluginViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

/**
 （2）下面是使用样例。可以看到我们初始化插件的时候并不需要传入具体的 token 值，而是将 token 值保存在 TokenSource 对象中。后面如果发起请求会自动从该对象中获取 token 值。

 */

import UIKit
import Moya
class TestLeoAuthPluginViewController: UIViewController {

    //定义token源对象
    let source = TokenSource()
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        MoyaProvider<Httpbin>(plugins:[])

        //初始化豆瓣FM请求的provider（并使用自定义插件）
        let HttpbinProvider = MoyaProvider<Httpbin>(plugins: [
            AuthPlugin(token: "")
        ])
        //设置token串
        source.token = "hangge12345"
        
        
        //使用我们的provider进行网络请求（获取频道列表数据）
        HttpbinProvider.request(.anything("")) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                //...
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
//    func request(_ target: Target, callbackQueue: DispatchQueue?, progress: Moya.ProgressBlock?, completion: @escaping Moya.Completion) -> Cancellable

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
