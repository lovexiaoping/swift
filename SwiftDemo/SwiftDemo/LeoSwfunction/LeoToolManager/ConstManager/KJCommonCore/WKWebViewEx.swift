//
//  WKWebViewEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/9/7.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit
import WebKit

extension WKWebView {
    
    /// 解决释放不了的情况
    /// - Parameters:
    ///   - scriptMessageHandler: WKScriptMessageHandler
    ///   - name: 方法名
    @objc (addWeakHandler: name:)
    func addWeak(_ scriptMessageHandler: WKScriptMessageHandler, name: String) {
        configuration.userContentController.addWeak(scriptMessageHandler, name: name)
    }
    
    
    @objc func removeScriptMessageHandler(_ name: String) {
        configuration.userContentController.removeScriptMessageHandler(forName: name)
    }
}
