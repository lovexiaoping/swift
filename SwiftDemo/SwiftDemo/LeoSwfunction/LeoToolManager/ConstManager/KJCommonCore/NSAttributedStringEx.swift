
//
//  NSAttributedStringEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/8/26.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    /// 计算高度
    /// - Parameter maxWidth: 最大宽度
    /// - Returns: 高度
    @objc func kj_height(maxWidth: CGFloat) -> CGFloat {
        return kj_size(maxWidth: maxWidth).height
    }
    
    /// 计算size
    /// - Parameter maxWidth: 最大宽度
    /// - Returns: CGSize
    @objc func kj_size(maxWidth: CGFloat) -> CGSize {
        return boundingRect(with: CGSize(width: maxWidth,
                                         height: CGFloat.greatestFiniteMagnitude),
                            options: .usesLineFragmentOrigin,
                            context: nil).size
    }
}
