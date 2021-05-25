//
//  TestFileManager.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class TestFileManager: NSObject {
    
    

}


extension TestFileManager {
    
    //MARK:-- 遍历一个目录下的所有文件
    func a1()  {
        
        //首先我们获取用户文档目录路径
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let url = urlForDocument[0] as URL
        print(url)
        
        //对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
        
        let contentsOfPath = try? manager.contentsOfDirectory(atPath: url.path)
        print("contentsOfPath: \(String(describing: contentsOfPath))")
        
        
       //类似上面的，对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
        let contentsOfURL = try? manager.contentsOfDirectory(at: url,
                                includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        print("contentsOfURL: \(String(describing: contentsOfURL))")
        
        //深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtPath = manager.enumerator(atPath: url.path)
        print("enumeratorAtPath: \(String(describing: enumeratorAtPath?.allObjects))")
        
        //深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtURL = manager.enumerator(at: url, includingPropertiesForKeys: nil,
                                                 options: .skipsHiddenFiles, errorHandler:nil)
        print("enumeratorAtURL: \(String(describing: enumeratorAtURL?.allObjects))")
        
        //深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
        let subPaths = manager.subpaths(atPath: url.path)
        print("subPaths: \(String(describing: subPaths))")
        
    }
    
    //MARK:-- 判断文件或文件夹是否存在
    func a2()  {
        
        let fileManager = FileManager.default
        let filePath:String = NSHomeDirectory() + "/Documents/hangge.txt"
        let exist = fileManager.fileExists(atPath: filePath)
        
    }
    
    //MARK:-- 创建文件夹
    func a3()  {
        let myDirectory:String = NSHomeDirectory() + "/Documents/myFolder/Files"
        let fileManager = FileManager.default
         
        //withIntermediateDirectories为ture表示路径中间如果有不存在的文件夹都会创建
        try! fileManager.createDirectory(atPath: myDirectory,
                                withIntermediateDirectories: true, attributes: nil)
        
    }
    //MARK:-- 创建文件夹2
    
    func a4()  {
        //在文档目录下新建folder目录
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument[0] as NSURL
        createFolder(name: "folder", baseUrl: url)
    
    }
    
    func createFolder(name:String,baseUrl:NSURL){
            let manager = FileManager.default
            let folder = baseUrl.appendingPathComponent(name, isDirectory: true)
            print("文件夹: \(String(describing: folder))")
            let exist = manager.fileExists(atPath: folder!.path)
            if !exist {
                try! manager.createDirectory(at: folder!, withIntermediateDirectories: true,
                                             attributes: nil)
            }
        
    }
    //MARK:-- 将对象写入文件
    //可以通过write(to:)方法，可以创建文件并将对象写入，对象包括String，NSString，UIImage，NSArray，NSDictionary等
    
    
    func save001()  {
        //把String保存到文件
        let filePath:String = NSHomeDirectory() + "/Documents/hangge.txt"
        let info = "欢迎来到hange.com"
        try! info.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        
    }
    
    func save002()  {
        //把图片保存到文件路径下
//        let filePath = NSHomeDirectory() + "/Documents/hangge.png"
//        let image = UIImage(named: "apple.png")
//        let data:Data = UIImagePNGRepresentation(image!)!
//        try? data.write(to: URL(fileURLWithPath: filePath))
    }
    func save003()  {
        //把NSArray保存到文件路径下
        let array = NSArray(objects: "aaa","bbb","ccc")
        let filePath:String = NSHomeDirectory() + "/Documents/array.plist"
        array.write(toFile: filePath, atomically: true)
    }
    
    func save004()  {
        //把NSDictionary保存到文件路径下
        let dictionary:NSDictionary = ["Gold": "1st Place", "Silver": "2nd Place"]
        let filePath:String = NSHomeDirectory() + "/Documents/dictionary.plist"
        dictionary.write(toFile: filePath, atomically: true)
    }
    
    
    
    
    //MARK:-- 创建文件
    
    func test() {
        //在文档目录下新建test.txt文件
        let manager = FileManager.default
        let urlForDocument = manager.urls( for: .documentDirectory,
                                           in:.userDomainMask)
        let url = urlForDocument[0]
        createFile(name:"test.txt", fileBaseUrl: url)
        //createFile(name: "folder/new.txt", fileBaseUrl: url)
    }
    
