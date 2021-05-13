//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/8.
//

import UIKit
import RxSwift

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var testv1: Int?  = 1
    var appName: String? 
    
     var isForceLandscape: Bool = false
     var isForcePortrait: Bool = false

    //提供一个公开的用来去获取单例的方法
    class func sharedAppDelegate() ->AppDelegate {
        
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        
        return myAppdelegate
    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupbar()
      
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.testv1 = 4

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
    

    
    
    
    
    func setupbar() {
        let bar = UINavigationBar.appearance()
        bar.isTranslucent =  false
        bar.barTintColor = .theme
        bar.tintColor = .white
        bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }

}

