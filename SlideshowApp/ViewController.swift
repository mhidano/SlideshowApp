//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 肥田野守和 on 2021/05/07.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onPreview: UIButton!
    @IBOutlet weak var onNext: UIButton!
    @IBOutlet weak var onSlideShow: UIButton!
    
    @IBAction func onPreview(_ sender: Any) {
        // 表示している画像のインデックスを1減らす
        dispImageNo -= 1
        // 画像更新
        displayImage()
    }
    
    @IBAction func onNext(_ sender: Any) {
        // 表示している画像のインデックスを1増やす
        dispImageNo += 1
        // 画像更新
        displayImage()
    }
    
    @IBAction func onSlideShow(_ sender: Any) {
        // 再生中か停止しているかを判別
        if timer == nil {
            //【再生中の処理】
            // 表示している画像のインデックスを1増やす
            dispImageNo += 1
            // "進む"ボタンと"戻る"ボタンを無効（タップ不可）とする
            onPreview.isEnabled = false
            onNext.isEnabled = false
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeDisplayImage), userInfo: nil, repeats: true)
            // ボタンの名前を"停止"に変える
            onSlideShow.setTitle("停止", for: .normal)
        } else {
            //【停止中の処理】
            // タイマーを停止する
            timer.invalidate()
            // タイマーを削除しておく（timer.invalidateだけだとtimerがnilにならないため）
            timer = nil
            // "進む"ボタンと"戻る"ボタンを有効（タップ可）とする
            onPreview.isEnabled = true
            onNext.isEnabled = true
            // ボタンの名前を"再生"に変える
            onSlideShow.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func tapImageView(_ sender: Any) {
    }
    
    // 表示している画像のインデックス宣言
    var dispImageNo:Int = 0
    // スライドショーに使用するタイマー宣言
    var timer: Timer!
    
    // 表示している画像のインデックスを元に画像を更新する
    // "@objc"をつけないと上のTimer.scheduledTimerの"selector"にてエラーが出る
    @objc func displayImage() {
        // 画像の名前の配列
        let imageNameArray = [
            "pexels-koolshooters-7329628",
            "pexels-koolshooters-7329629",
            "pexels-koolshooters-7329631",
            "pexels-koolshooters-7329634",
            "pexels-koolshooters-7329635",
        ]
        //【配列の範囲チェック】
        // ・範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        // ・範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        // 表示している画像のインデックスから名前を取り出す
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    // スライドショー用の画像更新処理
    @objc func changeDisplayImage() {
        // 表示している画像のインデックスを1増やす
        dispImageNo += 1
        // 画像更新
        displayImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 本プロジェクトにバンドルした画像ファイルを読み込み
        let image = UIImage(named: "pexels-koolshooters-7329628")
        // Image Viewに画像を設定
        imageView.image = image
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }

}

