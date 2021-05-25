//
//  SSecondViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

class SSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden  = true

        
        struct Login: Encodable {
            let email: String
            let password: String
        }
        let loginparm = Login(email: "test@test.test", password: "testPassword")

        //01
        LeoAlamofireManager.GET(URLString: "") { (result) in
            
        } failed: { (error) in
            
        }
        //02
        LeoAlamofireManager.GETWithPrms(URLString: "", parms: loginparm) { (result) in
            print(result)
        } failed: { (error) in
            print(error?.code ?? 2000)

        }
        //03
        LeoAlamofireManager.POSTWithPrms(URLString: "", parms: loginparm) { (result) in
            
        } failed: { (error) in
            
        }
    
        
        
        

        
        
        
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
