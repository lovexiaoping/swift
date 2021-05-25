//
//  HomeTableViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit
import EmptyPage
import SBCycleScrollView
import MJRefresh
import Async

class HomeTableViewController:  WSBaseViewController ,UIScrollViewDelegate,CycleScrollViewDelegate {
    var dataList: NSMutableArray = []
    var dataList1: NSMutableArray = []
    var emView: UIView = UIView()
    lazy var tableView :UITableView = {
        var tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        //注册cell
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    lazy var view1 : UIView = {
        
        var HeaderV :UIView = UIView(frame: CGRect(x: 0, y: 0, width: KJHelper.SCREEN_WIDTH, height: 200))
        HeaderV.backgroundColor = .yellow
        
        var imageUrls: NSArray = ["https://t7.baidu.com/it/u=2582370511,530426427&fm=193&f=GIF","http://ww1.sinaimg.cn/large/0065qDengy1fhrl6g5i6vj30a606kacy.jpg","http://ww1.sinaimg.cn/large/0065qDengy1fhrl6g5i6vj30a606kacy.jpg"]

        var options : CycleOptions = CycleOptions()
        options.currentPageDotColor = .blue
        options.radius = 5
        options.pageStyle = PageControlStyle.jalapeno
               
        let cycleScrollView = CycleScrollView.initScrollView(frame: CGRect(x: 0, y: 0, width: KJHelper.SCREEN_WIDTH, height: 200), delegate: self, placehoder: UIImage(named: "pic_placeholder.jpg"), cycleOptions: options);
        cycleScrollView.imageURLStringsGroup = imageUrls as! [String];

        HeaderV.addSubview(cycleScrollView)
        cycleScrollView.snp.makeConstraints() { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        return HeaderV

    }()
    
    lazy var view2 : UIView = {
        
        var HeaderV :UIView = UIView(frame: CGRect(x: 0, y: 0, width: KJHelper.SCREEN_WIDTH, height: 80))
        HeaderV.backgroundColor = .yellow
        
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 20, width: 80, height: 40)
        button.setTitle("清空数据", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(clearData), for: .touchUpInside)
        
        HeaderV.addSubview(button)

        return HeaderV

    }()
    
    func didSelectedCycleScrollView(_ cycleScrollView : CycleScrollView, _ Index : NSInteger){
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let imageu1 : String = "http://ww1.sinaimg.cn/large/0065qDengy1fhrl6g5i6vj30a606kacy.jpg"
        
        dataList = NSMutableArray.init(array: [["name":"图片选择器","detail":"描述1","imageUrl":imageu1],
            ["name":"笑话2","detail":"描述2","imageUrl":imageu1],["name":"笑话3","detail":"描述1","imageUrl":imageu1],["name":"笑话3","detail":"描述1","imageUrl":imageu1],["name":"笑话3","detail":"描述1","imageUrl":imageu1],["name":"笑话3","detail":"描述6","imageUrl":imageu1]])

        dataList1 = dataList
        
        SView.addSubview(tableView)
        tableView.snp.makeConstraints() { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    
        tableView.tableHeaderView = view1
        tableView.tableFooterView = view2
        
    

        //占位图
        let customEmptyView = UIView()
        customEmptyView.backgroundColor = .gray
        
        let image = UIImage(named: "empty-1001.png")!

        let showImage = UIImageView.init(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        showImage.backgroundColor  = .green
        showImage.image = image

        let reloadbutton  = UIButton(type: .custom)
        reloadbutton.setTitle("重新加载", for: .normal)
        reloadbutton.backgroundColor = UIColor.red
        reloadbutton.addTarget(self, action: #selector(didselectBtn), for: .touchUpInside)
    
        //加载button的网络图片
        reloadbutton.kf.setImage(with: URL(string:""), for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        reloadbutton.kf.setBackgroundImage(with: URL(string: ""), for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        
        
        customEmptyView.addSubview(showImage)
        customEmptyView.addSubview(reloadbutton)

        showImage.snp.makeConstraints() { (make) in
            // 宽高相等时，我们直接写把size写成一遍就行，即 width = height = 100
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
        
        
        reloadbutton.snp.makeConstraints() { (make) in
            // 宽高相等时，我们直接写把size写成一遍就行，即 width = height = 100
            make.size.equalTo(CGSize(width: 100, height: 40))
            make.centerX.equalToSuperview()
            make.top.equalTo(showImage.snp.bottom).offset(20)
            /* 实例
             make.center.equalToSuperview()

             
                 make.directionalVerticalEdges.equalToSuperview()
                 make.directionalHorizontalEdges.equalToSuperview()
             
             make.verticalEdges.equalToSuperview()
             make.horizontalEdges.equalToSuperview()
             
             */
        }
        
        tableView.ep.set(emptyView: customEmptyView)

        
        setupMJRefresh()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupMJRefresh() {
        // Example as MJRefreshNormalHeader
        
        tableView.mj_header? = MJRefreshNormalHeader.init(refreshingBlock:{
            let seconds = 3.0
            Async.main(after: seconds) {
                print("Is called after 3 seconds")
                self.tableView.mj_header?.endRefreshing()
            }

        })
        tableView.mj_header?.beginRefreshing()
        
    }
    func addRefreshHeader() {
//        MJRefreshNormalHeader { [weak self] in
              // do some Requst
//        }
    }
    
    //PullToRefreshKit 下拉刷新
    func setupUI() {
        /*
        //下拉刷新
        
        tableView.configRefreshHeader(container:self) { [weak self] in
            delay(2, closure: {
                self?.tableView.switchRefreshHeader(to: .normal(.success, 0.5))
            })
        }
        tableView.switchRefreshHeader(to: .normal(.none, 0.0))

        
        //上拉加载更多： Pull up to load more
        tableView.configRefreshFooter(container:self) { [weak self] in
            delay(1.5, closure: {
                self?.tableView.switchRefreshFooter(to: .normal)
            })
        };
        //移除footer
        tableView.switchRefreshFooter(to: .removed)

        
        //没有更多数据
        tableView.switchRefreshFooter(to: .noMoreData)

        */
    }
    
    
    
    
    
    @objc func didselectBtn() {
        dataList = dataList1
        self.tableView.reloadData()

    }
    @objc func clearData() {
        
        
        
        self.dataList = NSMutableArray.init()
        tableView.reloadData()
    }
    
    

}
//MARK:-- tableview 协议
//折叠打开代码块：快捷键  command+option+left/right


extension HomeTableViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return dataList.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)as! HomeTableViewCell
        //取消选中状态
        cell.selectionStyle = .none
        let model:NSDictionary = dataList .object(at: indexPath.row) as! NSDictionary
//        cell.cellForModel(model: NSDictionary)
        cell.cellForModel(dic: model)

        
        cell.btnClickBlock = {[weak self]()in
            print("点击了按钮，当前是第：\(indexPath.row)行 ，且事件传递到了控制器内");
//            self.animateTableView()
            
            self?.pushNextViewController(indexCell: indexPath.row)
            

        }

        return cell
    }
    func pushNextViewController(indexCell:Int) {
        
        let vc1 =  ZLPhotoViewController.init();
        self.navigationController?.pushViewController(vc1, animated: true)
        
    }
    
    
    
    //MARK: - 行高
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120
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
    
    
        
    //cell 动画
     func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }
        
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
     func animateTableView() {
            let cells = tableView.visibleCells
            let tableHeight: CGFloat = tableView.bounds.size.height
            for (index, cell) in cells.enumerated() {
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
            }

    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {



    }


    
}