    func createFile(name:String, fileBaseUrl:URL){
        let manager = FileManager.default
         
        let file = fileBaseUrl.appendingPathComponent(name)
        print("文件: \(file)")
        let exist = manager.fileExists(atPath: file.path)
        if !exist {
            let data = Data(base64Encoded:"aGVsbG8gd29ybGQ=" ,options:.ignoreUnknownCharacters)
            let createSuccess = manager.createFile(atPath: file.path,contents:data,attributes:nil)
            print("文件创建结果: \(createSuccess)")
        }
    }
    
    
    
    
}
/*
 6，复制文件
 （1）方法1
 
 let fileManager = FileManager.default
 let homeDirectory = NSHomeDirectory()
 let srcUrl = homeDirectory + "/Documents/hangge.txt"
 let toUrl = homeDirectory + "/Documents/copyed.txt"
 try! fileManager.copyItem(atPath: srcUrl, toPath: toUrl)

 （2）方法2

 // 定位到用户文档目录
 let manager = FileManager.default
 let urlForDocument = manager.urls( for:.documentDirectory, in:.userDomainMask)
 let url = urlForDocument[0]
  
 // 将test.txt文件拷贝到文档目录根目录下的copyed.txt文件
 let srcUrl = url.appendingPathComponent("test.txt")
 let toUrl = url.appendingPathComponent("copyed.txt")
  
 try! manager.copyItem(at: srcUrl, to: toUrl)

 7，移动文件
 （1）方法1

 let fileManager = FileManager.default
 let homeDirectory = NSHomeDirectory()
 let srcUrl = homeDirectory + "/Documents/hangge.txt"
 let toUrl = homeDirectory + "/Documents/moved/hangge.txt"
 try! fileManager.moveItem(atPath: srcUrl, toPath: toUrl)

 （2）方法2
 // 定位到用户文档目录
 let manager = FileManager.default
 let urlForDocument = manager.urls( for: .documentDirectory, in:.userDomainMask)
 let url = urlForDocument[0]
  
 let srcUrl = url.appendingPathComponent("test.txt")
 let toUrl = url.appendingPathComponent("copyed.txt")
 // 移动srcUrl中的文件（test.txt）到toUrl中（copyed.txt）
 try! manager.moveItem(at: srcUrl, to: toUrl)

 8，删除文件
 （1）方法1
 let fileManager = FileManager.default
 let homeDirectory = NSHomeDirectory()
 let srcUrl = homeDirectory + "/Documents/hangge.txt"
 try! fileManager.removeItem(atPath: srcUrl)

 （2）方法2
 // 定位到用户文档目录
 let manager = FileManager.default
 let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
 let url = urlForDocument[0]
  
 let toUrl = url.appendingPathComponent("copyed.txt")
 // 删除文档根目录下的toUrl路径的文件（copyed.txt文件）
 try! manager.removeItem(at: toUrl)

 9，删除目录下所有的文件
 （1）方法1：获取所有文件，然后遍历删除
 let fileManager = FileManager.default
 let myDirectory = NSHomeDirectory() + "/Documents/Files"
 let fileArray = fileManager.subpaths(atPath: myDirectory)
 for fn in fileArray!{
     try! fileManager.removeItem(atPath: myDirectory + "/\(fn)")
 }

 （2）方法2：删除目录后重新创建该目录
 let fileManager = FileManager.default
 let myDirectory = NSHomeDirectory() + "/Documents/Files"
 try! fileManager.removeItem(atPath: myDirectory)
 try! fileManager.createDirectory(atPath: myDirectory, withIntermediateDirectories: true,
                                  attributes: nil)
 10，读取文件
 let manager = FileManager.default
 let urlsForDocDirectory = manager.urls(for: .documentDirectory, in:.userDomainMask)
 let docPath = urlsForDocDirectory[0]
 let file = docPath.appendingPathComponent("test.txt")
  
 //方法1
 let readHandler = try! FileHandle(forReadingFrom:file)
 let data = readHandler.readDataToEndOfFile()
 let readString = String(data: data, encoding: String.Encoding.utf8)
 print("文件内容: \(readString)")
  
 //方法2
 let data2 = manager.contents(atPath: file.path)
 let readString2 = String(data: data2!, encoding: String.Encoding.utf8)
 print("文件内容: \(readString2)")

 11，在任意位置写入数据

 let manager = FileManager.default
 let urlsForDocDirectory = manager.urls(for:.documentDirectory, in:.userDomainMask)
 let docPath = urlsForDocDirectory[0]
 let file = docPath.appendingPathComponent("test.txt")
  
 let string = "添加一些文字到文件末尾"
 let appendedData = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
 let writeHandler = try? FileHandle(forWritingTo:file)
 writeHandler!.seekToEndOfFile()
 writeHandler!.write(appendedData!)

 12，文件权限判断
 
 let manager = FileManager.default
 let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
 let docPath = urlForDocument[0]
 let file = docPath.appendingPathComponent("test.txt")
  
 let readable = manager.isReadableFile(atPath: file.path)
 print("可读: \(readable)")
 let writeable = manager.isWritableFile(atPath: file.path)
 print("可写: \(writeable)")
 let executable = manager.isExecutableFile(atPath: file.path)
 print("可执行: \(executable)")
 let deleteable = manager.isDeletableFile(atPath: file.path)
 print("可删除: \(deleteable)")

 13，获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）
 
 let manager = FileManager.default
 let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
 let docPath = urlForDocument[0]
 let file = docPath.appendingPathComponent("test.txt")
  
 let attributes = try? manager.attributesOfItem(atPath: file.path) //结果为Dictionary类型
 print("attributes: \(attributes!)")
 */
