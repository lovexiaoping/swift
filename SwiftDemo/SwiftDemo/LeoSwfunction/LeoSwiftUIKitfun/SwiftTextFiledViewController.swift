//
//  SwiftTextFiledViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/22.
//

import UIKit


class SwiftTextFiledViewController: UIViewController ,UITextFieldDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nameTextFiled  = UITextField()
        view.addSubview(nameTextFiled)
        
         nameTextFiled.mas_makeConstraints { (make) in
                  make?.top.equalTo()(self.view.mas_top)?.offset()(0)
                  make?.centerX.mas_equalTo()(self.view.mas_centerX)
                  make?.width.mas_equalTo()(270)
                  make?.height.mas_equalTo()(45)
              }
        
        //设置圆角
              nameTextFiled.layer.cornerRadius = 23
              nameTextFiled.layer.masksToBounds = true
              nameTextFiled.layer.borderWidth = 0.5//        边框宽度
              nameTextFiled.layer.borderColor = UIColor.black.cgColor//边框颜色
              nameTextFiled.backgroundColor = .blue//背景颜色
              nameTextFiled.placeholder = "请输入"// 提示语
              nameTextFiled.text = "name"
    // 边框样式——圆角矩形边框
            nameTextFiled.borderStyle = UITextField.BorderStyle.roundedRect
            
    //        nameTextFiled.borderStyle = UITextField.BorderStyle.none//无边框
    //        nameTextFiled.borderStyle = UITextField.BorderStyle.line//直角矩形边界线
    //        nameTextFiled.borderStyle = UITextField.BorderStyle.bezel//有阴影的边框
            // 完成按钮样式
            nameTextFiled.returnKeyType = UIReturnKeyType.done
            // 清除按钮显示状态
            nameTextFiled.clearButtonMode = UITextField.ViewMode.whileEditing
            /*
             never    从不出现
             whileEditing    开始编辑时出现
             unlessEditing    除了编辑外都出现
             always    一直出现
             */
            // 键盘样式
            nameTextFiled.keyboardType = UIKeyboardType.default
        
        /*
                 default    默认键盘：支持所有字符
                 asciiCapable    支持ASCII的默认键盘
                 numbersAndPunctuation    标准电话键盘，支持+*#等符号
                 URL    URL键盘，有.com按钮；只支持URL字符
                 numberPad    数字键盘
                 phonePad    电话键盘
                 namePhonePad    电话键盘，也支持输入人名字
                 emailAddress    用于输入电子邮件地址的键盘
                 asciiCapableNumberPad    支持ASCII的数字键盘
                 decimalPad    带‘.’的数字键盘
                 twitter    功能齐全键盘，类似asciiCapable
                 webSearch    带有面向url的附加的默认键盘类型
                 
                 */
        // 键盘外观
              nameTextFiled.keyboardAppearance = UIKeyboardAppearance.alert
      /*
               
               default    白色,兼容以前的版本
               dark    黑色
               light    白色
               alert    黑色，兼容以前的版本
               */
              // 安全文本输入，（输入密码）
              nameTextFiled.isSecureTextEntry = true
      //        给TextFiled添加左右两侧的悬浮图
              nameTextFiled.leftViewMode = .always
              nameTextFiled.rightViewMode = .always
        
        
        
             let leftButton = UIButton(type: .infoDark)
             leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
             nameTextFiled.leftView = leftButton
     leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
             
             let rightButton = UIButton(type: .contactAdd)
             rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
             nameTextFiled.rightView = rightButton
     rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - 实现点击方法
    @objc func leftButtonAction(){
        print("leftButtonAction")
    }
    @objc func rightButtonAction(){
        print("rightButtonAction")
    }
    
    // MARK: - UITextField 代理
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            print("将要开始编辑")
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            print("已经开始编辑")
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            print("将要结束编辑")
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            print("已经结束编辑")
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print("文本输入内容发生变化（每次输入都会调用）")
            return true
        }
        
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            print("将要清除输入内容，返回值是是否要清除掉内容")
            return true
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            print("将要按下Return按钮，返回值是是否结束输入（是否失去焦点）")
            return true
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
