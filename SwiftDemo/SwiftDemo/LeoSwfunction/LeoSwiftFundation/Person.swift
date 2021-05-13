//
//  Person.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/23.
//

import UIKit

class Person: NSObject,NSSecureCoding {

    var name:String?
        var age:Int?

        override init() {
        }
    static var supportsSecureCoding: Bool = true

       // 编码- 归档调用
       func encode(with aCoder: NSCoder) {
           aCoder.encode(age, forKey: "age")
           aCoder.encode(name, forKey: "name")
       }

       // 解码-反归档调用
       required init?(coder aDecoder: NSCoder) {
           super.init()
           age = aDecoder.decodeObject(forKey: "age") as? Int
           name = aDecoder.decodeObject(forKey: "name") as? String
       }
}
