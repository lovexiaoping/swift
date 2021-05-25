//
//  TestException.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class TestException: NSObject {
    
        //读取json文件数据
        //如果调用系统的一个方法，方法最后有一个throws，说明该方法会抛出异常
        //如果一个方法会出现异常，那么需要对异常进行处理
    
    func testTry() {
        
        
            /*
             处理异常的三种方法
             1.try方法  需要手动捕捉异常
             */
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: ""), options: .mappedIfSafe)
            do {
                try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            } catch {
                //系统提供了一个临时异常的对象
                print(error)
            }
        } catch {
            //系统提供了一个临时异常的对象
            print(error)
        }
        
        /*
         处理异常的三种方法  常用
         2.try?方法 , 系统帮助我们处理异常，如果出现异常，该方法返回nil，没有异常则返回对应的对象
         */
        
        guard let data2 = try? Data(contentsOf: URL(fileURLWithPath: ""), options: .mappedIfSafe) else {
            return
        }
        
        
        /*
         处理异常的三种方法  不建议用
         2.try！方法 , 告诉系统没有没有异常，如果出现了异常很容易崩溃
         */
        
        
        
        
        
        
    }

       
}
    
   
