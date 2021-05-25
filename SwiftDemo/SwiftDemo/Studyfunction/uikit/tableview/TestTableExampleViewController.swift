//
//  TestTableExampleViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class TestTableExampleViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    var ctrlnames:[String]?
    var tableView:UITableView?
     
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //初始化数据，这一次数据，我们放在属性列表文件里
           self.ctrlnames = NSArray(contentsOfFile:
               Bundle.main.path(forResource: "Controls", ofType:"plist")!) as? Array
            
           print(self.ctrlnames)
        
        
        
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
         
        //创建表头标签
        let frame = CGRect(x:0, y:0, width:self.view.bounds.size.width, height:30)
        let headerLabel = UILabel(frame: frame)
        headerLabel.backgroundColor = UIColor.black
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.text = "常见 UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView!.tableHeaderView = headerLabel

        // Do any additional setup after loading the view.
    }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
         
        //返回表格行数（也就是返回控件数）
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.ctrlnames!.count
        }
         
        //创建各单元显示内容(创建参数indexPath指定的单元）
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
            -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                     for: indexPath)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = self.ctrlnames![indexPath.row]
            return cell
        }
         
        // UITableViewDelegate 方法，处理列表项的选中事件
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.tableView!.deselectRow(at: indexPath, animated: true)
             
            let itemString = self.ctrlnames![indexPath.row]
             
            let alertController = UIAlertController(title: "提示!",
                                    message: "你选中了【\(itemString)】", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "确定", style: .default,handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
         
    
   
        //修改删除按钮的文字
        func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt
            indexPath: IndexPath) -> String? {
            return "删"
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
