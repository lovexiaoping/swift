//
//  UIImageEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/7/23.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit


extension UIImage {
    
    @objc enum KJDrawStyle: Int {
        // 等比例
        case scale = 0
        // 固定宽高
        case fixed = 1
    }
    
    /// 高度
    @objc var height: CGFloat {
        return size.height
    }
    
    /// 宽度
    @objc var width: CGFloat {
        return size.width
    }
    
    
    /// 绘制
    /// - Parameters:
    ///   - toSize: 指定宽高
    ///   - style: 绘制方式
    /// - Returns: 绘制完后的图片
    @objc func kj_draw(_ toSize: CGSize,
                       style: UIImage.KJDrawStyle = .scale) -> UIImage {
        var newSize = toSize
        if style == .scale {
            let tempHeight = height / toSize.height
            let tempWidth = width / toSize.width
            if tempWidth > 1.0 && tempWidth > tempHeight {
                let newWidth = CGFloat(floorf(Float(width / tempWidth)))
                let newHeight =  CGFloat(floorf(Float(height / tempWidth)))
                newSize = CGSize(width:newWidth, height:newHeight)
            } else if tempHeight > 1.0 && tempWidth < tempHeight {
                let newWidth = CGFloat(floorf(Float(width / tempHeight)))
                let newHeight =  CGFloat(floorf(Float(height / tempHeight)))
                newSize = CGSize(width:newWidth, height:newHeight)
            }
        }
        
        UIGraphicsBeginImageContext(newSize)
        draw(in: CGRect(x: 0,
                        y: 0,
                        width: newSize.width,
                        height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? self
    }
    
    
    /// 压缩至指定 kb
    /// - Parameter maxLength: kb单位
    /// - Returns: 压缩后的Data
    @objc func kj_compress(_ maxLength: Int = 100) -> Data? {
        
        // 先判断当前质量是否满足要求，不满足再进行压缩
        var finallData = jpegData(compressionQuality: 1.0)
        if (finallData?.count ?? 0) / 1024 <= maxLength {
            return finallData
        }
        // 原图的宽高比
        let ratio = width / height
        // 先调整分辨率
        let defaultSize = CGSize(width: 1024.0, height: 1024.0 / ratio)
        // 开始绘制
        let newImage = kj_draw(defaultSize)
        // 新图片Data
        finallData = newImage.jpegData(compressionQuality: 1.0)
        // 质量压缩
        if (finallData?.count ?? 0) / 1024 > maxLength {
            finallData = newImage.kj_qualityCompress(maxLength)
        }
        // 如果还未压缩到指定的大小，则开始降低分辨率
        if (finallData?.count ?? 0) / 1024 > maxLength {
            finallData = kj_resolutionCompress(maxLength)
        }
        return finallData
    }
    
    /// 质量压缩
    private func kj_qualityCompress(_ maxLength: Int) -> Data? {
        // 先判断当前质量是否满足要求，不满足再进行压缩
        var finallData = jpegData(compressionQuality: 1.0)
        if (finallData?.count ?? 0) / 1024 <= maxLength {
            return finallData
        }
        // 质量压缩
        var compression: CGFloat = 0.9
        while (finallData?.count ?? 0) / 1024 > maxLength && compression > 0.5 {
            compression -= 0.1
            guard let data = jpegData(compressionQuality: compression)  else {
                break
            }
            finallData = data
        }
        return finallData
    }
    
    /// 分辨率压缩
    private func kj_resolutionCompress(_ maxLength: Int) -> Data? {
        // 先判断当前质量是否满足要求，不满足再进行压缩
        var finallData = jpegData(compressionQuality: 1.0)
        if (finallData?.count ?? 0) / 1024 <= maxLength {
            return finallData
        }
        // 原图的宽高比
        let ratio = width / height
        var reduceWidth: CGFloat = 0
        // 开始降低分辨率
        while (finallData?.count ?? 0) / 1024 > maxLength {
            // 每次降低50分辨率
            reduceWidth += 50.0
            let reduceHeight: CGFloat = reduceWidth / ratio
            if width <= reduceWidth
                || height <= reduceHeight {
                break
            }
            // 新图片
            let newImage = kj_draw(CGSize(width: width - reduceWidth,
                                          height: height - reduceHeight))
            // 再进行质量压缩
            guard let data = newImage.kj_qualityCompress(maxLength) else { break }
            finallData = data
            if newImage.width >= width { break }
        }
        return finallData
    }
    
}
