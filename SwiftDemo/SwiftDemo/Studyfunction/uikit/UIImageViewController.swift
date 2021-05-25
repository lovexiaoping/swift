//
//  UIImageViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UIImageViewController: UIViewController {
    
    var imageViewAnimation:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image:UIImage(named:"image1"))
        imageView.frame = CGRect(x:10, y:30, width:300, height:150)
        self.view.addSubview(imageView)
        imageView.image = UIImage(named:"icon2")
        
        
        //保持图片比例
        //默认 UIImageView 会拉伸图片使其占满整个 UIImageView，如果不想让图片变形，可以将 ContentMode 设置为 Aspect Fit。

        imageView.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    //MARK:-- 从文件目录中获取图片

    func loadimage()  {
        
        let path = Bundle.main.path(forResource: "ball", ofType: "png")
        let newImage = UIImage(contentsOfFile: path!)
        let imageView2 = UIImageView(image:newImage)
        self.view.addSubview(imageView2)
        
    }
    //MARK:-- 从网络地址获取图片

    func loadimage1()  {
        //定义URL对象
        let url = URL(string: "http://hangge.com/blog/images/logo.png")
        //从网络获取数据流
        let data = try! Data(contentsOf: url!)
        //通过数据流初始化图片
        let newImage = UIImage(data: data)
        let imageView = UIImageView(image:newImage);
        self.view.addSubview(imageView)
    }
    //MARK:-- 使用图像控件实现动画播放

    /*
     UIImageView 中提供了存储多张图片来创建动画的功能，具体做法是，在 animationImages 属性中设置一个图片数组，然后使用 startAnimating 方法开始动画，最后用 stopAnimating 方法停止动画。同时，使用 animationDuration 属性中可以设置动画每帧切换的速度（秒）。
     */
    

    
    func loadimage2()  {

        imageViewAnimation? = UIImageView()
        imageViewAnimation?.frame=CGRect(x:20, y:20, width:100, height:100)
       //设置动画图片
        imageViewAnimation?.animationImages = [UIImage(named:"icon1")!,UIImage(named:"icon2")!]
       //设置每隔0.5秒变化一次
        imageViewAnimation?.animationDuration=0.5
       self.view.addSubview(imageViewAnimation!)
}
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        imageViewAnimation.startAnimating()
      }
       
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillAppear(animated)
        imageViewAnimation?.stopAnimating()
      }
   
      override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }

}
