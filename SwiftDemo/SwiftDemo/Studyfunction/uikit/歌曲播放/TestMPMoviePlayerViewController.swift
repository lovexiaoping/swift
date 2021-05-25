//
//  TestMPMoviePlayerViewController.swift
//  SwiftDemo
//
//  Created by admin on 2021/5/25.
//

import UIKit
import MediaPlayer

class TestMPMoviePlayerViewController: UIViewController {

    
    //申明一个媒体播放控件
    var audioPlayer = MPMoviePlayerController()
    //申明一个计时器
    var timer:Timer?


    //ProgressView控件 播放进度条
    var progressView: UIProgressView!
    //Label控件 播放时间
    var playTime: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        onSetAudio(url: "http://www.hangge.com/mp3/music.mp3")

        // Do any additional setup after loading the view.
    }
    
   //播放歌曲
   func onSetAudio(url:String){
       //暂停当前歌曲的播放
       self.audioPlayer.stop()
       //获取歌曲文件
       self.audioPlayer.contentURL = URL(string:url)
       //播放歌曲
       self.audioPlayer.play()
       //先停掉计时器
       timer?.invalidate()
       //将计时器归零
       playTime!.text="00:00"
       //开启计时器
    
    timer=Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.onUpdate), userInfo: nil, repeats: true)

   }
    //计时器更新方法
     @objc   func onUpdate(){
            //返回播放器当前的播放时间
            let c=audioPlayer.currentPlaybackTime
            if c>0.0 {
                //歌曲的总时间
                let t = audioPlayer.duration
                //歌曲播放的百分比
                let p:CFloat=CFloat(c/t)
                //通过百分比设置进度条
                progressView!.setProgress(p, animated: true)
                 
                //一个小算法，来实现00：00这种格式的播放时间
                let all:Int=Int(c)
                let m:Int=all % 60
                let f:Int=Int(all/60)
                var time:String=""
                if f<10{
                    time="0\(f):"
                }else {
                    time="\(f)"
                }
                if m<10{
                    time+="0\(m)"
                }else {
                    time+="\(m)"
                }
                //更新播放时间
                playTime!.text=time
            }
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
