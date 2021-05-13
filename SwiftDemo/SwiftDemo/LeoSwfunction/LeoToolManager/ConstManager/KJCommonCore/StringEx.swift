//
//  StringEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/8/26.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit

extension String {
    
    /// 计算文本的高度
    /// - Parameters:
    ///   - font: 字体
    ///   - maxWidth: 最大宽度
    /// - Returns: 高度
    func kj_height(font: UIFont, maxWidth: CGFloat) -> CGFloat {
        return kj_size(font: font, maxWidth: maxWidth).height
    }
    
    /// 计算文本宽高
    /// - Parameters:
    ///   - font: 字体
    ///   - maxWidth: 最大宽度
    /// - Returns: CGSize
    func kj_size(font: UIFont, maxWidth: CGFloat) -> CGSize {
        let style = NSMutableParagraphStyle()
        style.minimumLineHeight = font.lineHeight
        style.maximumLineHeight = font.lineHeight
        style.lineSpacing = font.leading
        let att = NSAttributedString(string: self,
                                     attributes: [.font : font,
                                                  .paragraphStyle: style])
        return att.kj_size(maxWidth: maxWidth)
    }
    
    /// 按URL规则拼接字符串
    /// - Parameter str: 字符串
    /// - Returns: 拼接完成的新字符串
    func kj_appendingPathComponent(_ str: String) -> String {
        let newValue = (str as NSString).appendingPathComponent(str)
        return newValue
    }
    
    func kj_nsRange(of: String) -> NSRange {
        return (self as NSString).range(of: of)
    }
    
}
