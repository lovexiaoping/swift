//
//  UIProgressViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UIProgressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //创建进度条
        
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.center = self.view.center
        progressView.progress = 0.5 //默认进度50%
        self.view.addSubview(progressView)
        
        
        //设置进度，同时有动画效果
        progressView.setProgress(0.8, animated:true)
        
        
        
        //改变进度条颜色
        progressView.progressTintColor = UIColor.green  //已有进度颜色
        progressView.trackTintColor = UIColor.blue  //剩余进度颜色（即进度槽颜色）
        // Do any additional setup after loading the view.
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
