//
//  LeiValue.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import Foundation

/*
//十进制的字符串转成数字
//Swift中，如果要把字符串转换成数字类型（比如整型，浮点型等）。可以先转成NSString类型，让后再转。
//将文本框中的值转换成数字
var i = (tf1.text as NSString).intValue
var f = (tf1.text as NSString).floatValue
var d = (tf1.text as NSString).doubleValue


//十六进制的字符串转成数字

func hexStringToInt(from:String) -> Int {
    let str = from.uppercased()
    var sum = 0
    for i in str.utf8 {
        sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
        if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
            sum -= 7
        }
    }
    return sum
}
let str = "FF0000"
let value = hexStringToInt(from:str)
print(value)

//也可以通过扩展String实现

extension String{
    func hexStringToInt() -> Int {
        let str = self.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
}
let str = "FF0000"
let value = str.hexStringToInt()
print(value)


//MARK:-- Swift - 数字格式化转成字符串（保留两位小数，前面补0等）

func test1()  {
    //下面是一个浮点类型的数字转成String字符串的例子
    var f = 123.32342342
    var s:String = "\(f)" //123.32342342
}
func test2()  {
    //如果要保留两位小数
    var f = 123.32342342
    var s = String(format: "%.2f", f) //123.32
}

func test3()  {
    //转成十六进制格式字符串
    let i = 255
    let s:String = String(format: "%x", i) //ff
}
func test4()  {
    //不足六位前面补0
    let i = 255
    let s:String = String(format: "%06x", i) //0000ff
}



//MARK:-- 浮点数转换成整数（四舍五入与直接截断）
//直接截去小数部分转换成整数
var i = Int(23.50) //23
//四舍五入转换成整数
var i = lroundf(23.50) //24

 
 */
