//
//  RotateBaseViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

class RotateBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    ///强制横屏
    func forceOrientationLandscape() {
           let appdelegate = UIApplication.shared.delegate as! AppDelegate
           appdelegate.isForceLandscape = true
           appdelegate.isForcePortrait = false
           appdelegate.application(UIApplication.shared, supportedInterfaceOrientationsFor: self.view.window)
           
           //强制翻转屏幕，Home键在右边。
           UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
           //刷新
           UIViewController.attemptRotationToDeviceOrientation()
           
       }
       
    
    
    ///强制竖屏
       func forceOrientationPortrait() {
           let appdelegate = UIApplication.shared.delegate as! AppDelegate
           appdelegate.isForceLandscape = false
           appdelegate.isForcePortrait = true
           appdelegate.application(UIApplication.shared, supportedInterfaceOrientationsFor: self.view.window)
           
           //强制翻转屏幕，Home键在右边。
           UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
           //刷新
           UIViewController.attemptRotationToDeviceOrientation()
           
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
