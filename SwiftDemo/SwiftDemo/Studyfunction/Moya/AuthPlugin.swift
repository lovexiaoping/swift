//
//  AuthPlugin.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

import Foundation
import Moya


/*
 这个是本文的重点，自定义插件要实现 PluginType 协议接口。该协议定义的四个方法上面介绍过了，这里我们只要实现 prepare 方法，在准备发起请求时对请求进行修改：增加一个名为“Authorization”的 http header，其内容为传入的 token 值。

 */
 
struct AuthPlugin: PluginType {
    //令牌字符串
    let token: String
     
    //准备发起请求
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        //将token添加到请求头中
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
}
