//
//  UISliderViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UISliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //滑块的创建
        let slider = UISlider(frame:CGRect(x:0, y:0, width:300, height:50))
        slider.center = self.view.center
        slider.minimumValue = 0  //最小值
        slider.maximumValue = 1  //最大值
        slider.value = 0.5  //当前默认值
        self.view.addSubview(slider)
        //设置滑块的值，同时有动画
        slider.setValue(0.8,animated:true)
        //滑块值改变响应
        slider.isContinuous = false  //滑块滑动停止后才触发ValueChanged事件
        slider.addTarget(self,action:#selector(sliderDidchange(_:)), for:.valueChanged)
         //滑块左右两边槽的颜色
        slider.minimumTrackTintColor = UIColor.red //左边槽的颜色
        slider.maximumTrackTintColor = UIColor.green //右边槽的颜色
        //滑块后面槽线两侧添加图标
        slider.minimumValueImage = UIImage(named:"voice+")  //左边图标
        slider.maximumValueImage = UIImage(named:"voice-")  //右边图标
        
        //自定义滑块组件图片
        //设置滑块右边部分的图片
        slider.setMaximumTrackImage(UIImage(named:"slider_max"),for: .normal)
        //设置滑块左边部分的图片
        slider.setMinimumTrackImage(UIImage(named:"slider_min"),for: .normal)
        //设置滑块的图片
        slider.setThumbImage(UIImage(named:"slider_thumb"),for: .normal)
        //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
        let imgTrackRight = UIImage(named:"slider_max")
        let imgRight = imgTrackRight!.stretchableImage(withLeftCapWidth: 14, topCapHeight:0)
        slider.setMaximumTrackImage(imgRight, for: .normal)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func sliderDidchange(_ slider:UISlider){
        print(slider.value)
    }


}
