//
//  LeoAlamofireManager.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//  使用教程  https://www.jianshu.com/p/4381fe8e10b6


import UIKit
import Alamofire


enum ReachabilityStatus{
    
    case notReachable
    case unknown
    case ethernetOrWiFi
    case wwan
 
}

class RLHTTPManage: NSObject {
    
    static let rlHttpManage = RLHTTPManage()
    func netWorkReachability(reachabilityStatus: @escaping(ReachabilityStatus)->Void){
        
        let manager = NetworkReachabilityManager.init()
        manager!.startListening { (status) in
 
            //wifi
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.reachable(.ethernetOrWiFi){
                
                print("------.wifi")
                 reachabilityStatus(.ethernetOrWiFi)
                
            }
            //不可用
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.notReachable{
                
                  print("------没网")
                reachabilityStatus(.notReachable)
                
            }
            //未知
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.unknown{
 
                print("------未知")
                reachabilityStatus(.unknown)
            }
 
            //蜂窝
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.reachable(.cellular){
                       
                 print("------蜂窝")
                reachabilityStatus(.wwan)
            }
        }
    }
}


class LeoAlamofireManager: NSObject {

    
    
    
    //最简单的下载
    func test(){
        
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
        AF.request("https://httpbin.org/get")
        AF.request("https://httpbin.org/post", method: .post)
        AF.request("https://httpbin.org/put", method: .put)
        AF.request("https://httpbin.org/delete", method: .delete)
        
        
        
        
        
        //请求参数和参数编码器
        //Alamofire 支持将任何 Encodable 类型作为请求的参数。然后，这些参数通过遵循 ParameterEncoder 协议的类型传递，并添加到 URLRequest 中，然后通过网络发送。Alamofire 包含两种遵循 ParameterEncoder 的类型：JSONParameterEncoder 和 URLEncodedFormParameterEncoder 。这些类型涵盖了现代服务使用的最常见的编码。

        struct Login: Encodable {
            let email: String
            let password: String
        }

        let login = Login(email: "test@test.test", password: "testPassword")

        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
        
        //====使用 URL 编码参数的 GET 请求
        
        let parameters = ["foo": "bar"]

        // 下面三种方法都是等价的
        AF.request("https://httpbin.org/get", parameters: parameters) // encoding defaults to `URLEncoding.default`
        AF.request("https://httpbin.org/get", parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
        AF.request("https://httpbin.org/get", parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .methodDependent))

        // https://httpbin.org/get?foo=bar
        
        //====使用 URL 编码参数的 POST 请求
        let parameters1: [String: [String]] = [
            "foo": ["bar"],
            "baz": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]

        // 下面三种方法都是等价的
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters1)
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters1, encoder: URLEncodedFormParameterEncoder.default)
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters1, encoder: URLEncodedFormParameterEncoder(destination: .httpBody))

        // HTTP body: "qux[]=x&qux[]=y&qux[]=z&baz[]=a&baz[]=b&foo[]=bar"
        
        
       //==== JSON 编码参数的 POST 请求

        let parameters2: [String: [String]] = [
            "foo": ["bar"],
            "baz": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]

        AF.request("https://httpbin.org/post", method: .post, parameters: parameters2, encoder: JSONParameterEncoder.default)
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters2, encoder: JSONParameterEncoder.prettyPrinted)
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters2, encoder: JSONParameterEncoder.sortedKeys)

        // HTTP body: {"baz":["a","b"],"foo":["bar"],"qux":["x","y","z"]}
        
        
        
        
    }
    
    
    
    private func networkListening() {
        

        let net = NetworkReachabilityManager.init(host: "https://gitee.com")
       
// 
    }
}
