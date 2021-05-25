//
//  HomeTableViewCell.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit
//import SDWebImage
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    //定义一个点击事件闭包
    public var btnClickBlock:( ()->() )?
    
    var showImage :UIImageView?
    var titleLab : UILabel?
    var detailLab : UILabel?
    
    //重写init 就要必须写这个
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellUI()
    
    }
    
    func setUpCellUI() {
        showImage = UIImageView.init(frame: CGRect(x: 5, y: 15, width: 90, height: 90))
        showImage?.backgroundColor  = .green
        contentView.addSubview(showImage!)
        
        
        
        titleLab = UILabel.init(frame: CGRect(x: 100, y: 15, width: 100, height: 20))
        titleLab?.textAlignment = .left
        titleLab?.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(titleLab!)
        
        detailLab = UILabel.init(frame: CGRect(x: 100, y: 60, width: 100, height: 20))
        detailLab?.font = UIFont.systemFont(ofSize: 15)
        detailLab?.textAlignment = NSTextAlignment.center
        detailLab?.textColor = UIColor.red
        contentView.addSubview(detailLab!)
        
        contentView.addSubview(actionBtn)

        
    }
    
    //懒加载
    lazy var actionBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.frame = CGRect(x: KJHelper.SCREEN_WIDTH-60, y: 35, width: 40, height: 40)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("点击", for: .normal)
        btn.addTarget(self, action:#selector(actionBtnClick), for: .touchUpInside)
        return btn
    }()
    
    @objc private func actionBtnClick(){
        btnClickBlock!()
    }
    

    func cellForModel(dic: NSDictionary?) {
        if let tempDic = dic {
            titleLab?.text = tempDic["name"] as? String
            detailLab?.text = tempDic["detail"] as? String

            let imageStr = tempDic["imageUrl"] as? String
            let imageUrl = URL(string: imageStr!)
//
            showImage?.kf.setImage(with: imageUrl)

        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
