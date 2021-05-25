//
//  TestClosuresViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class HttpTool: NSObject {
   
    
    //定义闭包     ？可选类型要用括号
    var callBack : ((_ responseObject :  AnyObject ) -> ( ))?

    
    //加载数据
    func loaddata(callBack :@escaping (_ responseObject: AnyObject) -> ()) {
        DispatchQueue.global().async {
            
            //强引用 加
            self.callBack  = callBack
            
            sleep(arc4random()%3)//休眠时间随机
            print(Thread.current)
            DispatchQueue.main.async {
                callBack("hello json" as AnyObject);
            }
        }
    }
    //加载数据2
    func loaddata2(callBack :@escaping (_ jsonstr: String) -> ()) {
        DispatchQueue.global().async {
            sleep(arc4random()%3)//休眠时间随机
            print(Thread.current)
            DispatchQueue.main.async {
                callBack("");
            }
        }
    }
}



class TestClosuresViewController: UIViewController {

    var httpt : HttpTool = HttpTool()
    
    //重写父类的方法就要 override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("--点击页面--")
        
        //解决循环引用方式1
        weak var weakself = self
        httpt.loaddata { (data) in
            print("拿到的数据\(data)")
            //weakself? 如果可选类型没有值，？后面不会执行
            weakself?.view.backgroundColor = .red
        }
        
        //解决循环引用方式2  加 [weak self]
        httpt.loaddata {[weak self] (data) in
            self?.view.backgroundColor = UIColor.yellow
        }
        
        //解决循环引用方式3 不常用  加 [unowned self]
        httpt.loaddata {[unowned self] (data) in
            self.view.backgroundColor = UIColor.yellow
        }
        
    }
    
    // deinit 相当于OC 的dealloc，当对象销毁时调用该方法
    deinit {
     print("VC deinit")
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
