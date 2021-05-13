//
//  UIImageViewEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/7/24.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// 初始化
    /// - Parameter name: 项目中图片的名称
    @objc convenience init(named: String) {
        self.init(image: UIImage(named: named))
    }
}
