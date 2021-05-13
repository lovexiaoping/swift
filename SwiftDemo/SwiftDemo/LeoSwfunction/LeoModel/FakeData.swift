//
//  FakeData.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

import Foundation

class FakeData {
    //array
    private static var bannerList = [String]()
    private static var products = [Product]()
    private static var deals = [Deal]()
    
    //返回String类型的array
    static func createBanners() ->[String]{
        if bannerList.count==0 {
            bannerList = ["https://t7.baidu.com/it/u=825057118,3516313570&fm=193&f=GIF",
            "https://t7.baidu.com/it/u=3435942975,1552946865&fm=193&f=GIF",
            "https://t7.baidu.com/it/u=3569419905,626536365&fm=193&f=GIF"]
        }
        return bannerList
    }
    
    //返回Product类型的array  创建了4个课程
    static func createProducts() ->[Product]{
        
  
        if products.count==0 {
            
            let p1 = Product(imageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp0.ifengimg.com%2Fpmop%2F2017%2F1214%2F5C6012302E1DAD6B3D9F4130A58C244B297D3CDE_size92_w800_h533.jpeg&refer=http%3A%2F%2Fp0.ifengimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1620554280&t=0c53ae230592c8aaa2c5e649f6d19d5a", name: "实战1", price: 2, desc: "描述", teacher: "丽丽老师", total: 2, update: 20121100, student: 3, detail: "详细", courseList: "")
            let p2 = Product(imageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp0.ifengimg.com%2Fpmop%2F2017%2F1214%2F5C6012302E1DAD6B3D9F4130A58C244B297D3CDE_size92_w800_h533.jpeg&refer=http%3A%2F%2Fp0.ifengimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1620554280&t=0c53ae230592c8aaa2c5e649f6d19d5a", name: "实战2", price: 2, desc: "描述", teacher: "丽丽老师", total: 2, update: 20121100, student: 3, detail: "详细", courseList: "")
            let p3 = Product(imageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp0.ifengimg.com%2Fpmop%2F2017%2F1214%2F5C6012302E1DAD6B3D9F4130A58C244B297D3CDE_size92_w800_h533.jpeg&refer=http%3A%2F%2Fp0.ifengimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1620554280&t=0c53ae230592c8aaa2c5e649f6d19d5a", name: "实战3", price: 2, desc: "描述", teacher: "丽丽老师", total: 2, update: 20121100, student: 3, detail: "详细", courseList: "")
            let p4 = Product(imageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp0.ifengimg.com%2Fpmop%2F2017%2F1214%2F5C6012302E1DAD6B3D9F4130A58C244B297D3CDE_size92_w800_h533.jpeg&refer=http%3A%2F%2Fp0.ifengimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1620554280&t=0c53ae230592c8aaa2c5e649f6d19d5a", name: "实战4", price: 2, desc: "描述", teacher: "丽丽老师", total: 2, update: 20121100, student: 3, detail: "详细", courseList: "")

            
            
            products = [p1,p2,p3,p4]
        }
        return products
    }
    
    
    static func createDeals() ->[Deal] {
        if deals.count == 0 {
            
            
//            map 方法接受一个闭包作为参数， 然后它会遍历整个 numbers 数组，并对数组中每一个元素执行闭包中定义的操作。 相当于对数组中的所有元素做了一个映射。
            
            deals = FakeData.createProducts().map {
                Deal(produce: $0, progress: 1)
            }
        }
        return deals
    }

}
