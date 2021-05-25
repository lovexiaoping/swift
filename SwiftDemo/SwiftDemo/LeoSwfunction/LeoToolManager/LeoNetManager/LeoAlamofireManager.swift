//
//  LeoAlamofireManager.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//  使用教程  https://www.jianshu.com/p/4381fe8e10b6


import UIKit
import Alamofire


//MARK:--监听网络状态RLHTTPManage

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




//网络请求方式的Key
let BWRequestMethodKey = "BWRequestMethodKey"
//网络请求成功的回调 闭包表达式 (tempstring :String)->(int)
typealias BWNetworkSuccess = (_ isSuccess: Bool, _ code: String, _ hint: String, _ list: AnyObject, _ responseData: AnyObject) -> Void
//网络请求失败的回调
typealias BWNetworkFail = (_ error: AnyObject) -> Void






//MARK:--网络管理封装LeoAlamofireManager
//参考 https://www.jianshu.com/p/b7174ed30901
class LeoAlamofireManager: NSObject {
    /// 网络工具类单例
    static let shared = LeoAlamofireManager()

    
    
    
    
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
        

        let headers: HTTPHeaders = [
            "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
            "Accept": "application/json"
        ]
        AF.request("",headers: headers).responseJSON { (response) in
            debugPrint(response)

        }
        
        
        
        //MARK:-- 响应处理 Alamofire 提供了4种 Response序列化工具


        
        
        //StringResponseSerializer 解析为String
        //示例
        AF.request("https://httpbin.org/get").responseString { response in
            debugPrint("Response: \(response)")
        }
        
        //DataResponseSerializer 解析为Data

        //示例
        AF.request("https://httpbin.org/get").responseData { response in
            debugPrint("Response: \(response)")
        }
        
        //示例 JSONResponseSerializer 解析为JSON

        AF.request("https://httpbin.org/get").responseJSON { response in
            debugPrint("Response: \(response)")
        }
        
        //DecodableResponseSerializer 解析为指定类型<T: Decodable>
        //示例
        struct HTTPBinResponse: Decodable { let url: String }
        AF.request("https://httpbin.org/get").responseDecodable(of: HTTPBinResponse.self) { response in
            debugPrint("Response: \(response)")
        }
        
        //自定义解析
        //DataResponseSerializerProtocol 使用自定义解析 Serializer: DataResponseSerializerProtocol
        AF.request("https://httpbin.org/get").response(responseSerializer: DictionaryResponseSerializer()) { (response) in
            switch response.result {
            case .success(let bin):
                debugPrint(bin)
            case .failure(let error):
                debugPrint(error)
            }
        }
        
    }
    
    
    
    private func networkListening() {
        

        let net = NetworkReachabilityManager.init(host: "https://gitee.com")
       
// 
    }
}
//MARK:- LeoAlamofireManager 扩展
extension LeoAlamofireManager {
    
    class func GET(URLString: String,successed:@escaping (_ responseObject: AnyObject) -> (), failed: @escaping (_ error: NSError?) -> ()){
            AF.request(URLString).response(responseSerializer: DictionaryResponseSerializer()) { (response) in
                switch response.result {
                  case .success(let bin):
                        debugPrint(bin)
                        successed(response.result as AnyObject);
                  case .failure(let error):
                        debugPrint(error)
                        failed(error as NSError);
                  }
                      
            }
    }
    
    
    
    
    // --GET请求获取JSON数据
    //@escaping 标记逃逸闭包
    class func GETWithPrms<Parameters: Encodable>(URLString: String, parms:Parameters? = nil,successed:@escaping (_ responseObject: AnyObject) -> (), failed: @escaping (_ error: NSError?) -> ()){
        
    
        AF.request(URLString,
                   method: .get,
                   parameters: parms,
                   encoder: JSONParameterEncoder.default).response { response in
                    debugPrint(response)
                    switch response.result {
                      case .success(let bin):
                            successed(response.result as AnyObject);
                      case .failure(let error):
                            failed(error as NSError);
                      }
        }
    }

    
    
    // --GET请求获取JSON数据
    //@escaping 标记逃逸闭包
    
    /**
     //请求参数和参数编码器
     //Alamofire 支持将任何 Encodable 类型作为请求的参数。然后，这些参数通过遵循 ParameterEncoder 协议的类型传递，并添加到 URLRequest 中，然后通过网络发送。Alamofire 包含两种遵循 ParameterEncoder 的类型：JSONParameterEncoder 和 URLEncodedFormParameterEncoder 。这些类型涵盖了现代服务使用的最常见的编码。

     struct Login: Encodable {
         let email: String
         let password: String
     }

     let login = Login(email: "test@test.test", password: "testPassword")
      参数可以传 login  自动解码 转成需要的格式
     let parameters = ["foo": "bar"]
     let parameters2: Dictionary = ["kw":"青春","pi":"1","pz":"2"]

     */
    class func POSTWithPrms<Parameters: Encodable>(URLString: String, parms:Parameters? = nil,successed:@escaping (_ responseObject: AnyObject) -> (), failed: @escaping (_ error: NSError?) -> ()){
        
        AF.request(URLString,
                   method: .post,
                   parameters: parms,
                   encoder: JSONParameterEncoder.default).response { response in
                    debugPrint(response)
                    switch response.result {
                      case .success(let bin):
                            debugPrint(bin)
                            successed(response.result as AnyObject);
                      case .failure(let error):
                            failed(error as NSError);
                      }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //示例 自定义解析为 Dictionary
    public final class DictionaryResponseSerializer: ResponseSerializer {
        public func serialize(request: URLRequest?,
                              response: HTTPURLResponse?,
                              data: Data?, error: Error?) throws -> Dictionary<String, Any> {
            guard error == nil else { throw error! }

            guard let data = data, !data.isEmpty else {
                guard emptyResponseAllowed(forRequest: request, response: response) else {
                    throw AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
                }
                return [:]
            }
            do {
                return try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! Dictionary<String, Any>
            } catch {
                throw AFError.responseSerializationFailed(reason: .jsonSerializationFailed(error: error))
            }
        }
    }
    
}
