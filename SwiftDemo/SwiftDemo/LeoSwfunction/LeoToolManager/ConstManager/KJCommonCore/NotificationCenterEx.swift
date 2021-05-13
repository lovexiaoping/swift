//
//  NotificationCenterEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/9/9.
//  Copyright © 2020 zwwl. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    @objc static func kj_post(_ name: String, object: Any? = nil, info: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name(name), object: object, userInfo: info)
    }
    
    @objc func kj_post(_ name: String, object: Any? = nil, info: [AnyHashable: Any]? = nil) {
        post(name: NSNotification.Name(name), object: object, userInfo: info)
    }
    
    @objc static func kj_add(_ observer: Any, selector: Selector, name: String, object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(name), object: object)
    }
    
    @objc func kj_add(_ observer: Any, selector: Selector, name: String, object: Any? = nil) {
        addObserver(observer, selector: selector, name: NSNotification.Name(name), object: object)
    }
    
    @objc static func kj_remove(_ observer: Any, name: String, object: Any? = nil) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(name), object: object)
    }
    
}
