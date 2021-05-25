//
//  NavViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/20.
//

import UIKit

class NavViewController: UIViewController {

    private lazy var titleBtn: TitleOneButton = TitleOneButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funsetupNavUI()

        // Do any additional setup after loading the view.
    }


}

extension NavViewController{
    
    private func funsetupNavUI(){
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_home_highlight"), style: .plain, target: self, action: #selector(leftitemAction))
        
        titleBtn.setTitle("点击", for: .normal)
        titleBtn.addTarget(self, action: "titleBrnitemAction", for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
        
    }
    
    @objc func leftitemAction(){
        
    }
    @objc private func titleBrnitemAction(){
        titleBtn.isSelected = !titleBtn.isSelected
     
        let VC = PopoverViewController()
        VC.modalPresentationStyle = .overFullScreen
        present(VC, animated: true) {
        }
        
        
    }
}
