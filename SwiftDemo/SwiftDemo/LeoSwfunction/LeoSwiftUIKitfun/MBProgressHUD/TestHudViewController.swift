//
//  TestHudViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/11.
//

import UIKit

class TestHudViewController: HUDTableBaseViewController {

    var tapHud: MBProgressHUD?
    lazy var prohud : MBProgressHUD = {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .annularDeterminate //显示环形进度条
        hud.progress = 0.0 //当前进度
        hud.label.text = "当前进度：0%"
        return hud
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "JKProgressHUD"
        self.view.backgroundColor = UIColor.brown
        self.navigationController?.navigationBar.barTintColor = .brown
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "跳转", style: .plain, target: self, action: #selector(click))
        headDataArray = ["一、使用详解：基本用法，普通提示框", "二、使用详解：带进度的提示框", "三、使用详解：对提示框进行操作：隐藏提示框", "四、使用详解：对提示框进行操作，添加点击手势", "五、修改默认样式", "六、自定义视图", "七、扩展 MBProgressHUD，封装常用方法"]
        dataArray = [["显示最简单的“菊花”的提示", "显示“纯文字”的提示", "显示“纯文字标题 + 详情”的提示", "显示“菊花 + 文字”的提示", "显示“菊花 + 文字标题 + 详情”的提示"], ["使用水平进度条", "使用环形进度条", "使用饼状进度条"], ["隐藏提示框：立刻隐藏", "隐藏提示框：延迟隐藏", "隐藏提示框：通过 minShowTime 属性可以设置最短显示时间（默认为 0）。使用这个设置可以避免提示框显示后立即被隐藏", "隐藏提示框：通过 animationType 属性可以设置提示框消失动画，有如下三种可选值：.fade：逐渐透明消失（默认值）；.zoomOut：逐渐缩小并透明消失；.zoomIn：逐渐放大并透明消失；.zoom：逐渐缩小消失", "隐藏提示框：通过 removeFromSuperViewOnHide 属性，可以设置提示框隐藏的时候是否从父视图中移除（默认为 false）"], ["下面样例给提示框添加个点击手势。当点击提示框后，提示框自动消失。当然在实际应用中，我们还可以在点击响应中进行一些其它操作，比如取消当前的网络请求等等。"], ["设置遮罩的背景色：下面将提示框遮罩设置为黑色半透明（默认为透明的）", "设置毛玻璃效果的遮罩背景：可以看到遮罩下方的控件都会有模糊效果", "设置提示框背景色，下面将提示框的背景色改成透明的", "设置提示框圆角值", "设置文字的颜色和字体", "设置菊花颜色", "设置提示框偏移量，即提示框相对于父视图中心点的偏移，正值为向右下偏移，负值为向左上偏移", "设置提示框内边距", "设置提示框的最小尺寸", "设置正方形提示框"], ["下面样例在提示框中显示一个“❤️”的图标"], ["显示成功消息", "显示失败消息", "显示普通消息", "显示等待消息", "gif动画的刷新", "测试"]]
        
        let fractionCompleted = Float(String(format: "%.2f", 0.33333333))!
        print("fractionCompleted= \(String(describing: fractionCompleted)), 百分比：\(String(format: "%.f", fractionCompleted * 100))")
    }
    
    @objc func click() {

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
