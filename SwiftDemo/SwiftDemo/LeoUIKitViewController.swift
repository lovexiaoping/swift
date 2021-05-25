//
//  LeoUIKitViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

import UIKit

class LeoUIKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testButton();
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    //清空删除所有子视图（子元素）
    func clearViews() {
        for v in self.view.subviews as [UIView] {
            v.removeFromSuperview()
        }
    }
    
    
    func createUIBarButtonItem() {
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo.png"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItems = []
        
        

    }
    
    
    func createTapGestureRecognize() {
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tagGes:)))
        
        let label = UILabel.init()

        label.addGestureRecognizer(tapGes)

    }
    //获取手势所在view

    @objc private func titleLabelClick(tagGes: UITapGestureRecognizer){

        guard let currentLabel = tagGes.view as? UILabel else {return}

    }
    //获取位置
    func picTap(sender: UITapGestureRecognizer) {
            let point = sender.location(in: sender.view)

    }


    func createAlertController() {
        let alertController = UIAlertController(title:"提示", message:"学生账号注册暂未开放z", preferredStyle: .alert)

        let alertOK = UIAlertAction(title: "好的", style: .cancel, handler:nil)

        alertController.addAction(alertOK)

        present(alertController, animated:true, completion: nil)
    }

    
    
    
    //创建ImageView视图

    func createImageView() {
        let img = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(img)
        img.image = UIImage.init(named: "icon1.png")
    }
    //创建view视图

    func createView() {
       let redV = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
       
       //设置视图的背景颜色
       redV.backgroundColor = UIColor.red;
       
       //添加到当前页面
       view.addSubview(redV);
        
       redV.center = view.center;
           
    }
    
    //创建Button视图

    func testButton() {
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("test", for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        button.addTarget(self, action: #selector(didselectBtn), for: .touchUpInside)
        
        
    }
    
    //present  dismiss
    @objc func didselectBtn()  {
    
        
        let vc1 =  UIViewController.init();
        
        self.present(vc1, animated: true) {
            
        }
        
        self.dismiss(animated: true) {
            
        }

    }
    
    //pushViewController  popViewController

    @objc func backBtn()  {
    
        
        let vc1 =  UIViewController.init();
        
        self.navigationController?.pushViewController(vc1, animated: true)
        
        self.navigationController?.popViewController(animated: true)

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
