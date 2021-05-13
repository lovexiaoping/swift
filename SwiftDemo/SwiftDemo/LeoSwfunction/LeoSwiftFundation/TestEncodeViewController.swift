//
//  TestEncodeViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/23.
//

import UIKit

class TestEncodeViewController: UIViewController {
    
    
    /*
    归档与反归档

    归档（序列化）是把对象转为Data，反归档（反序列化）是从Data还原出对象。
    可以存储自定义数据。
    存储的数据需要继承自NSObject并遵循NSSecureCoding协议。
    */
    var data: Data!
    var origin: Person!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //归档
    func archiver(_ sender: Any) {
    
        let p1 = Person()
        p1.name = "笑话"
        p1.age = 22
        
//        do {
//            try data = NSKeyedArchiver.archivedData(withRootObject: p1, requiringSecureCoding: textInputMode)
//        } catch  {
//            print(error)
//        }
    }
    //反归档
    func unarchiver(_ sender: Any) {
        do {
                  try origin = NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)
                  print(origin!.age!)
                  print(origin!.name!)
              } catch {
                  print(error)
              }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
