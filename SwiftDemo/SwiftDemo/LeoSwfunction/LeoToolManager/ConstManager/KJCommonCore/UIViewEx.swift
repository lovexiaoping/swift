//
//  UIViewEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/9/19.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit


extension UIView {
    
    @objc var viewController: UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if responder is UIViewController {
                break
            }
            responder = responder?.next
        }
        return responder as? UIViewController
    }
    
}
