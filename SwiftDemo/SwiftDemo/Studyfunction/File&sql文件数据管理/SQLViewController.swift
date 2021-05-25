//
//  SQLViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit
import SQLite
class UserTable{

    var sql:SqLiteManger
    let id = Expression<Int64>.init("uId")
    let name = Expression<String>.init("userName")
    let isMan = Expression<Bool>.init("isMan")
    
    var table:Table?
    init() {
        let path = JKPOP.DocumnetsDirectory()
        //建数据库
        sql = SqLiteManger.init(sqlPath: path + "/user.sqlite")
        //建表
        table = sql.createTable(tableName: "user", block: { (bulider) in
            //初始字段
            bulider.column(id,primaryKey: .autoincrement)
            bulider.column(name)
            bulider.column(isMan)
        })
    }
    // 增
    func add(userName:String, isMain:Bool){
        if sql.insert(table: table, setters: [name <- userName,isMan <- isMain]){
            print("成功")
        }
    }
    //删
    func del(userName:String){
        if sql.delete(table: table, filter: name == userName) {
                    print("成功")
                }
    }
    //改
    func update(userNameOld:String, userNameNew:String){
        if sql.update(table: table, setters: [name <- userNameOld], filter: name == userNameNew) {
                    print("成功")
                }
    }
    //查
    func check(userName:String, isMain:Bool){
        let rows = sql.select(table: table,select: [id,name],filter: id >= 0)
        for item in rows ?? [] {
            print(item[id],item[name])
        }
    }
    
}
class SQLViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let table = UserTable.init()
        
        table.add(userName: "小明", isMain: true)
        table.del(userName: "小明")
        table.add(userName: "小明", isMain: true)
        table.update(userNameOld: "小明", userNameNew: "小花")

        // Do any additional setup after loading the view.
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
