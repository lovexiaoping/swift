//
//  POPGestureViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit

class POPGestureViewController: UIViewController ,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fd_prefersNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
