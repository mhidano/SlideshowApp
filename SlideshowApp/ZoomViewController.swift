//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 肥田野守和 on 2021/05/11.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomImageView: UIImageView!
    
    // 受け取り用変数宣言
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.zoomImageView.image = self.image
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
