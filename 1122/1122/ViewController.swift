//
//  ViewController.swift
//  1122
//
//  Created by TEST on 2016/11/22.
//  Copyright © 2016年 TEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var img01 :UIImage = UIImage(named:"image1.jpg")!
    var img02 :UIImage = UIImage(named:"image2.jpg")!
    var img03 :UIImage = UIImage(named:"image3.jpg")!
    var img04 :UIImage = UIImage(named:"image4.jpg")!
    
    var imgArray:[UIImage] = []

    @IBAction func tap(_ sender: Any) {
        
        ///imageの配列
        imgArray = [img01,img02,img03,img04]
       
        
        ///CSVの配列
        var dataList:[String] = []
        func viewDidLoad() {
            super.viewDidLoad()
            
        do {
            //CSVファイルのパスを取得する。
            let csvPath = Bundle.main.path(forResource: "data", ofType: "csv")
            
            //CSVファイルのデータを取得する。
            let csvData = try String(contentsOfFile:csvPath!, encoding:String.Encoding.utf8)
            
            //改行区切りでデータを分割して配列に格納する。
            dataList = csvData.components(separatedBy: "\n")
        } catch {
            print(error)
        }
                
        ///乱数から画像とテキストを表示
        let ret = Int(arc4random_uniform(4))
        image.image = imgArray[ret]
        text.text = dataList[3]
    
    }
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

