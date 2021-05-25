//
//  ViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/8.
//

import UIKit
//import Reachability
//import SwiftyJSON
//import RxSwift
//import RxCocoa

//import CYLTabBarController


//@_exported import SQLite


/// RxSwift 回收池
//let disposeBag = DisposeBag()
/// 屏幕高度
let zyScreenH = UIScreen.main.bounds.height
/// 屏幕宽度
let zyScreenW = UIScreen.main.bounds.width


class ViewController: RotateBaseViewController {
    
//    var disposeBag = DisposeBag()
    
    lazy var dataArrayM = NSMutableArray()

//    声明一个只有一个参数没有返回值闭包的别名
    typealias SomeClosuerType = (String) -> (Void)
    let someClosuer: SomeClosuerType = { (name: String) in
        print("hello,", name)
    }
    
    var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadjson()
        self.view.backgroundColor = UIColor.red;
        
        testButton2()
        
        testButton3()
                
        UMCommonLogSwift.setUpUMCommonLogManager()
        UMCommonSwift.setLogEnabled(bFlag: true)
        UMCommonSwift.initWithAppkey(appKey: "5e900b7b0cafb2a8310001ce", channel: "App Store")
                    
        
        
        swap1(&num,1,3)

        someClosuer("world")

    }
  
    
    
    func test4(){
       //TODO 标记
        //（1）当我们写代码时，如果有一些功能需要以后添加或者补全，那么就可以使用 TODO 关键字来标记提醒。
        
        // FIXME: 参数不正确时会导致崩溃

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 强制竖屏
        forceOrientationPortrait()
    }
     
    //MARK: 懒加载标砖
    lazy var bgView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    
    //泛型
    func swapfun<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }

    //swift中需要对参数只进行修改,需要用到inout 关键字,
    //调用函数时加&
    var num = [1,2,3,4,5,6,7]
    
    //给一个数组，用swift函数，交换数组的两个元素
    func swap1(_ nums: inout [Int], _ a: Int , _ b:Int) {
        let temp = nums[a]
        nums[a] = nums[b];
        nums[b] = temp
        
    }

    //创建Button视图

    func testButton3() {
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 400, width: 50, height: 50)
        button.setTitle("test3", for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        button.addTarget(self, action: #selector(loadtabbar), for: .touchUpInside)

    }
    @objc func loadtabbar()  {
    
        ESTabManage.defaultSingleESTabInstance().loadtabbar();
//        ESCircleTabbarManage.defaultSingleESCircleTabInstance().loadECircleTabbar();

        
        
        
        
    }
    
    
    
    //创建Button视图

    func testButton2() {
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        button.setTitle("test2", for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        button.addTarget(self, action: #selector(pushWEB), for: .touchUpInside)
    }
    @objc func pushWEB()  {
        
//        let vc1 =  LeoWKWebViewController.init();
//        let vc1 =  HomeTableViewController.init();
//        let vc1 =  NavViewController.init();
//        let vc1 =  SwiftCollectionViewController.init();
//        let vc1 =  SQLViewController.init();
        let vc1 =  POPGestureViewController.init();

          self.navigationController?.pushViewController(vc1, animated: true)
    }
    
    //创建Button视图

    func testButton() {
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("test", for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        button.addTarget(self, action: #selector(didselectBtn), for: .touchUpInside)
        
        
    }
    
    //present  dismiss
    @objc func didselectBtn()  {
    
        
        let vc1 =  SwiftStudyViewController.init();
        vc1.modalPresentationStyle = .fullScreen
        
        self.present(vc1, animated: true) {
            
        }
        

    }
    
    
  
    
    func loadjson() -> Void {
        //快速体验一下如何获取JSON文件
        let url = URL(string: "https://icanhazdadjoke.com/")!
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("text/plain",forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data,
        let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode,
        let strData = String(bytes: data, encoding: .utf8)
                {
                    print(strData)
        } }.resume()


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
