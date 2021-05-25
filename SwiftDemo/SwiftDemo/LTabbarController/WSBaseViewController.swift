//
//  WSBaseViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/19.
//

import UIKit

class WSBaseViewController: UIViewController {

    var titleLabel:UILabel!

    var backbuttonItem:UIButton!

    var hiddenBackItem = false
    
    var showTabbarItem = false
    
    lazy var SView: UIView = {
            let containerView = UIView()
            
            containerView.backgroundColor = .gray
            return containerView
        }()



    
    override func viewDidLoad() {
        super.viewDidLoad()

        let NavigationBarView  = UIView.init(frame: CGRect(x: 0, y: 0, width: .SCREEN_WIDTH, height: KJHelper.IPHONENavigationBarHeight()))
        NavigationBarView.backgroundColor = UIColor.red
        view.addSubview(NavigationBarView)
      
        
        titleLabel = UILabel(frame: CGRect(x: 45, y: NavigationBarView.frame.size.height-10-35, width: self.view.frame.size.width-45*2, height: 35))
        titleLabel.textAlignment = .center
        titleLabel.text = "标题"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(titleLabel)

        
        backbuttonItem  = UIButton(type: .custom)
        backbuttonItem.frame = CGRect(x: 5, y: NavigationBarView.frame.size.height-10-35, width: 35, height: 35)
        backbuttonItem.setImage(UIImage.init(named: "navigation_left_back.png"), for: .normal)
        backbuttonItem.addTarget(self, action: #selector(leftbackClick), for: .touchUpInside)
        view.addSubview(backbuttonItem)

        
        
        view.addSubview(SView)
        SView.snp.makeConstraints { (make) in
            make.top.equalTo(KJHelper.IPHONENavigationBarHeight())
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden  = true
        backbuttonItem.isHidden = hiddenBackItem
      
        let taboffset = showTabbarItem ? -(KJHelper.IPHONETabBarHeight()) : 10
        SView.snp.updateConstraints { (make) in
            make.top.equalTo(KJHelper.IPHONENavigationBarHeight())
            make.bottom.equalTo(taboffset)
        }
    }
    @objc func leftbackClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }
    

    

    
    

}

//MARK:设置UI
extension WSBaseViewController{

    //外界不能用 私有
    fileprivate func setupUI(){
        
       view.backgroundColor = UIColor.white
        
    }
    
    
    

}
