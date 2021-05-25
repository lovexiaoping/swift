//
//  TestStrCreateObjViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class TestStrCreateObjViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    
    
    
    
    private func addChildViewController(childName : String , title : String){
        if let childVCClass = NSClassFromString(className) {
//            childVCClass.title = title
        }
    }
    private func addChildViewController2(childName : String , title : String){
        
        //获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleIdentifier"] as? String else {
            //没有命名空间
            return
        }
        
        
        //根据字符串获取对应的class
        
        guard let childVCClass = NSClassFromString(className) else {
            print("没有获取对应字符串的class")

            return;
        }
        
        //将对应的AnyObject转换成控制器type
        guard let childVCtype = childVCClass as? UIViewController.Type else {
            print("没有获取对应的控制器的类型")
            return;
        }
        
        //创建对应的控制器对象
        let childVC = childVCtype.init()
        //设置子控制器的属性
        childVC.title = title
        
        //包装导航栏
       let nav = UINavigationController(rootViewController: childVC)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
