//
//  GPUImageViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/22.
//

import UIKit
import GPUImage
class GPUImageViewController: WSBaseViewController ,GPUImageMovieDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let button  = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y:50, width: 60, height: 50)
        button.setTitle("方式1", for: .normal)
        button.backgroundColor = UIColor.red
        SView.addSubview(button)
        button.addTarget(self, action: #selector(doCamera), for: .touchUpInside)

        
        // Do any additional setup after loading the view.
    }
    

   @objc func doCamera()  {
        /*
       将滤镜接入app非常简单，只要创建一个GPUImageMovie，一个具体的GPUImageFilter和一个用来显示的GPUImageView，然后按处理链条的上下游关系把它们用addTarget串起来。
     */
        do {
            
            let stillCamera = GPUImageStillCamera()
            stillCamera.outputImageOrientation = .portrait
            let filter = GPUImageGammaFilter()
            stillCamera.addTarget(filter)
            
            if let filterView = self.view as? GPUImageView {
                filter.addTarget(filterView)
                stillCamera.startCapture()
            }
            
            
        } catch {
            fatalError("Could not initialize rendering pipeline: \(error)")
        }
    
    

    }
    
    @objc func doCamera2()  {
         
         do {
            let Gimage : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            Gimage.image = UIImage(named: "")
             
            let movie = GPUImageMovie(url: URL(string: ""))
            movie?.shouldRepeat = true;
            movie?.playAtActualSpeed = true;
            movie?.delegate = self;
            
            //胶片效果
            let filter = GPUImageGammaFilter()
            movie?.addTarget(filter)
            if let filterView = self.view as? GPUImageView{
                filter.addTarget(filterView)
                movie?.startProcessing()

            }

            
            
             
             
         } catch {
             fatalError("Could not initialize rendering pipeline: \(error)")
         }
     
     
     

     }
    
    func didCompletePlayingMovie() {
        
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
