//
//  SqLiteManger.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit
import SQLite


struct TableColumn {
    var cid:Int64?
    var name:String?
    var type:String?
    var notnul:Int64?
    var defaultValue:Any?
    var primaryKey:Int64?
}

//
//swift中，一个对象可以不继承自NSObject
//－ 继续自NSObject 可以使用KVC方法给属性设置数值  ＝》如果是模型对象，最好还是使用NSObject
//－ 如果对象，没有属性，或者不依赖KVC , 可以建立一个没有父类的对象！， 对象的量级比较轻，加载时，就在内存创建
//   什么，内存消


class SqLiteManger: NSObject {
//class SqLiteManger {

    private var db:Connection?
    init(sqlPath:String) {
        db = try? Connection.init(sqlPath)
        db?.busyTimeout = 5.0
    }
    
    

    
}


//MARK:- 创建/删除/更新 表
extension SqLiteManger{
    //创建表
    func createTable(tableName:String, block: (TableBuilder) -> Void) -> Table? {
        do{
            let table = Table.init(tableName)
            try db?.run(table.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (builder) in
                block(builder)
            }))
            return table
        }catch(let error){
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    //@discardableResult表示取消&不使用 返回值的警告
    
    //删除表
    @discardableResult func deleteTable(tableName:String) -> Bool {
        let exeStr = "drop table if exists \(tableName) "
        do {
            try db?.execute(exeStr)
            return true
        }catch(let error){
            debugPrint(error.localizedDescription)
            return  false
        }
    }
    
    //更新表
    @discardableResult func updateTable(oldName:String,newName:String) -> Bool {
        let exeStr = "alter table \(oldName) rename to \(newName) "
        do {
            try db?.execute(exeStr)
            return true
        }catch(let error){
            debugPrint(error.localizedDescription)
            return  false
        }
    }
    
}


//MARK:- addColumn添加字段  /checkColumnExist检查 /allColumns 所有
extension SqLiteManger{
    
    //addColumn
    @discardableResult func addColumn(tableName:String,columnName:String,columnType:String) -> Bool {
        let exeStr = "alter table \(tableName) add \(columnName) \(columnType) "
        do {
            try db?.execute(exeStr)
            return true
        }catch(let error){
            debugPrint(error.localizedDescription)
            return  false
        }
    }
    
    //checkColumnExist
    func checkColumnExist(tableName:String,columnName:String) -> Bool {
        return  allColumns(tableName: tableName).filter { (model) -> Bool in
            return model.name == columnName
        }.count != 0
    }
    
    //allColumns
    func allColumns(tableName:String) -> [TableColumn] {
        let exeStr = "PRAGMA table_info([\(tableName)]) "
        do {
            let stmt = try db?.prepare(exeStr)
            guard let result = stmt else {
                return []
            }
            var columns:[TableColumn] = []
            for case let row in result {
                guard row.count == 6 else {
                    continue
                }
                let column = TableColumn.init(cid: row[0] as? Int64, name: row[1] as? String, type: row[2] as? String, notnul: row[3] as? Int64 ??  0, defaultValue: row[4], primaryKey: row[5]  as? Int64 ??  0)
                columns.append(column)
                print(row)
            }
            return  columns
        }catch(let error){
            debugPrint(error.localizedDescription)
            return  []
        }
    }
}


//MARK:- insert  /delete /update /select

extension SqLiteManger{
    @discardableResult func insert (table:Table?,setters:[Setter]) -> Bool{
        guard let tab = table else {
            return false
        }
        do {
            try db?.run(tab.insert(setters))
            return true
        } catch let error {
            debugPrint(error.localizedDescription)
            return false
        }
    }
    
    @discardableResult func delete(table:Table?,filter: Expression<Bool>? = nil) -> Bool{
        guard var filterTable = table else {
            return false
        }
        do {
            if let filterTemp = filter  {
                filterTable = filterTable.filter(filterTemp)
            }
            try db?.run(filterTable.delete())
            return true
        } catch let error {
            debugPrint(error.localizedDescription)
            return false
        }
    }
    
    @discardableResult func update(table:Table?,setters:[Setter],filter: Expression<Bool>? = nil) -> Bool {
        guard var filterTable = table else {
            return false
        }
        do {
            if let filterTemp = filter  {
                filterTable = filterTable.filter(filterTemp)
            }
            try db?.run(filterTable.update(setters))
            return true
        } catch let error {
            debugPrint(error.localizedDescription)
            return false
        }
    }
    
    func select(table:Table?,select: [Expressible] = [],filter: Expression<Bool>? = nil, order: [Expressible] = [], limit: Int? = nil, offset: Int? = nil) -> [Row]? {
        guard var queryTable = table else {
            return nil
        }
        do {
            if select.count != 0{
                queryTable = queryTable.select(select).order(order)
            }else{
                queryTable = queryTable.order(order)
            }
            
            if let filterTemp = filter {
                queryTable = queryTable.filter(filterTemp)
            }
            if let lim = limit{
                if let off = offset {
                    queryTable = queryTable.limit(lim, offset: off)
                }else{
                    queryTable = queryTable.limit(lim)
                }
            }
            guard let result = try db?.prepare(queryTable) else { return nil }
            return Array.init(result)
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}

