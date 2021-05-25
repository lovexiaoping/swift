//
//  FileMangmentViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit


enum FileError:Error{
    case notExists
    case notFormat
    case noContent
}

class FileMangmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 文件：FileManager+Extension.swift
        
        
        JKPOP.removefolder(folderPath: "")
        JKPOP.createFolder(folderPath: "")
        
        JKPOP.createFile(filePath: "")
        JKPOP.removefile(filePath: "")
        
        JKPOP.readfile(filePath: "")
        JKPOP.readFromFile(readType: .DictionaryType, readPath: "")
        

        let arr : [String] = ["1","2"]
        JKPOP.writeToFile(writeType: .ArrayType , content: arr, writePath: "")
        

        // Do any additional setup after loading the view.
    }
    

    // MARK: -- 读取文件内容并容错处理

    func readFile(path: String) throws -> String {
        let isexsits = FileManager.default.fileExists(atPath: path)
        if !isexsits {
            throw FileError.notExists
        }
        //2.读取文件内容
        var content:String = ""
        do{
            content = try String(contentsOfFile: path)
        }catch{
            throw FileError.notFormat
        }
        if content.lengthOfBytes(using: String.Encoding.utf8) == 0 {
            throw FileError.noContent
        }
        return content

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
