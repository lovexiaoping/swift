//
//  STest.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import Foundation




/**
 
 static 与 class 的区别
 
 static 可以在类、结构体、或者枚举中使用。而 class 只能在类中使用。
 static 可以修饰存储属性，static 修饰的存储属性称为静态变量(常量)。而 class 不能修饰存储属性。
 static 修饰的计算属性不能被重写。而 class 修饰的可以被重写。
 static 修饰的静态方法不能被重写。而 class 修饰的类方法可以被重写。
 class 修饰的计算属性被重写时，可以使用 static 让其变为静态属性。
 class 修饰的类方法被重写时，可以使用 static 让方法变为静态方法。

 
 */
/*

//结构体 struct 和枚举 enum 的静态属性，静态方法使用 static 关键字
struct Account {
    var amount : Double = 0.0                 //账户金额
    var owner : String = ""                   //账户名
 
    static var interestRate : Double = 0.668  //利率
 
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}


//类 Class 的静态属性，静态方法也可以使用 static 关键字
class Account {
    var amount : Double = 0.0                 //账户金额
    var owner : String = ""                   //账户名
 
    static var interestRate : Double = 0.668  //利率
 
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}



//class 关键字
//class 关键字专门用在 class 类型的上下文中的，可以用来修饰类方法以及类的计算属性（注意：不能用在存储类属性上）

class Account2 {
    var amount : Double = 0.0               // 账户金额
    var owner : String = ""                 // 账户名
  
    class var staticProp : Double {
        return 0.668
    }
 
    class func interestBy(amount : Double) -> Double {
        return 0.8886 * amount
    }
}
   
//访问类计算属性
print(Account2.staticProp)
*/
