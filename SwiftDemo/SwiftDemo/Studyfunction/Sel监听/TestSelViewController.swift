//
//  TestSelViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class TestSelViewController: UIViewController {

    var btn1 : UIButton = UIButton()
    var btn2 : UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //监听按钮的点击 两种写法
        btn1.addTarget(self, action: Selector("composerbtn1Click"), for: .touchUpInside)
        btn2.addTarget(self, action: "composerbtn2Click", for: .touchUpInside)

        
        // Do any additional setup after loading the view.
    }
    
    
}
//MARK:-事件监听
extension TestSelViewController{
    //事件监听本质发送消息，但是发送消息是OC的特性
    //将方法包装成@SEL ->类中查找方法列表 ->根据@SLE找到imp指针(函数指针)
    func composerbtn1Click() {
        print("composerbtn1Click")
    }
    func composerbtn2Click() {
        print("composerbtn2Click")

    }
    
    
    //在swift中函数声明为private，那么不会被添加到方法列表中   所以监听找不到
    private   func composerbtn3Click() {

    }
    
    //在swift中 private 前加@objc 方法依然会被添加到方法列表中
    @objc private   func composerbtn4Click() {

    }
    
}
