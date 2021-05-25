//
//  LUserInfoModel.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

import UIKit

class LUserInfoModel: NSObject {
    //在单例类中，有一个用来共享数据的数组
    var datas = [String]()
    
    
    
    //创建一个静态或者全局变量，保存当前单例实例值
    private static let singleInstance = LUserInfoModel()
    //私有化构造方法
    private override init() {        
        //给数组加一个原始数据
        datas.append("SI")
    }

    //提供一个公开的用来去获取单例的方法
    class func defaultSingleInstance() ->LUserInfoModel {
        //返回初始化好的静态变量值
        return singleInstance
    }
    
}

