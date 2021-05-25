//
//  ZLPhotoViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/21.
//

import UIKit
import ZLPhotoBrowser
class ZLPhotoViewController: WSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y:50, width: 60, height: 50)
        button.setTitle("方式1", for: .normal)
        button.backgroundColor = UIColor.red
        SView.addSubview(button)
        button.addTarget(self, action: #selector(pushDetail1), for: .touchUpInside)

        
        let button2  = UIButton(type: .custom)
        button2.frame = CGRect(x: 150, y:50, width: 100, height: 50)
        button2.setTitle("方式2", for: .normal)
        button2.backgroundColor = UIColor.red
        SView.addSubview(button2)
        button2.addTarget(self, action: #selector(pushDetail2), for: .touchUpInside)

        
        let button3  = UIButton(type: .custom)
        button3.frame = CGRect(x: 50, y:150, width: 60, height: 50)
        button3.setTitle("", for: .normal)
        button3.backgroundColor = UIColor.red
        SView.addSubview(button3)
        button3.addTarget(self, action: #selector(pushDetail3), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func pushDetail1(){
        let ps = ZLPhotoPreviewSheet()
        ps.selectImageBlock = { [weak self] (images, assets, isOriginal) in
            // your code
        }
        ps.showPreview(animate: true, sender: self)
    }
    @objc func pushDetail2(){
        let ps = ZLPhotoPreviewSheet()
        ps.selectImageBlock = { [weak self] (images, assets, isOriginal) in
            // your code
        }
        ps.showPhotoLibrary(sender: self)

    }
    @objc func pushDetail3(){

       
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
