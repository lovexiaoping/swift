//
//  UITextViewViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UITextViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textview = UITextView(frame:CGRect(x:10, y:100, width:200, height:100))
        textview.layer.borderWidth = 1  //边框粗细
        textview.layer.borderColor = UIColor.gray.cgColor //边框颜色
        self.view.addSubview(textview)
        
        //是否可编辑
        textview.isEditable = false
       
        
        
        
        //给文字中的电话号码和网址自动加链接
        textview.dataDetectorTypes = [] //都不加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.phoneNumber //只有电话加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.link //只有网址加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.all //电话和网址都加
        

        
        
        //内容是否可选
        textview.isSelectable = false
        //自定义选择内容后的菜单
        
        
//       let mail = UIMenuItem(title: "邮件", action: #selector(ViewController.onMail))
//        let weixin = UIMenuItem(title: "微信", action: #selector(ViewController.onWeiXin))
//        let menu = UIMenuController()
//        menu.menuItems = [mail,weixin]
        // Do any additional setup after loading the view.
    }
    @objc func onMail(){
           print("mail")
       }
        
       @objc func onWeiXin(){
           print("weixin")
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
