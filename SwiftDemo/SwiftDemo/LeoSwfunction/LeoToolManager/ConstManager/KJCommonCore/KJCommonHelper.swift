//
//  KJCommonHelper.swift
//  KJCommonKit
//
//  Created by 黄克瑾 on 2020/7/8.
//  Copyright © 2020 黄克瑾. All rights reserved.
//

import Foundation
import UIKit


class KJHelper {
    
    /// 屏幕的宽高
    public static let SCREEN_SIZE: CGSize = (UIScreen.main.bounds.size)
    /// 屏幕的宽度
    public static let SCREEN_WIDTH = (SCREEN_SIZE.width)
    /// 屏幕的高度
    public static let SCREEN_HEIGHT = (SCREEN_SIZE.height)
    /// 判断设备是否是iPad
    public static let IS_IPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    /// 判断设备是否是iPhone
    public static let IS_IPhone: Bool = UIDevice.current.model.hasPrefix("iPhone")
    /// 判断设置是否是iPod
    public static let IS_IPod: Bool = UIDevice.current.model.hasPrefix("iPod")
    /// 系统版本
    public static let SystemVersion = UIDevice.current.systemVersion
    /// App info
    public static let AppInfo = Bundle.main.infoDictionary
    /// App 版本号
    public static let AppVersion = AppInfo?["CFBundleShortVersionString"] ?? "0"
    /// App Bundle号
    public static let AppBundle = AppInfo?["CFBundleVersion"] ?? ""
    /// App 名称
    public static let AppName = AppInfo?["CFBundleDisplayName"] ?? ""
    /// App 标识符(identifier)
    public static let AppIdentifier = AppInfo?["CFBundleIdentifier"] ?? ""
    /// App Icons
    public static let AppIconFiles = ((AppInfo?["CFBundleIcons"] as? Dictionary<String, Any>)? ["CFBundlePrimaryIcon"] as? Dictionary<String, Any>)?["CFBundleIconFiles"] ?? Array<String>()
    
    /// 状态栏高度 隐藏状态下为0
    public static func StatusHeight() -> CGFloat {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0
        }
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    /// keyWindow
    public static func KeyWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first
        }
        return UIApplication.shared.keyWindow
    }
    
    /// 安全区域
    public static func SafeAreaInsets() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return KeyWindow()?.safeAreaInsets ?? .zero
        }
        return .zero
    }
    
    /// 安全区域
    public static func isFullScreen() -> Bool {
        if #available(iOS 11, *) {
              guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                  return false
              }
              
              if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                  return true
              }
        }
        return false
    }
    
    public static func kNavigationBarHeight() -> CGFloat {
    
        return KJHelper.isFullScreen() ? 88 : 64
    }
  
//    static var kNavigationBarHeight: CGFloat {
//       //return UIApplication.shared.statusBarFrame.height == 44 ? 88 : 64
//       return isFullScreen ? 88 : 64
//    }
    
    
    
    
    
    
    
    
    
    /// 颜色 - 十六进制
    public static func Color(_ hex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(((hex)>>16) & 0xFF) / 255.0,
                       green:  CGFloat(((hex)>>8) & 0xFF) / 255.0,
                       blue: CGFloat((hex) & 0xFF) / 255.0,
                       alpha: alpha)
    }
    
    /// 颜色 - 字符串
    public static func Color(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        return Color(color, alpha: alpha)
    }
    
    
    /// 根据指定控制器查找当前正在显示的控制器
    /// - Parameter from: 指定的控制器
    /// - Returns: 当前正在显示的控制器
    public static func CurrentShowingViewController(_ from: UIViewController? = nil) -> UIViewController? {
        let fromViewController = from ?? KeyWindow()?.rootViewController
        if let viewController = fromViewController?.presentedViewController {
            // 判断控制器是否有弹出其它视图，如有则当前显示的视图肯定是在其上面
            return CurrentShowingViewController(viewController)
        } else if fromViewController is UITabBarController {
            if let viewController = (fromViewController as! UITabBarController).selectedViewController {
                return CurrentShowingViewController(viewController)
            }
        } else if fromViewController is UINavigationController {
            if let viewController = (fromViewController as! UINavigationController).visibleViewController {
                return CurrentShowingViewController(viewController)
            }
        }
        return fromViewController
    }
    
    
    /// 打印
    /// - Parameters:
    ///   - msg: 打印的内容
    ///   - file: 文件名
    ///   - method: 函数名
    ///   - line: 行数
    public static func print<T>(msg: T,
                                file: String = #file,
                                method: String = #function,
                                line: Int = #line) {
        #if DEBUG
        // 类名
        let name = file.components(separatedBy: "/").last
        // 打印
        Swift.print("\n文件：\(name ?? "")\n函数：\(method)第\(line)行\n信息：\n\(msg)\n")
        #endif
    }
    
}
