//
//  TestAuthPluginViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

import UIKit
import Moya
class TestAuthPluginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        //初始化请求的provider（并使用自定义插件）
        let HttpbinProvider = MoyaProvider<Httpbin>(plugins: [
            AuthPlugin(token: "hangge12345")
        ])
       // 可以看到当我们发起请求时，token 会自动添加到请求头（http header）中。

        //使用我们的provider进行网络请求（获取频道列表数据）
        HttpbinProvider.request(.anything("")) { result in
            if case let .success(response) = result {
                //解析数据]
                let data = try? response.mapJSON()
                let json = JSON(data!)
                //...
                 
            }
        }
        
        
        
        // Do any additional setup after loading the view.
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
