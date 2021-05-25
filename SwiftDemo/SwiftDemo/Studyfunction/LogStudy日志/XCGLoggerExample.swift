//
//  XCGLoggerExample.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit
import XCGLogger
class XCGLoggerExample: NSObject {

    let log = XCGLogger.default

    func setupXCGLogger() -> Void {
    //日志文件地址
    let cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let logURL = cachePath.appendingPathComponent("log.txt")
    log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: logURL, fileLevel: .debug)
    }

    func logfun()  {
        
        log.verbose("A verbose message, usually useful when working on a specific problem")
        log.debug("A debug message")
        log.info("An info message, probably useful to power users looking in console.app")
        log.error("An error occurred, but it's recoverable, just info about what happened")
        log.severe("A severe error occurred, we are likely about to crash now")
    }
    

}
