//
//  SHomeCell.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

// 01. 定义协议
protocol CustomCollectionViewDelegate: NSObjectProtocol{
    // 02. 定义协议方法
    func whiteButtonClick ()
}



class SHomeCell: UICollectionViewCell {
      var titleLabel: UILabel!
       var imageView: UIImageView!
    
    
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
      weak var delegate: CustomCollectionViewDelegate?
      
      lazy var button: UIButton = {
         
          let btn = UIButton(type: UIButton.ButtonType.custom)
          btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
          btn.backgroundColor = UIColor.white
          btn.frame = CGRect(x: 50, y: 20, width: 60, height: 60)
          btn.addTarget(self, action: #selector(ButtonClick), for: .touchUpInside)
          return btn
      }()
       
    
    
    
    
    
       override init(frame: CGRect) {
           super.init(frame: frame)
           
           imageView = UIImageView()
           imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.width)
           imageView.contentMode = .scaleAspectFit
           
           titleLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.origin.y + imageView.frame.size.width + 10, width: self.bounds.size.width, height: 20))
           titleLabel.textAlignment = .center
           
           addSubview(imageView)
           addSubview(titleLabel)
           self.backgroundColor = UIColor.randomColor
        
        
        addSubview(button)

       }
      
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    @objc func ButtonClick() {
           // 04. 执行代理
           delegate?.whiteButtonClick()
       }
}
