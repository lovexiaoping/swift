//
//  ESTabManage.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

class ESTabManage: NSObject {
    //在单例类中，有一个用来共享数据的数组
    var datas = [String]()
    //创建一个静态或者全局变量，保存当前单例实例值
    private static let singleEInstance = ESTabManage()
    //私有化构造方法
    private override init() {
        //给数组加一个原始数据
        datas.append("SI")
    }
    //提供一个公开的用来去获取单例的方法
    class func defaultSingleESTabInstance() ->ESTabManage {
        //返回初始化好的静态变量值
        return singleEInstance
    }

    func loadtabbar() {
        let tabBarController = ESTabBarController()
        let v1 = SFirstViewController()
        let v2 = SSecondViewController()
        let v3 = SThirdViewController()

       /// MARK: 原生和系统混和设置  不常见
       v1.tabBarItem = ESTabBarItem.init(title: "001", image: UIImage(named: "btn_home"), selectedImage: UIImage(named: "btn_home_highlight"))
        
     
       v2.tabBarItem = ESTabBarItem.init(title: "002", image: UIImage(named: "btn_home"), selectedImage: UIImage(named: "btn_home_highlight"))
   
       v3.tabBarItem = ESTabBarItem.init(title: "003", image: UIImage(named: "btn_home"), selectedImage: UIImage(named: "btn_home_highlight"))
               
               UITabBar.appearance().tintColor = UIColor.red;
   
        v1.navigationItem.title = "Example1"

        tabBarController.viewControllers = [v1, v2, v3]
//        tabBarController.viewControllers = [n1, n2, n3]

        let navigationController = UINavigationController.init(rootViewController: tabBarController)
        AppDelegate.sharedAppDelegate().window?.rootViewController = navigationController
    }
    
}
