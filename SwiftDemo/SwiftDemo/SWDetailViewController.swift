//
//  SWDetailViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/19.
//

import UIKit

class SWDetailViewController: WSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showTabbarItem = false;
        hiddenBackItem = false;
        titleLabel.text = "详情"
        

//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_left_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftClick))

        // Do any additional setup after loading the view.
    }
    @objc func leftClick()  {
        self.navigationController?.popViewController(animated: true)
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


//1. open:可以在任何地方访问、继承和重写
//
//2. public:可以在任何地方被访问，在其他module中不能被继承和重写(一会在详细介绍一下什么是module内和module外)
//
//3. internal:默认访问级别，在整个模块内都可以被访问
//
//4. fileprivate:其修饰的属性可以再同一个文件被访问、继承和重写，同一个文件指同一个swift文件，一个文件中可以有多个类
//
//5. private:其修饰的属性和方法只能在本类被访问和使用，不包括扩展类
