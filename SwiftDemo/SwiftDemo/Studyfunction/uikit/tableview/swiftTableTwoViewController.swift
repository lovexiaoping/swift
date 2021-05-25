//
//  swiftTableTwoViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/12.
//使用自定义cell实现带索引列表的tableView



import UIKit


//cell Identifier
let cellID = "cellID"

class swiftTableTwoViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    //tableView
        var tableView = UITableView()
        
        //数据
        var dataList = [String]()
        
        //处理后的数据(根据首字母进行分组)
        var resultDict = [String : [String]]()
        
        //组头标题数组
        var sectionTitles = [String]()
        

        override func viewDidLoad() {
            super.viewDidLoad()

            self.title = "带索引的UITableView"
            self.view.backgroundColor = .white
            
            //原始数据
            dataList = ["🐰", "秃子", "鹰酱", "毛熊", "Cat", "棒子", "脚盆鸡", "高卢鸡", "狗大户", "🐫", "沙某", "河马", "Big Dog", "Apple"]
            
            //数据处理
            createResultDict()
            
            //tableVIew
            tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
            tableView.delegate = self
            tableView.dataSource = self
            //去掉多余的分割线
            tableView.tableFooterView = UIView()
            //注册cell
            tableView.register(UINib(nibName: "TableViewCell2", bundle: nil), forCellReuseIdentifier: cellID)

            self.view.addSubview(tableView)
            
        }
        
        //MARK: - 数据处理，根据首字母进行分组
        /**
                    ```
                    数据**处理**，根据`首字母`进行分组
                    ```
         */
        func createResultDict() {
            for str in dataList {
                //获得首字母
                let firstLetterIndex = str.index(str.startIndex, offsetBy: 1)
                var firstLetter = String(str[..<firstLetterIndex])
                
                //转成大写字母
                firstLetter = firstletterFromString(str: firstLetter)
                
                if var values = resultDict[firstLetter] {
                    values.append(str)
                    resultDict[firstLetter] = values
                } else {
                    resultDict[firstLetter] = [str]
                }
                
                //组头标题
                sectionTitles = [String](resultDict.keys)
                //排序
                sectionTitles = sectionTitles.sorted(by: {$0 < $1})
            }
        }
        
        //MARK: - 将中文转成大写字母
        func firstletterFromString(str: String) -> String {
            //转变成可变字符串
            let mutableStr = NSMutableString.init(string: str)
            
            //将中文转变成带声调的拼音
            CFStringTransform(mutableStr as CFMutableString, nil, kCFStringTransformToLatin, false)
            
            //去掉声调
            let pyStr = mutableStr.folding(options: .diacriticInsensitive, locale: .current)
            
            //将拼音换成大写
            let PYStr = pyStr.uppercased()
            
            //截取大写首字母
            let index = PYStr.index(PYStr.startIndex, offsetBy: 1)
            let firstStr = PYStr[..<index]
            
            //判断首字母是否为大写
            let uppercaseLetter = "^[A-Z]$"
            let predicateLetter = NSPredicate.init(format: "SELF MATCHES %@", uppercaseLetter)
            
            return String(predicateLetter.evaluate(with: firstStr) ? firstStr : "#")
        }
        
        
        //MARK: - 返回多少组
        func numberOfSections(in tableView: UITableView) -> Int {
            return sectionTitles.count
        }
        
        //MARK: - 每组多少行
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let key = sectionTitles[section]
            guard let values = resultDict[key] else {
                return 0
            }
            return values.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell2
            
            let key = sectionTitles[indexPath.section]
            let values = resultDict[key]
            
            cell.nameLabel.text = values?[indexPath.row]
            
            cell.delegate = self
            
            return cell
        }
        
        //MARK: - 行高
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        //MARK: - section标题
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectionTitles[section]
        }
        
        //MARK: - 索引列表
        func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return sectionTitles
        }
    
    
    //MARK:-- Swift - 给表格添加Cell的显示动画（3D缩放
    //设置cell的显示动画
    private func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!,
        forRowAtIndexPath indexPath: NSIndexPath!){
        //设置cell的显示动画为3D缩放
        //xy方向缩放的初始值为0.1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        //设置动画时间为0.25秒，xy方向缩放的最终值为1
        UIView.animate(withDuration: 0.25) {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)

        }
    }


}
extension swiftTableTwoViewController: CustomCell2Delegate{
    // 06. 实现代理方法
    
    func CellbuttonClick (){
        
    }
    
    func CellbuttonClick2( newInfo:String){
        
    }
    
}
