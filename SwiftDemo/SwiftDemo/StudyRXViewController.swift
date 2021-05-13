//
//  StudyRXViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/11.
//

import UIKit
import RxSwift

class StudyRXViewController: UIViewController {
    var disposeBag = DisposeBag()
    /// 用户名最小长度
    private let minUsernameLength = 6
    /// 密码最小长度
    private let minPasswordLength = 6
    
    
    var username: UITextField!
    var usernameValid: UILabel!

    var password: UITextField!
    var passwordValid: UILabel!
    var loginbutton :UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // 初始化控件显示
        // 初始化控件显示
        usernameValid.text = "用户名至少\(minUsernameLength)个字符……"
        passwordValid.text = "密码至少\(minUsernameLength)个字符……"
        
        
            //构建序列
        let usernameV = username.rx.text.orEmpty
            .map { $0.count >= self.minUsernameLength }
            .share(replay: 1)
        let passwordV = password.rx.text.orEmpty
            .map { $0.count >= self.minPasswordLength }
                    .share(replay: 1)
        let loginbtnV = Observable.combineLatest(usernameV, passwordV){ $0 && $1 }
            .share(replay: 1)

        // 绑定UI
        usernameV.bind(to: password.rx.isEnabled).disposed(by: disposeBag)
        usernameV.bind(to: usernameValid.rx.isHidden).disposed(by: disposeBag)
        passwordV.bind(to: passwordValid.rx.isHidden).disposed(by: disposeBag)
        loginbtnV.bind(to: loginbutton.rx.isEnabled).disposed(by: disposeBag)
        loginbutton.rx.tap.subscribe {[unowned self] (_) in
            let alert = UIAlertController(title: "提示", message: "登录成功！", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        
        
        
        let button = UIButton.init()
        button.rx.tap
            .subscribe(onNext: { [weak self] _ in self?.showAlert() })
            .disposed(by: disposeBag)

        
        
        let scrollView = UIScrollView.init()

        

        // Do any additional setup after loading the view.
    }
    
    
    func showAlert() {
        let alert = UIAlertController(
            title: "RxExample",
            message: "This is wonderful",
            preferredStyle: .alert
        )
        let defaultAction = UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
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
