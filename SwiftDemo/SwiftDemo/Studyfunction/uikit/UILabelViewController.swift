//
//  UILabelViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UILabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置标签x坐标：10，y坐标：20，长：300，宽：100
               let label = UILabel(frame:CGRect(x:10, y:20, width:300, height:100))
               label.text = "hangge.com"
               self.view.addSubview(label);
        
        
        
        //文字阴影的设置
        label.shadowColor = UIColor.gray  //灰色阴影
        label.shadowOffset = CGSize(width:1.5, height:1.5)  //阴影的偏移量
        
        
        label.font = UIFont(name:"Zapfino", size:20)
        
        
        //文字过长时的省略方式
        label.lineBreakMode = .byTruncatingTail  //隐藏尾部并显示省略号
        label.lineBreakMode = .byTruncatingMiddle  //隐藏中间部分并显示省略号
        label.lineBreakMode = .byTruncatingHead  //隐藏头部并显示省略号
        label.lineBreakMode = .byClipping  //截去多余部分也不显示省略号
        
        //文字大小自适应标签宽度
        label.adjustsFontSizeToFitWidth = true //当文字超出标签宽度时，自动调整文字大小，使其不被截断
        
        label.numberOfLines = 2  //显示两行文字（默认只显示一行，设为0表示没有行数限制）
        
        //设置文本高亮
        label.isHighlighted = true
        //设置文本高亮颜色
        label.highlightedTextColor = UIColor.green
        
        
        
        
        
        
        //富文本设置
        let attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
       
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    

}
