//
//  swiftTableViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/12.
// Swift - UITableView的简单实现



import UIKit

class swiftTableViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    var tableView   = UITableView()
    
    var dataList: NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "tableview"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))

        dataList = NSMutableArray.init(array: ["狗欧股","毛毛","花花"])
        
    
        
        // Do any additional setup after loading the view.
    }
    //MARK: ---  实例化tableview
    func createTableviewUI() {
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        //注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.tableFooterView = UIView()
        
        //去除分割线
        //tableView.separatorStyle = .none
        
        self.view.addSubview(tableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return dataList.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)

        cell.textLabel?.text = dataList[indexPath.row] as? String

        return cell
    }
    //MARK: - 行高
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 60
      }
    
    
    //MARK: - 点击cell
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          print(dataList[indexPath.row])
      }
    
    
    //MARK: - 使cell的分割线与屏幕两端对齐
       func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
               cell.separatorInset = .zero
           }
           if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
               cell.layoutMargins = .zero
           }
       }
    //MARK: - 删除单元格
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            print("要删除\(dataList[indexPath.row])")
            
            let alertC = UIAlertController.init(title: "温馨提示", message: "确定要删除\(dataList[indexPath.row])？", preferredStyle: .alert)
            alertC.addAction(UIAlertAction.init(title: "确定", style: .destructive, handler: { (UIAlertAction) in
                           self.dataList.removeObject(at: indexPath.row)
                           tableView.reloadData()
                       }))
            alertC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
            present(alertC, animated: true, completion: nil)
           
        }
        if editingStyle == .insert {
            print("增加")

        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //MARK: - 排序
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        dataList.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
        tableView.reloadData()
    }
      
    
    
    
    //MARK: - 设置编辑样式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //编辑的时候返回带有选择按钮的样式
//        return UITableViewCell.EditingStyle(rawValue: UITableViewCell.EditingStyle.RawValue(UInt8(UITableViewCell.EditingStyle.insert.rawValue) | UInt8(UITableViewCell.EditingStyle.delete.rawValue)))!
        
        //添加
//        return .insert
        
        //删除
        return .delete
    }
    @objc func editAction()  {
        //设置为可编辑
        tableView.setEditing(true, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(doneAction))

    }
    
    //MARK: - 编辑完成
    @objc func doneAction() {
        //设置不可编辑
        tableView.setEditing(false, animated: true)
        
        //右上角编辑按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
        
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
