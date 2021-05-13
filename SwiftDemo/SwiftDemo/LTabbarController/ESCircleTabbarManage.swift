//
//  ESCircleTabbarManage.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

class ESCircleTabbarManage: NSObject {
    //在单例类中，有一个用来共享数据的数组
    var datas = [String]()
    //创建一个静态或者全局变量，保存当前单例实例值
    private static let singleECircleInstance = ESCircleTabbarManage()
    //私有化构造方法
    private override init() {
        //给数组加一个原始数据
        datas.append("SI")
    }
    //提供一个公开的用来去获取单例的方法
    class func defaultSingleESCircleTabInstance() ->ESCircleTabbarManage {
        //返回初始化好的静态变量值
        return singleECircleInstance
    }

    func loadECircleTabbar()  {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = nil
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                alertController.addAction(takePhotoAction)
                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                alertController.addAction(selectFromAlbumAction)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                tabBarController?.present(alertController, animated: true, completion: nil)
            }
        }

        let v1 = SFirstViewController()
        let v2 = SSecondViewController()
        let v3 = SThirdViewController()
        
        
        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "btn_home"), selectedImage: UIImage(named: "btn_home_highlight"))
        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "btn_home"), selectedImage: UIImage(named: "btn_home_highlight"))
        
        tabBarController.viewControllers = [v1, v2, v3]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        
        AppDelegate.sharedAppDelegate().window?.rootViewController = navigationController
    }

}
