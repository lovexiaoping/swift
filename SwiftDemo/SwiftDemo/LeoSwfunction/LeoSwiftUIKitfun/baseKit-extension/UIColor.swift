//
//  UIColor.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

import Foundation
import UIKit


extension UIColor {
 
    //返回随机颜色
        open class var randomColor:UIColor{
            get
            {
                let red = CGFloat(arc4random()%256)/255.0
                let green = CGFloat(arc4random()%256)/255.0
                let blue = CGFloat(arc4random()%256)/255.0
                return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            }
        }
    

    //颜色 RGB
    func COLORFROMRGB(r:CGFloat,_ g:CGFloat,_ b:CGFloat, alpha:CGFloat) -> UIColor{
        
         return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: alpha)
    }
    //颜色 十六进制
    func COLORFROM16(h:Int) ->UIColor {
        
        return COLORFROMRGB(r: CGFloat(((h)>>16) & 0xFF), CGFloat(((h)>>8) & 0xFF), CGFloat((h) & 0xFF), alpha: 1.0)
    }
    
    
    
    static var lucidBlack: UIColor { return UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3) }
    
    static var icon: UIColor {
        return UIColor.init(red: 210/255, green: 20/255, blue: 23/255, alpha: 1)
    }
    
    static var theme: UIColor {
        return UIColor.init(red: 52/255, green: 79/255, blue: 132/255, alpha: 1)
    }
    
    static var themeTextUnselected: UIColor {
        return UIColor.init(red: 85/255, green: 130/255, blue: 170/255, alpha: 1)
    }
    
    static var lucidGray: UIColor {
        return UIColor.init(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    }
    


}
