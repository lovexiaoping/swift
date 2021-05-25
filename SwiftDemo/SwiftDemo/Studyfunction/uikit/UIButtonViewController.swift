//
//  UIButtonViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UIButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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



extension UIButtonViewController {
    
    /*
        UIButtonType.system：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
        UIButtonType.custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
        UIButtonType.contactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
        UIButtonType.detailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
        UIButtonType.infoDark：为感叹号“!”圆形按钮
        UIButtonType.infoLight：为感叹号“!”圆形按钮
    
     
     */
  
    
    func button1()  {
        
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        //设置按钮位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        button.setTitle("按钮", for:.normal)
        self.view.addSubview(button)
        
        //不传递触摸对象（即点击的按钮）
        button.addTarget(self, action:#selector(tapped2), for:.touchUpInside)
        
    }
    @objc func tapped2(){
         print("tapped")
    }
     
    
    
    func button2()  {
        //对于Custom定制类型按钮，代码可简化为：
        let button = UIButton(frame:CGRect(x:10, y:150, width:100, height:30))
        
        
        //按钮的文字设置
        button.setTitle("普通状态", for:.normal) //普通状态下的文字
        button.setTitle("触摸状态", for:.highlighted) //触摸状态下的文字
        button.setTitle("禁用状态", for:.disabled) //禁用状态下的文字
        
        
        //按钮文字阴影颜色的设置
        button.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        button.setTitleColor(UIColor.green, for: .highlighted) //触摸状态下文字的颜色
        button.setTitleColor(UIColor.gray, for: .disabled) //禁用状态下文字的颜色
        
        
        //传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号
        button.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
         
        
        
    }
  
    @objc func tapped(_ button:UIButton){
         print(button.title(for: .normal))
    }
    
    
    
    

}
