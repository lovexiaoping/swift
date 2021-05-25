//
//  NotifyViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit

class NotifyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: NSNotification.Name(PHOTO_NOTOFI_NAME), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refuslt), name: NSNotification.Name(PHOTO_NOTOFI_NAME), object: nil)


        // Do any additional setup after loading the view.
    }
    //实现通知监听方法

    @objc func refuslt(){
        
    }
    //最后要记得移除通知
        deinit {
            /// 移除通知
            NotificationCenter.default.removeObserver(self)
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
