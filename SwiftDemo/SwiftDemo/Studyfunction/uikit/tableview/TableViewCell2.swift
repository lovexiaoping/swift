//
//  TableViewCell2.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/12.
//

import UIKit
// 01. 定义协议
protocol CustomCell2Delegate: NSObjectProtocol{
    // 02. 定义协议方法
    func CellbuttonClick ()
    
    func CellbuttonClick2( newInfo:String)

}

class TableViewCell2: UITableViewCell {
   
    weak var delegate: CustomCell2Delegate?
       
    lazy var button: UIButton = {
          
           let btn = UIButton(type: UIButton.ButtonType.custom)
           btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
           btn.backgroundColor = UIColor.white
           btn.frame = CGRect(x: 50, y: 20, width: 60, height: 60)
           btn.addTarget(self, action: #selector(ButtonClick), for: .touchUpInside)
           return btn
       }()
    lazy var button2: UIButton = {
          
           let btn = UIButton(type: UIButton.ButtonType.custom)
           btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
           btn.backgroundColor = UIColor.white
           btn.frame = CGRect(x: 150, y: 20, width: 60, height: 60)
        btn.addTarget(self, action: #selector(ButtonClick2(button:)), for: .touchUpInside)
           return btn
       }()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        addSubview(button)
        addSubview(button2)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func ButtonClick() {
           // 04. 执行代理
           delegate?.CellbuttonClick()
       }
    @objc func ButtonClick2(button: UIButton) {
        print(button.tag)
           // 04. 执行代理
           delegate?.CellbuttonClick2(newInfo: "hello")
       }
}
