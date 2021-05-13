//
//  UIEdgeInsetsEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/7/29.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    init(_ all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
    
    init(horizontal h: CGFloat, vertical v: CGFloat) {
        self.init(top: v, left: h, bottom: v, right: h)
    }
    
    func kj_horizontalValue() -> CGFloat {
        return left + right
    }
    
    func kj_verticalValue() -> CGFloat {
        return top + bottom
    }
    
}
