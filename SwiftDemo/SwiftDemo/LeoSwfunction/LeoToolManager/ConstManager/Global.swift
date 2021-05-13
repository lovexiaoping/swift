//
//  Global.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/11.
//

import Foundation

var mainWindow:UIWindow? {
    return UIApplication.shared.keyWindow
}

var isIphoneX: Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows[0].safeAreaInsets != UIEdgeInsets.zero
}

