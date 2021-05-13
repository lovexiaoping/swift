//
//  UIWindow.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/11.
//

import Foundation

fileprivate let texthud: MBProgressHUD = {
   
    let hud = MBProgressHUD()
    hud.mode = .text
    hud.removeFromSuperViewOnHide = true
    return hud
}()

extension UIWindow {
    func show(text:String) {
        
        addSubview(texthud)
        texthud.label.text = text
        texthud.show(animated: true)
        texthud.hide(animated: true, afterDelay: 1)
        
    }
}
