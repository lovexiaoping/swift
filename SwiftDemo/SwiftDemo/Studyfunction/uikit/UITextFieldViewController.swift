//
//  UITextFieldViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UITextFieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textField = UITextField(frame: CGRect(x:10, y:60, width:200, height:30))
        //设置边框样式为圆角矩形
        textField.borderStyle = .roundedRect
        self.view.addSubview(textField)

        
        
        //修改边框颜色、粗细、圆角半径
        
        
        textField.placeholder="请输入用户名"
         
        //修改圆角半径的话需要将masksToBounds设为true
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 12.0  //圆角半径
        textField.layer.borderWidth = 2.0  //边框粗细
        textField.layer.borderColor = UIColor.red.cgColor //边框颜色
        
        
        //文字大小超过文本框长度时自动缩小字号，而不是隐藏显示省略号
        textField.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        textField.minimumFontSize=14  //最小可缩小的字号
        
        
        
        
        
        
        /** 水平对齐 **/
//        textField.textAlignment = .right //水平右对齐
//        textField.textAlignment = .center //水平居中对齐
//        textField.textAlignment = .left //水平左对齐
//
//        /** 垂直对齐 **/
//        textField.contentVerticalAlignment = .top  //垂直向上对齐
//        textField.contentVerticalAlignment = .center  //垂直居中对齐
//        textField.contentVerticalAlignment = .bottom  //垂直向下对齐
//
//        //背景图片设置
//        textField.borderStyle = .none //先要去除边框样式
//        textField.background = UIImage(named:"background1");
//
//
//
//        //清除按钮（输入框内右侧小叉）
//        textField.clearButtonMode = .whileEditing  //编辑时出现清除按钮
//        textField.clearButtonMode = .unlessEditing  //编辑时不出现，编辑后才出现清除按钮
//        textField.clearButtonMode = .always  //一直显示清除按钮
//
        
        
        //密码输入框
        textField.isSecureTextEntry = true //输入内容会显示成小黑点
        
        
        /*
         设置文本框关联的键盘类型
         Default：系统默认的虚拟键盘
         ASCII Capable：显示英文字母的虚拟键盘
         Numbers and Punctuation：显示数字和标点的虚拟键盘
         URL：显示便于输入url网址的虚拟键盘
         Number Pad：显示便于输入数字的虚拟键盘
         Phone Pad：显示便于拨号呼叫的虚拟键盘
         Name Phone Pad：显示便于聊天拨号的虚拟键盘
         Email Address：显示便于输入Email的虚拟键盘
         Decimal Pad：显示用于输入数字和小数点的虚拟键盘
         Twitter：显示方便些Twitter的虚拟键盘
         Web Search：显示便于在网页上书写的虚拟键盘
         */
        textField.keyboardType = UIKeyboardType.numberPad
        //使文本框在界面打开时就获取焦点，并弹出输入键盘
        textField.becomeFirstResponder()
        //使文本框失去焦点，并收回键盘
        textField.resignFirstResponder()
        
        
        //设置键盘 return 键的样式
        textField.returnKeyType = UIReturnKeyType.done //表示完成输入
        textField.returnKeyType = UIReturnKeyType.go //表示完成输入，同时会跳到另一页
        textField.returnKeyType = UIReturnKeyType.search //表示搜索
        textField.returnKeyType = UIReturnKeyType.join //表示注册用户或添加数据
        textField.returnKeyType = UIReturnKeyType.next //表示继续下一步
        textField.returnKeyType = UIReturnKeyType.send //表示发送
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //键盘 return 键的响应
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           //收起键盘
           textField.resignFirstResponder()
           //打印出文本框中的值
           print(textField.text ?? "")
           return true
       }

}
