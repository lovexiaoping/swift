//
//  HttpbinAPI.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//


/*
自定义一个授权插件
通过 JWT（JSON Web 令牌）或其他类型的访问令牌来授权 API 请求在开发中比较常见的。我们下面创建一个可用于自动向请求添加令牌的插件。这样就省的每个请求再去手动一个个添加令牌。
HTTP Basic认证介绍：
浏览器和 web 服务器之间可以通过 cookie 来身份识别。而桌面应用程序、或者移动应用也可以通过 HTTP 协议跟 Web 服务器交互， 但桌面或移动应用程序一般不会使用 cookie，而是把“用户名+冒号+密码”用 BASE64 编码的字符串放在 http request 中的 header Authorization 中发送给服务端，这种方式叫 HTTP 基本认证(Basic Authentication)。具体认证过程如下：
当客户端每次请求数据时，会将用户名及密码以 BASE64 加密，并将密文附加于请求头（Request Header）中。
HTTP 服务器在每次收到请求包后，根据协议取得客户端附加的用户信息（BASE64 加密的用户名和密码），解开请求包，对用户名及密码进行验证，如果用户名及密码正确，则根据客户端请求，返回客户端所需要的数据。否则，返回错误代码或重新要求客户端提供用户名及密码。
*/
import UIKit
import Foundation
import Moya

/** 下面定义请求的endpoints（供provider使用）**/

let HttpbinProvider = MoyaProvider<Httpbin>()

//请求分类
public enum Httpbin {
    case ip
    case anything(String)  //请求数据
}


extension Httpbin: TargetType {
    //服务器地址
        public var baseURL: URL {
            return URL(string: "http://httpbin.org")!
        }
         
        //各个请求的具体路径
        public var path: String {
            switch self {
            case .ip:
                        return "/ip"
            case .anything:
                return "/anything"
            }
        }
         
        //请求类型
        public var method: Moya.Method {
            return .post
        }
         
        //请求任务事件（这里附带上参数）
        public var task: Task {
            switch self {
                    case .anything(let param1):
                        var params: [String: Any] = [:]
                        params["param1"] = param1
                        params["param2"] = "2017"
                        //将 param3 参数置为 nil。
                        params["param3"] = nil
                        return .requestParameters(parameters: params,
                                                  encoding: URLEncoding.default)
                    default:
                        return .requestPlain
                    }
            
        }
         
        //是否执行Alamofire验证
        public var validate: Bool {
            return false
        }
         
        //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
        public var sampleData: Data {
            return "{}".data(using: String.Encoding.utf8)!
        }
         
        //请求头
        public var headers: [String: String]? {
            return nil
        }
}
