//
//  UIImage.swift
//  Git@OSC
//
//  Created by strayRed on 2019/5/22.
//  Copyright © 2019 Git@OSC. All rights reserved.
//

import Foundation


extension UIImage {
    
    //由颜色生成矩形图片
    static func imageWithColor(_ color: UIColor, andSize size: CGSize) -> UIImage{
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    //由颜色生成圆形图片
    static func roundImageWith(color: UIColor, diameter: CGFloat) -> UIImage {
        let rect = CGRect.init(x: 0, y: 0, width: diameter, height: diameter)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fillEllipse(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
