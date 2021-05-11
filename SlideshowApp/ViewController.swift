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
    @IBAction func tapImageView(_ sender: Any) {
        
    }
    
    // 表示している画像のインデックス宣言
    var dispImageNo = 0
    
    // 表示している画像のインデックスを元に画像を更新する
    func displayImage() {
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

