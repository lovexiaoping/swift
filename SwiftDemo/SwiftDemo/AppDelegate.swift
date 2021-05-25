//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/8.
//

import UIKit
import RxSwift
import UserNotifications//通知管理

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
     var appName: String?
     var isForceLandscape: Bool = false
     var isForcePortrait: Bool = false

    class func sharedAppDelegate() ->AppDelegate {
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        return myAppdelegate
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //设置log
        XCGLoggerExample().setupXCGLogger()
        //设置导航栏
        setupNavBar()
        //测试代码
        TestPerson().test()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootV = ViewController()

        let  rootNav  = UINavigationController.init(rootViewController: rootV)

        self.window?.rootViewController=rootNav

        self.window?.makeKeyAndVisible()
        

        RLHTTPManage.rlHttpManage.netWorkReachability() { (status) in
       
            switch status {
                case .unknown:
                    mainWindow?.show(text: "unknown")
                case .ethernetOrWiFi:
                    mainWindow?.show(text: "ethernetOrWiFi")
               default:
                mainWindow?.show(text: "notReachable")

                
            }
            
        }
        if #available(iOS 10.0, *){
            UNUserNotificationCenter.current().requestAuthorization(options: [.carPlay, .sound, .alert, .badge], completionHandler: { (isSuccess, error) in
                print("授权\(isSuccess ? "成功":"失败")")
            })
        }
        else{
            //申请用户的通知授权，本地的。［上方提示 ／ 声音 ／ badge］
            let notificationSettings = UIUserNotificationSettings(types:[.badge,.alert,.sound], categories:nil)
            application.registerUserNotificationSettings(notificationSettings)
        }
        
        // Override point for customization after application launch.
        return true
    }
    
    
    
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
          
          if (isForceLandscape) {
              //这里设置允许横屏的类型
              return .landscapeRight;
          }else if (isForcePortrait){
              return .portrait;
          }

          return .portrait;
      }

}


//MARK:--
extension AppDelegate {
    
    //设置导航栏UI
    func setupNavBar() {
        let bar = UINavigationBar.appearance()
        bar.isTranslucent =  false
        bar.barTintColor = .theme
        bar.tintColor = .white
        bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    //模拟异步加载json数据
    fileprivate func loadAppInfo(){
        
        DispatchQueue.global().async {
            let url = Bundle.main.url(forResource: "mian.json", withExtension: nil)
            let data = NSData(contentsOf: url!)
            let dire = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonpath = (dire as NSString).appendingPathComponent("main.json")
            data?.write(toFile:jsonpath, atomically: true)
            
            //print("json文件目录\(jsonpath)")
            
        }
    }
}
