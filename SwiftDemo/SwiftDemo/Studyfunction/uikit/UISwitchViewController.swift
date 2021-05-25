//
//  UISwitchViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UISwitchViewController: UIViewController {

    var uiswitch:UISwitch!
    
       override func viewDidLoad() {
           super.viewDidLoad()
        
        
           uiswitch = UISwitch()
           //设置位置（开关大小无法设置）
           uiswitch.center = CGPoint(x:100, y:50)
           //设置默认值
           uiswitch.isOn = true;
           uiswitch.addTarget(self, action: #selector(switchDidChange), for:.valueChanged)
           self.view.addSubview(uiswitch);
       }
        
      @objc func switchDidChange(){
           //打印当前值
           print(uiswitch.isOn)
       }

}
