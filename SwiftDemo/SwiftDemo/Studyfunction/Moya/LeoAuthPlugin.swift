//
//  LeoAuthPlugin.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//


/**
 3，功能改进一：发起请求时再去获取 token

 （1）有时我们在创建插件的时候并不知道 tocken 值（可能需要登录后才能得到）。这里对插件做个修改，改成请求时从一个 token 数据源对象中获取 token 值。

 */

import Foundation
import Moya
 
//用于存储令牌字符串
class TokenSource {
    var token: String?
    init() { }
}

struct LeoAuthPlugin: PluginType {
    //获取令牌字符串方法
    let tokenClosure: () -> String?
     
    //准备发起请求
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        //获取获取令牌字符串
        if let token = tokenClosure() {
            //将token添加到请求头中
            request.addValue(token, forHTTPHeaderField: "Authorization")
        }
        return request
    }
}

