//
//  SwiftCollectionViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit
import EmptyPage
class SwiftCollectionViewController:RotateBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var colltionView: UICollectionView!

    var dataArr = NSMutableArray()//数据源
       let width = UIScreen.main.bounds.size.width//获取屏幕宽
       let height = UIScreen.main.bounds.size.height//获取屏幕高
    
    var dataSource = [
         ["name":"地址管理","pic":"IQH_mine_address"],
         ["name":"我的收藏","pic":"IQH_mine_myCollection"],
         ["name":"账号信息","pic":"IQH_mine_accountInformation"],
         ["name":"系统设置","pic":"IQH_mine_systemSetting"]
     ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 强制竖屏
        forceOrientationLandscape()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        initView()

    }
    
    
    func initView(){
        let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: (self.view.bounds.size.width - 40) / 3, height: (self.view.bounds.size.width - 40) / 3 + 30)
        colltionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        colltionView.register(SHomeCell.self, forCellWithReuseIdentifier: "cell")
        colltionView.delegate = self
        colltionView.dataSource = self
        colltionView.backgroundColor = UIColor.white
             view.addSubview(colltionView)
    
//        let customEmptyView = UIView()
//        colltionView.ep.set(emptyView: customEmptyView)
      }

       func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return dataSource.count
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SHomeCell
        let data = dataSource[indexPath.row]
                cell.imageView.image = UIImage(named: data["pic"] ?? "");
                cell.titleLabel.text = data["name"] ?? ""
        
        cell.delegate = self

        return cell
        
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

// 05.1 遵守代理协议
/** extension
 -- extension 类似于 OC 中的 Category
 -- 格式: extension 类名 {}
 -- Swift中 代码可读性差, 通过 extension 完成代码分块, 增强可读性, 单一模块单独处理, 增大了当前类的作用域
 -- extension 中 可以添加计算型属性 不能添加存储型属性; 可以定义便利构造函数 不能定义指定构造函数
 */
extension SwiftCollectionViewController: CustomCollectionViewDelegate{
    // 06. 实现代理方法
    func whiteButtonClick() {
        print("ViewController中监听到了按钮点击")
    }
}
