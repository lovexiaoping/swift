//
//  UISegmentedViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UISegmentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //选项除了文字还可以是图片
       let items = ["选项一", "选项二", UIImage(named: "g1")!] as [Any]
       let segmented = UISegmentedControl(items:items)
       segmented.center = self.view.center
       segmented.selectedSegmentIndex = 1 //默认选中第二项
       segmented.addTarget(self, action: #selector(self.segmentDidchange(_:)),
                           for: .valueChanged)  //添加值改变监听
       self.view.addSubview(segmented)



       // 选择控件中选项的添加和删除
        //添加文字选项
        segmented.insertSegment(withTitle: "新增选项", at:1, animated:true);
        //添加图片选项
        segmented.insertSegment(with: UIImage(named:"icon")!, at:1, animated: true)
        //移除选项
        segmented.removeSegment(at: 1, animated:true)
        
        
        
        
        //修改选项颜色（包括图片选项）
        
        segmented.tintColor = UIColor.red

        
        
        //修改选项文字
        segmented.setTitle("swfit", forSegmentAt:1)
        
        
        //修改选项图片
        //图片会自动变成蓝色
        segmented.setImage(UIImage(named:"icon"), forSegmentAt:2)
        //图标保留原来的颜色
        segmented.setImage(UIImage(named:"icon")?.withRenderingMode(.alwaysOriginal), forSegmentAt:2)
        
        //修改选项内容偏移位置
        segmented.setContentOffset(CGSize(width:10, height:7), forSegmentAt:1)
        
        // Do any additional setup after loading the view.
    }
    @objc func segmentDidchange(_ segmented:UISegmentedControl){
           //获得选项的索引
           print(segmented.selectedSegmentIndex)
           //获得选择的文字
           print(segmented.titleForSegment(at: segmented.selectedSegmentIndex))
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
