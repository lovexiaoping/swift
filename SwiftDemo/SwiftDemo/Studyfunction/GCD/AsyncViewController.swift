//
//  AsyncViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit
import Async
class AsyncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //耗时操作
        Async.background {
        print("A: This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description))")
            sleep(2)
        }.main {
            print("B: This is run on the \(qos_class_self().description) (expected \(qos_class_main().description)), after the previous block")
        }


        //1.2 串行耗时操作
        //每一段子任务依赖上一个任务完成，全部完成后回调主线程：
        func sdf(){
            let backgroundBlock = Async.background {
                print("This is run on the first\(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description))")
                sleep(2)
                
                print("This is run on the second \(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description))")
                sleep(2)
            }
            // Run other code here...
            backgroundBlock.main {
                print("This is run on the \(qos_class_self().description) (expected \(qos_class_main().description)), after the previous block")
            }


        }
        //1.3 并发耗时操作
        //每一段子任务独立，所有子任务完成后回调主线程：
        func sdf1(){
            Async.main {
                print("This is run on the \(qos_class_self().description) (expected \(qos_class_main().description))")
                // Prints: "This is run on the Main (expected Main) count: 1 (expected 1)"
                }.userInteractive {
                    print("This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_USER_INTERACTIVE.description))")
                    // Prints: "This is run on the Main (expected Main) count: 2 (expected 2)"
                }.userInitiated {
                    print("This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_USER_INITIATED.description)) ")
                    // Prints: "This is run on the User Initiated (expected User Initiated) count: 3 (expected 3)"
                }.utility {
                    print("This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_UTILITY.description)) ")
                    // Prints: "This is run on the Utility (expected Utility) count: 4 (expected 4)"
                }.background {
                    print("This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description)) ")
                    // Prints: "This is run on the User Interactive (expected User Interactive) count: 5 (expected 5)"
            }
        
        }
       
        
        //2.延时执行 :延时一段时间后执行代码，一般见于打开 App 一段时间后，弹出求好评对话框。
        
        func delayfunhoubackground(){
            let seconds = 3.0
            Async.main(after: seconds) {
                print("Is called after 3 seconds")
            }.background(after: 6.0) {
                print("At least 3.0 seconds after previous block, and 6.0 after Async code is called")
            }


        }
        //2.延时执行
        func delayfun(){
            //延迟5秒执行
               DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                   print("时间2：", Date())
               }
            
        }
        
     
        
        
        
        // Do any additional setup after loading the view.
    }


}

extension AsyncViewController{
    
    func test1() -> Void {
        //延迟5秒执行（在主线程上）
        delay(by: 5) {
            print("时间1：", Date())
        }
                 
        //延迟5秒执行（在全局队列上，且优先级高）
        delay(by: 5, qosClass: .userInitiated) {
            print("时间2：", Date())
        }

    }
    
    
    /// 代码延迟运行
    ///
    /// - Parameters:
    ///   - delayTime: 延时时间。比如：.seconds(5)、.milliseconds(500)
    ///   - qosClass: 要使用的全局QOS类（默认为 nil，表示主线程）
    ///   - closure: 延迟运行的代码
    public func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil,
                      _ closure: @escaping () -> Void) {
        let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main
        dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure)
    }
    
}
