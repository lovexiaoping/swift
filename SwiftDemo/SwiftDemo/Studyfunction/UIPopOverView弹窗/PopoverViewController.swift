//
//  PopoverViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class PopoverViewController: UIViewController {

    private lazy var view1 : UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        
        view1.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        view1.backgroundColor = .yellow
        view1.layer.cornerRadius = 10
        view1.layer.masksToBounds = true
        view.addSubview(view1)
        view1.snp.makeConstraints { (make) in
            make.top.equalTo(KJHelper.IPHONENavigationBarHeight())
            make.height.equalTo(300)
            make.left.equalTo(50)
            make.right.equalTo(-50)
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: true, completion: nil)
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
