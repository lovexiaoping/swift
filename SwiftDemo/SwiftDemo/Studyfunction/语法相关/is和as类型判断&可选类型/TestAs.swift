//
//  TestAs.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import Foundation

/*
//基类，人类
class Human{
}
 
//男人类
class Man:human{
}
 
//女人类
class Woman:human{
}

//MARK:--  is 用来做类型检查  （注意：is也可以用来检查某个类是否遵循了某个协议）

let man = Man()
let woman = Woman()
var arr = [man,woman] as [Any]
 
for people in arr {
    if people is Man {
    }else if people is Woman {
    }
}


//MARK:-- as 用来做类型转换       （注意：如果不确定类型转换能否成功，可以在as后面加问号“?”）

for people in arr {
    if let m = people as? Man {
    }else if let w = people as? Woman {
    }
}

//MARK:-- 可选类型

/*
可选类型是Swift的一个特色。它表示一个变量有可能有值，也可能没有值（nil）。
声明的方式是“数据类型+问号”。
而当要使用一个可选类型的变量是，要在后面加感叹号“!”。
 */

var height:Int?  //声明一个可选类型，默认值为nil
 
if height == nil{
    print("你有多高？")
}else{
    print("你有\(height!)高。")
}
 
height = 199 //给可选类型赋值


*/


//MARK:-- AnyObject与Any的区别

//AnyObject ：代表任何class类型的对象实例。
//Any ：范围更广，代表除函数外任何类型的实例。
