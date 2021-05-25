//
//  UIStepperViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit


//微调器（UIStepper）控件包含两个按钮“+”和“-”，让使用者可以依照自己的喜欢做数值上的调整。
class UIStepperViewController: UIViewController {

    
    var stepper:UIStepper!
      var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper=UIStepper()
        stepper.center=self.view.center
        //设置stepper的范围与初始值
        stepper.maximumValue=10
        stepper.minimumValue=1
        stepper.value=5.5
        //设置每次增减的值
        stepper.stepValue=0.5
        //设置stepper可以按住不放来连续更改值
        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        stepper.wraps=true
    
        
        //使用tintColor属性可以设置微调器的颜色。 而加减符号图标，背景图片，中间分割线图片都可以替换成自己图片。
        //用自定义的图片替换“-”和“+”
        
        
        // Do any additional setup after loading the view.
    }
    
    func stepperValueIschanged(){
           label.text="当前值为：\(stepper.value)"
        }
}
