//
//  NSTimerViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class NSTimerViewController: UIViewController {

    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 启用计时器，控制每秒执行一次tickDown方法
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
        
        
        
        
        //停止定时器
        //timer.invalidate()
        // Do any additional setup after loading the view.
    }
    /**
    *计时器每秒触发事件
    **/
   @objc func tickDown()
    {
         print("tick...")
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
