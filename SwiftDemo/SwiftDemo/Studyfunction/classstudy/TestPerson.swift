//
//  TestPerson.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class TestPerson: NSObject {
    

    
    func test () {
        
        //给类属性赋值
        LPerson.courseCount = 2;

        //创建对象
        let p = LPerson()
        //p.setValuesForKeys(["name":"lili","age":10])
        //给对象属性进行赋值
        p.age = 10
        print(p.age)
        //        print(p.)

    }
    
}
