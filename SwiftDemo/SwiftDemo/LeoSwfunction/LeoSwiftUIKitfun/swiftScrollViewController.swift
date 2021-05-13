//
//  swiftScrollViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/22.
//

import UIKit

class swiftScrollViewController: UIViewController {

    var loginScrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginScrollView)
        loginScrollView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view.mas_top)?.offset()(0)
            make?.bottom.equalTo()(self.view.mas_bottom)?.offset()(0)
            make?.left.equalTo()(self.view.mas_left)
            make?.width.mas_equalTo()(KJHelper.SCREEN_WIDTH)
        }

        // Do any additional setup after loading the view.
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
