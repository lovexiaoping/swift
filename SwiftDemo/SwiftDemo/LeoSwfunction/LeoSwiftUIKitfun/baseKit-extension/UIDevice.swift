//
//  SwiftDeviceConst.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/22.
//
import UIKit
import Foundation

extension UIDevice {
   

    
    
    

    func SCREEN_WIDTH() -> CGFloat{
         return UIScreen.main.bounds.size.width
    }

    func SCREEN_HEIGHT() -> CGFloat{
         return UIScreen.main.bounds.size.height
    }


    func BUNDLE_DISPLAYNAME() -> Any{
        //应用程序信息
       let infoDictionary = Bundle.main.infoDictionary!
       let appDisplayName = infoDictionary["CFBundleDisplayName"] //程序名称
        return "\(appDisplayName)"
    }
    func BUNDLE_VERSION() -> String{
        //应用程序信息
       let infoDictionary = Bundle.main.infoDictionary!
        let majorVersion = infoDictionary["CFBundleShortVersionString"] as? String //主程序版本号
        return "\(majorVersion)"
    }
    func BUNDLE_SHORTVERSION() -> Any{
        //应用程序信息
       let infoDictionary = Bundle.main.infoDictionary!
        let Version  = infoDictionary["CFBundleVersion"] as? String //版本号（内部标示）
        return Version
    }


    //获取版本号
    func appVersion() -> String {
           guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, let bundle = Bundle.main.infoDictionary?["CFBundleVersion"] as? String  else {
               return ""
           }
           return  "\(version):\(bundle)"
       }
    
}
