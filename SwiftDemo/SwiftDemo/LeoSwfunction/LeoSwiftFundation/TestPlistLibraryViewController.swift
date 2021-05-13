//
//  TestPlistViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/23.
//

import UIKit

class TestPlistViewController: UIViewController {
    var username: UITextField!
    var password: UITextField!
    
    //UserDefaults
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = userDefaults.string(forKey: "name")
        let pwd = userDefaults.string(forKey: "pwd")
        
        
        
       
        
        
        

        // Do any additional setup after loading the view.
    }
    
     func login(_ sender: Any) {
           print("密码已经记住")
       }
     func remember(_ sender: Any) {
            let swit = sender as! UISwitch
            // 如果记住密码开关打开
            if swit.isOn {
                let name = username.text
                let pwd = password.text
                // 存储用户名和密码
                userDefaults.set(name, forKey: "name")
                userDefaults.set(pwd, forKey: "pwd")
                // 同时存储开关的状态
                userDefaults.set(swit.isOn, forKey: "isOn")
                // 最后进行同步
                userDefaults.synchronize()
            }
        }
    
    
    
    //Bundle 管理  简单理解就是资源文件包，会将许多图片、xib、文本文件组织在一起，打包成一个 Bundle 文件，这样可以在其他项目中引用包内的资源。
    func testbundle()  {
        // 获取当前项目的Bundle
        let bundle = Bundle.main

        // 加载资源
        let mp3 = Bundle.main.path(forResource: "xxx", ofType: "mp3")
    }
    
    //将citydata.plist 读取 写入沙盒
    func readwriteplist() -> Void {
        let path = Bundle.main.path(forResource: "citydata", ofType: "plist")
        if let path  = path {
            let root = NSDictionary(contentsOfFile: path)
            // print(root!.allKeys)
            // print(root!.allKeys[31])
            // 获取所有数据
            let cities = root![root!.allKeys[31]] as! NSArray // 借助于NSArray
            // print(cities)
            // 沙盒路径
            let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            let filePath = documentDir! + "/localData.plist"
            // 写入沙盒
            cities.write(toFile: filePath, atomically: true)
        }
    }
    
    func testhomeDirectory() -> Void {
        // 获取程序的Home目录 沙盒的主目录
        let homeDirectory = NSHomeDirectory()
    }
    
    
    
    //保存应用程序运行时生成的持久化数据
    func testDocuments() -> Void {
        // 方法1
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath = documentPaths[0]
        // 方法2
        let documentPath2 = NSHomeDirectory() + "/Documents"
        
        
        //如果希望获取的是URL
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let url: URL = urlForDocument[0]
        
        //        访问沙盒目录常用的函数，它返回值为一个数组，在 iOS 中由于只有一个唯一路径，所以直接取数组第一个元素即可
       // func NSSearchPathForDirectoriesInDomains( _ directory: FileManager.SearchPathDirectory,       _ domainMask: FileManager.SearchPathDomainMask, _ expandTilde: Bool) -> [String]
        //directory：指定搜索的目录名称。
       // domainMask：搜索主目录的位置。userDomainMask 表示搜索的范围限制于当前应用的沙盒目录（参考定义注释）。
       // expandTilde：是否获取完整的路径
        
        
        let documentPaths2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, false)
        let documentPath222 = documentPaths[0] // ~/Documents

        let documentPaths22 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath22 = documentPaths2[0] // /Users/yangfan/Library/Developer/XCPGDevices/982B6CBA-747B-4831-9D87-F82160197333/data/Containers/Data/Application/56C657D5-B36B-449D-AC6C-E2417EA65D00/Documents
        
    }
    
    
    
    
    
    
    
    func testlibrary() -> Void {
        //存储程序的默认设置和其他信息，其下有两个重要目录：
        //Library/Preferences 目录：包含应用程序的偏好设置文件。不应该直接创建偏好设置文件，而是应该使用UserDefaults类来取得和设置应用程序的偏好。
        //Library/Caches 目录：主要存放缓存文件，此目录下文件不会在应用退出时删除。
        
        
        
        // Library目录－方法1
        let libraryPaths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let libraryPath = libraryPaths[0]

        // Library目录－方法2
        let libraryPath2 = NSHomeDirectory() + "/Library"

        // Cache目录－方法1
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachePath = cachePaths[0]

        // Cache目录－方法2
        let cachePath2 = NSHomeDirectory() + "/Library/Caches"
    }
    
    func testtem() -> Void {
        //tmp目录：存储临时文件，当在退出程序或设备重启时，文件会被清除。
        // 方法1
        let tmpDir = NSTemporaryDirectory()

        // 方法2
        let tmpDir2 = NSHomeDirectory() + "/tmp"
            
    }
    
    
    
    
    //
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
