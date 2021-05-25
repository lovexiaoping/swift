//
//  TestScrollViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class TestScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let numOfPages = 3
        let pageWidth = KJHelper.SCREEN_WIDTH
        let pageHeight =  KJHelper.SCREEN_HEIGHT
        
        //scrollView的初始化
       let scrollView = UIScrollView()
       scrollView.frame = self.view.bounds
       //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize = CGSize(width: pageWidth * CGFloat(numOfPages),
                                       height: pageHeight)
       scrollView.isPagingEnabled = true
       scrollView.showsHorizontalScrollIndicator = false
       scrollView.showsVerticalScrollIndicator = false
       scrollView.scrollsToTop = false
        
       //添加子页面
       for i in 0..<numOfPages{
           let SubVc = SubViewController(number:(i+1))
        SubVc.view.frame = CGRect(x:pageWidth*CGFloat(i), y:0,
                                                width:pageWidth, height:pageHeight)
           scrollView.addSubview(SubVc.view)
       }
       self.view.addSubview(scrollView)
        
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
