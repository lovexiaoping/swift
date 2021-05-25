//
//  MBProgressHUD+Extension.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/11.
//

import Foundation

extension JKPOP where Base: MBProgressHUD {

    // MARK: 显示等待消息
    /// 显示等待消息
    /// - Parameter title: 等待的文字
    static func showWait(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }

    // MARK: 显示普通消息
    /// 显示普通消息
    /// - Parameter title: 普通消息内容
    static func showInfo(_ title: String, image: UIImage? = UIImage(named: "HUD_Info")) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        if let showImage = image {
            hud.customView = UIImageView(image: showImage)
        }
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    // MARK: 显示普通消息
    /// 显示普通消息
    /// - Parameter title: 普通消息内容
    static func showGifInfo(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = customView()
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    static func customView() -> UIView {
        let mainImageView = UIImageView(image: UIImage(named: "loading_1"))
        mainImageView.layer.allowsGroupOpacity = false
        mainImageView.alpha = 1
        mainImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        mainImageView.animationImages = animationImages()
        mainImageView.animationDuration = 0.6
        mainImageView.startAnimating()
        return mainImageView
    }

    static func animationImages() -> [UIImage] {
        var imgList = [UIImage]()
        for index in 1...6 {
            let image = UIImage(named: "loading_\(index)")!
            imgList.append(image)
        }
        return imgList
    }
     
    // MARK: 显示成功消息
    /// 显示成功消息
    /// - Parameter title: 显示成功提示语
    static func showSuccess(_ title: String, image: UIImage? = UIImage(named: "HUD_Success")) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        // 模式设置为自定义视图
        hud.mode = .customView
        // 自定义视图显示图片
        if let showImage = image {
            hud.customView = UIImageView(image: showImage)
        }
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        // HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
 
    // MARK: 显示失败消息
    /// 显示失败消息
    /// - Parameter title: 显示失败消息内容
    static func showError(_ title: String, image: UIImage? = UIImage(named: "HUD_Error")) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        // 自定义视图显示图片
        if let showImage = image {
            hud.customView = UIImageView(image: showImage)
        }
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
 
    // MARK: 获取用于显示提示框的view
    /// 获取用于显示提示框的view
    /// - Returns: 提示框的view
    static func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindow.Level.normal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindow.Level.normal {
                    window = tempWin
                    break
                }
            }
        }
        return window!
    }
    
    // MARK: 隐藏正在显示的视图
    /// 隐藏正在显示的视图
    static func dismiss() {
        let view = viewToShow()
        MBProgressHUD.hide(for: view, animated: true)
    }
}
