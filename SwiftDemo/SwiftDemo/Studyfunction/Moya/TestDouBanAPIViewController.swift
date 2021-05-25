//
//  TestDouBanAPIViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

import UIKit
import Moya
class TestDouBanAPIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let provider = MoyaProvider<MultiTarget>()
        provider.request(MultiTarget(DouBan.channels)) { result in
            // do something with `result`
        }
         
        provider.request(MultiTarget(Httpbin.anything(""))) { result in
            // do something with `result`
        }

        // Do any additional setup after loading the view.
    }
    

 
    func updatelistData() {
        
        //初始化豆瓣FM请求的provider（并使用自定义插件）
        let DouBanProvider = MoyaProvider<DouBan>(plugins: [
            RequestAlertPlugin(viewController: self)
        ])
        
        //使用我们的provider进行网络请求（获取频道列表数据）
        DouBanProvider.request(.channels) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                let channels = json["channels"].arrayValue
                
                //刷新表格数据
                DispatchQueue.main.async{

                  // UpdateUI
                }
            }
        }
    }
    
    func getdetail() {
        //使用我们的provider进行网络请求（根据频道ID获取下面的歌曲）
        let channelId = ""
        DouBanProvider.request(.playlist(channelId)) { result in
            if case let .success(response) = result {
                //解析数据，获取歌曲信息
                let data = try? response.mapJSON()
                let json = JSON(data!)
                let music = json["song"].arrayValue[0]
                let artist = music["artist"].stringValue
                let title = music["title"].stringValue
                let message = "歌手：\(artist)\n歌曲：\(title)"
                
                //将歌曲信息弹出显示
                self.showAlert(title: "", message: message)
            }
        }
    }
    //显示消息
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        //self.present(alertController, animated: true, completion: nil)
        alertController.show(self, dismiss: 2)

    
    }
    


}
