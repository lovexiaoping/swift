//
//  UIPickerViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit

class UIPickerViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    var pickerView:UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView = UIPickerView()
        //将dataSource设置成自己
        pickerView.dataSource = self
        //将delegate设置成自己
        pickerView.delegate = self
        //设置选择框的默认值
        pickerView.selectRow(1,inComponent:0,animated:true)
        pickerView.selectRow(2,inComponent:1,animated:true)
        pickerView.selectRow(3,inComponent:2,animated:true)
        self.view.addSubview(pickerView)
         
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        let button = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
        button.center = self.view.center
        button.backgroundColor = UIColor.blue
        button.setTitle("获取信息",for:.normal)
        button.addTarget(self, action:#selector(getPickerViewValue),
                         for: .touchUpInside)
        self.view.addSubview(button)
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 3
       }
        
       //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
       func pickerView(_ pickerView: UIPickerView,
                       numberOfRowsInComponent component: Int) -> Int {
           return 9
       }
        
       //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                       forComponent component: Int) -> String? {
           return String(row)+"-"+String(component)
       }
        
       //触摸按钮时，获得被选中的索引
       @objc func getPickerViewValue(){
           let message = String(pickerView.selectedRow(inComponent: 0)) + "-"
               + String(pickerView!.selectedRow(inComponent: 1)) + "-"
               + String(pickerView.selectedRow(inComponent: 2))
           let alertController = UIAlertController(title: "被选中的索引为",
                                                   message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alertController.addAction(okAction)
           self.present(alertController, animated: true, completion: nil)
       }
    
    //检测响应选项的选择状态
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        print(component)
        print(row)
    }
    
    
    
    /*2，调整选择框的尺寸
     UIPickerView 用 frame 和 center 两个属性设置整个选择框的大小和位置。
     如果要调整内部列的宽度，需要实现 UIPickerViewDelegate 协议类中 pickerView:widthForComponent 方法设置
     如果要调整内部行高，则需要实习上述协议类中 pickerView:rowHeightForComponent 方法设置
     */
    
    
    //设置列宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if(0 == component){
            //第一列变宽
            return 100
        }else{
            //第二、三列变窄
            return 30
        }
    }
     
    //设置行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int)
        -> CGFloat {
        return 50
    }
    
    /*3，将图片作为选择框选项
     选择框选项的内容，除了可以使字符串类型的，还可以是任意UIView类型的元素。比如我们将选项内容设置为图片：
     */
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let image = UIImage(named:"icon_"+String(row))
        let imageView = UIImageView()
        imageView.image = image
        return imageView
        
        
        
        /**修改选项的字体大小和颜色
        
            var pickerLabel = view as? UILabel
            if pickerLabel == nil {
                pickerLabel = UILabel()
                pickerLabel?.font = UIFont.systemFont(ofSize: 13)
                pickerLabel?.textAlignment = .center
            }
            pickerLabel?.text = String(row)+"-"+String(component)
            pickerLabel?.textColor = UIColor.blue
            return pickerLabel!
         */
        
        
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
