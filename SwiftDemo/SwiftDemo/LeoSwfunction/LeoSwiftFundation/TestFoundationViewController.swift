//
//  TestFoundationViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/22.
//

import UIKit

class TestFoundationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func testdic() -> Void {
       //1. 定义固定格式的字典
       // dict1的所有“键值”类型一致(都是字符串)
       var dict1 = ["name": "mary", "age": "18"]
       var dataSource = [[String:String]()]
         dataSource = [
                         ["type":"no","name":"张三","sex":"男","icon":"my_def_photo","birthday":"2017-10-11"],
                         ["type":"no","name":"李四","sex":"男","icon":"my_def_photo","birthday":"2011-12-30"],
                         ["type":"no","name":"王五","sex":"女","icon":"my_def_photo","birthday":"2014-9-10"],
                         ["type":"no","name":"JIM","sex":"赵六","icon":"my_def_photo","birthday":"2008-10-1"]]
       
        //修改元素
        dict1["name"] = "rose"//方法一
        dict1.updateValue("rose", forKey: "name")//方法二


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
