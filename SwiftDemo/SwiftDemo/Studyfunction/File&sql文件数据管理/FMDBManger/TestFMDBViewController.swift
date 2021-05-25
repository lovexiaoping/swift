//
//  TestFMDBViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

import UIKit

class TestFMDBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = SQLiteManager.shareManger().db
               if db.open() {
                   print("数据库打开成功!")
               } else {
                   print("数据库打开失败: \(db.lastErrorMessage())")
               }
               db.close()

        
        
      //下面在程序启动后自动创建一个 User 表，里面包含三个字段。
     
    }
    // 创建表
        func createTable() {
            // 编写SQL语句（id: 主键  name和age是字段名）
            let sql = "CREATE TABLE IF NOT EXISTS User( \n" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
                "name TEXT, \n" +
                "age INTEGER \n" +
            "); \n"
             
            // 执行SQL语句（注意点: 在FMDB中除了查询意外, 都称之为更新）
            let db = SQLiteManager.shareManger().db
            if db.open() {
                if db.executeUpdate(sql, withArgumentsIn: []){
                    print("创建表成功")
                }else{
                    print("创建表失败")
                }
            }
            db.close()
        }
    //插入数据（新增数据）
    //1)使用正常方式的插入一条数据
    func insertData() {
        // 编写SQL语句
        let sql = "INSERT INTO User (name, age) VALUES ('hangge', 100);"
         
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: []){
                print("插入成功")
            }else{
                print("插入失败")
            }
        }
        db.close()
    }
    //2)使用预编译方式插入一条数据
    func insertData2()  {
        // 编写SQL语句
        let sql = "INSERT INTO User (name, age) VALUES (?,?);"
         
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: ["hangge", 100]){
                print("插入成功")
            }else{
                print("插入失败")
            }
        }
        db.close()
    }
    
    //更新数据（修改数据）
    //1）使用正常方式的修改数据
    func updatedata1()  {
        // 编写SQL语句
        let sql = "UPDATE User set name = 'hangge.com' WHERE id = 2;"
         
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: []){
                print("更新成功")
            }else{
                print("更新失败")
            }
        }
        db.close()
    }
    
    //2)使用预编译方式修改数据
    func updatedata2() {
        // 编写SQL语句
        let sql = "UPDATE User set name = ? WHERE id = ?;"
         
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: ["hangge.com", 1]){
                print("更新成功")
            }else{
                print("更新失败")
            }
        }
        db.close()
    }
    
    //删除数据
    //1)使用正常方式的删除数据
    func deletedata1()  {
        // 编写SQL语句
        let sql = "DELETE FROM User WHERE id = 2;"
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: []){
                print("删除成功")
            }else{
                print("删除失败")
            }
        }
        db.close()
    }
    
    //2)使用预编译方式的删除数据
    func deletedata2()  {
        // 编写SQL语句
        let sql = "DELETE FROM User WHERE id = ?;"
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: [3]){
                print("删除成功")
            }else{
                print("删除失败")
            }
        }
        db.close()
    }
    //查询数据
    //1)正常
    func checkdata1() {
        // 编写SQL语句
        let sql = "SELECT * FROM User WHERE id < 10"
         
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: []){
                // 遍历输出结果
                while res.next() {
                    let id = res.int(forColumn: "id")
                    let name = res.string(forColumn: "name")!
                    let age = res.int(forColumn: "age")
                    print(id, name, age)
                }
            }else{
                print("查询失败")
            }
        }
        db.close()
    }
    //2)预编译方式
    func checkdata2()  {
        // 编写SQL语句
        let sql = "SELECT * FROM User WHERE id < ?"
         
        // 执行SQL语句
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: [10]){
                // 遍历输出结果
                while res.next() {
                    let id = res.int(forColumn: "id")
                    let name = res.string(forColumn: "name")!
                    let age = res.int(forColumn: "age")
                    print(id, name, age)
                }
            }else{
                print("查询失败")
            }
        }
        db.close()
    }
    
    //删除表drop table User
    //查询表结构（建表语句）select sql from sqlite_master where name = 'User'
    //新增表字段ALTER TABLE User ADD phone varchar(256);
    
    func deleteTabel()  {
        
        let sql = "drop table User"
        let db = SQLiteManager.shareManger().db

        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: []){
                print("删除表")
            }else{
                print("删除表失败")
            }
        }
        db.close()
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

//事务操作
extension TestFMDBViewController{
    /*
     1，事务介绍
     （1）有时我们要对大批量的数据进行操作。比如同时插入大量的数据，如果每插入一条就提交一次的话就会比较耗时。
     （2）FMDB 提供的 FMDatabaseQueue 对象可以使用事务进行批量操作，大大缩短了插入时间。同时它还支持回滚，只要中间有一条语句执行错误，就会自动全部恢复成最初的状态
    */
    
    //批量：下面我使用事务同时插入 10 条数据
    
    // 插入数据
   func insertTransData(){
    
//        let db = SQLiteManager.shareManger().db
        if let queue = SQLiteManager.shareManger().dbQueue {
            
            queue.inTransaction { (db, rollback) in
                do {
                    for i in 0..<10 {
                        try db.executeUpdate("INSERT INTO User (name, age) VALUES (?,?);", values: ["hangge", i])
                    }
                    
                } catch {
                    print("插入失败，进行回滚")
                    //rollbaock.memory = true
                    return
                }
                
                
            }
        }
    
    }
    
}


























