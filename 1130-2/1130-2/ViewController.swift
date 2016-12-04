//
//  ViewController.swift
//  1130-2
//
//  Created by TEST on 2016/11/30.
//  Copyright © 2016年 TEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var img01 :UIImage = UIImage(named:"image1.jpg")!
    var img02 :UIImage = UIImage(named:"image2.jpg")!
    var img03 :UIImage = UIImage(named:"image3.jpg")!
    var img04 :UIImage = UIImage(named:"image4.jpg")!
    
    var imgArray:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()}
    
    @IBOutlet weak var image: UIImageView!
    @IBAction func tap(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        if let testInt = userDefaults.integerForKey: ("testInt") {
           image.image = imgArray[testInt]
        }

        imgArray = [img01,img02,img03,img04]
        var ret = Int(arc4random_uniform(4))
        image.image = imgArray[ret]
        
        //ラベルの文字列を保存する。
        userDefaults.set(ret, forKey: "testInt")
        let result2 = userDefaults.integer(forKey: "testInt")
        image.image = imgArray[result2]
        //plistファイルへの出力と同期する。
        userDefaults.synchronize()
  
        }
}
