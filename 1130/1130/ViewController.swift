//
//  ViewController.swift
//  1130
//
//  Created by TEST on 2016/11/30.
//  Copyright © 2016年 TEST. All rights reserved.
//

import UIKit

class ViewController:

    var img01 :UIImage = UIImage(named:"image1.jpg")!
    var img02 :UIImage = UIImage(named:"image2.jpg")!
    var img03 :UIImage = UIImage(named:"image3.jpg")!
    var img04 :UIImage = UIImage(named:"image4.jpg")!
    
    var imgArray:[UIImage] = []
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func tap(_ sender: Any) {
        imgArray = [img01,img02,img03,img04]
        let ret = Int(arc4random_uniform(4))
        image.image = imgArray[ret]
    }
    
    let userDefaults = UserDefaults.standard
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート先を自分に設定する
        testTextField.delegate = self
        
        //文字列が保存されている場合はラベルに文字列を設定する。
        if let labelText = userDefaults.string(forKey: "labelText") {
            testLabel.text = labelText
        }
    }
    
    
    //Returnキー押下時の呼び出しメソッド
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        
        //キーボードをしまう
        self.view.endEditing(true)
        
        //テキストフィールドの文字列をラベルに設定する。
        testLabel.text = testTextField.text
        
        //ラベルの文字列を保存する。
        userDefaults.set(testLabel.text, forKey:"labelText")
        
        //plistファイルへの出力と同期する。
        userDefaults.synchronize()
        
        return false
}
