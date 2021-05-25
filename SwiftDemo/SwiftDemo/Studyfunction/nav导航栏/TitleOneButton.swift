//
//  TitleOneButton.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class TitleOneButton: UIButton {
    
    //MARK:-重写init方法
    override init(frame:CGRect){
        super.init(frame: frame)
        
        setImage(UIImage(named: "a_up.png"), for: .normal)
        setImage(UIImage(named: "a_down.png"), for: .selected)
        setTitleColor(.black, for: .normal)
        sizeToFit()
    }
    
    //swift 规定 ：重写控件的init相关方法就要 重写： required init?(coder: NSCoder)
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
