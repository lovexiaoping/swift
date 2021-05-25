//
//  Dog.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import Foundation

//MARK:--  init()：类的初始化方法（构造方法）

/*
/********************************
使用默认构造函数
********************************/
class Cat{
    //类属性
    var name:String = ""
    var number:Int = 0
}
var cat = Cat()





/********************************
自定义构造函数
********************************/
class Animal{
    //类属性
    var name:String
    var age:Int
 
    //类构造函数
    init(newName:String, newAge:Int){
        self.name = newName
        self.age = newAge
    }
 
    //成员函数（实例方法）
    func say() -> String{
        return "我叫\(name)"
    }
}
var p = Animal(newName: "hangge",newAge: 32)
//print(p.say())



//MARK:-- deinit()：类反初始化方法（析构方法）
class DBClass{
    var conn:Connection? = Connection()
    deinit{
        //可以做一些清理工作
        self.conn!.close()
        self.conn = nil
    }
}
 
var db:DBClass? = DBClass()
//db = nil //设置nil后即可执行deinit()方法

 */
