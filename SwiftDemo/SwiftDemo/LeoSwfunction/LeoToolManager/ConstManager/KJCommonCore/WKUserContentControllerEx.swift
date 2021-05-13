//
//  WKUserContentControllerEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/9/5.
//  Copyright © 2020 zwwl. All rights reserved.
//

import UIKit
import WebKit

class KJWeakScriptMessageHandler: NSObject, WKScriptMessageHandler {

    weak var scriptHandler: WKScriptMessageHandler?
    
    init(_ scriptHandler: WKScriptMessageHandler) {
        super.init()
        self.scriptHandler = scriptHandler
    }
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        scriptHandler?.userContentController(userContentController,
                                             didReceive: message)
    }
}


extension WKUserContentController {

    /// 解决释放不了的情况
    /// - Parameters:
    ///   - scriptMessageHandler: WKScriptMessageHandler
    ///   - name: 方法名
    @objc (addWeakHandler: name:)
    func addWeak(_ scriptMessageHandler: WKScriptMessageHandler, name: String) {
        add(KJWeakScriptMessageHandler(scriptMessageHandler), name: name)
    }
    
}
