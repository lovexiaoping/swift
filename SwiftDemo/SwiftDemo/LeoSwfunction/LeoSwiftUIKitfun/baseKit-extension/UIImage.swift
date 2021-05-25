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
    
    
    
    /**
         根据坐标获取图片中的像素颜色值
        // 获取图片
             let image = UIImage(named: "img")!
             let width = Int(image.size.width)
             let height = Int(image.size.height)
             print("图片尺寸：", "\(width) * \(height)")
              
             // 获取指定像素颜色
             if let hexString = image[0, 0]?.hexString {
                 print("左上角颜色：", hexString)
             }
             if let hexString = image[width, 0]?.hexString {
                 print("右上角颜色：", hexString)
             }
             if let hexString = image[width/2, height/2]?.hexString {
                 print("中间点颜色：", hexString)
             }
     
    */
        subscript (x: Int, y: Int) -> UIColor? {
             
            if x < 0 || x > Int(size.width) || y < 0 || y > Int(size.height) {
                return nil
            }
             
            let provider = self.cgImage!.dataProvider
            let providerData = provider!.data
            let data = CFDataGetBytePtr(providerData)
             
            let numberOfComponents = 4
            let pixelData = ((Int(size.width) * y) + x) * numberOfComponents
             
            let r = CGFloat(data![pixelData]) / 255.0
            let g = CGFloat(data![pixelData + 1]) / 255.0
            let b = CGFloat(data![pixelData + 2]) / 255.0
            let a = CGFloat(data![pixelData + 3]) / 255.0
             
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
}
