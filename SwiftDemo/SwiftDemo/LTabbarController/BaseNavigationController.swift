//
//  BaseNavigationController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/19.
//

import UIKit

class BaseNavigationController: UINavigationController,UINavigationControllerDelegate {

    var popDelegate:UIGestureRecognizerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationBar字体颜色设置
        self.navigationBar.barTintColor = UIColor.black
        //navigationBar字体颜色设置
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self


        // Do any additional setup after loading the view.
    }
    
    //MARK: - UIGestureRecognizerDelegate代理
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    //实现滑动返回的功能
    //清空滑动返回手势的代理就可以实现
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer?.delegate = nil;
        }
    }
    //拦截跳转事件
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
        viewController.hidesBottomBarWhenPushed = true
        //添加图片
        //viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_left_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftClick))
        //添加文字
        //viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(leftClick))
       
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_left_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftClick))

        
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    //返回上一层控制器
    @objc func leftClick()  {
        popViewController(animated: true)
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
