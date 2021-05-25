//
//  Person.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class LPerson: NSObject {
    //定义属性 存储属性
    var age : Int = 0
    
    var mathScore : Double = 0.0
    var chineseScore : Double = 0.0
    
    //定义计算属性，
    var averagescore: Double {
        return (mathScore + chineseScore)*0.5
    }
    //定义方法
    func getavg() -> Double {
        return (mathScore + chineseScore)*0.5
    }
    
    //定义类属性：通过类名访问
    static var courseCount : Int = 0
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }

}

