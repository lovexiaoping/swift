//
//  SFirstViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

class SFirstViewController: WSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        showTabbarItem = true;
        hiddenBackItem = true;
        
        addBtns()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden  = true
    }
   
    func addBtns() {
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y:50, width: 60, height: 50)
        button.setTitle("详情", for: .normal)
        button.backgroundColor = UIColor.red
        SView.addSubview(button)
        button.addTarget(self, action: #selector(pushDetail), for: .touchUpInside)

        
        let button2  = UIButton(type: .custom)
        button2.frame = CGRect(x: 150, y:50, width: 100, height: 50)
        button2.setTitle("功能列表", for: .normal)
        button2.backgroundColor = UIColor.red
        SView.addSubview(button2)
        button2.addTarget(self, action: #selector(pushfunctionList), for: .touchUpInside)

        
        let button3  = UIButton(type: .custom)
        button3.frame = CGRect(x: 50, y:150, width: 60, height: 50)
        button3.setTitle("闭包", for: .normal)
        button3.backgroundColor = UIColor.red
        SView.addSubview(button3)
        button3.addTarget(self, action: #selector(pushClosures), for: .touchUpInside)

    }
    @objc func pushDetail(){
        
        let VC = SWDetailViewController.init()
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
   
    
    @objc func pushClosures(){
        
        let VC = TestClosuresViewController.init()
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
    @objc func pushfunctionList(){
        
        let VC = HomeTableViewController.init()
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
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
