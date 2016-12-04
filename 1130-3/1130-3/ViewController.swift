//
//  ViewController.swift
//  1130-3
//
//  Created by TEST on 2016/12/01.
//  Copyright © 2016年 TEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coin = 100
    var countNum = 0
    var timerRunning = false
    var timer = Timer()
    var ruiseki_time = 0
    func update() {
        countNum += 1;
        label.text = "\(countNum)"
    }
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBAction func start(_ sender: Any) {
    
        
        if timerRunning == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            timerRunning = true
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {

        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
        }
        ruiseki_time = ruiseki_time + countNum;
        coin = coin + ruiseki_time/5;
        countNum = 0
        label.text = "0"
        label2.text = "\(coin)"
    }
        
        let userDefaults = UserDefaults.standard
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //ラベルの文字列を保存する。
        userDefaults.set(label2.text, forKey:"testInt")
        
        //plistファイルへの出力と同期する。
        userDefaults.synchronize()
    
        
        //文字列が保存されている場合はラベルに文字列を設定する。
            if coin == userDefaults.integer(forKey: "testInt") {
                label2.text = "\(coin)"
            }
            coin = userDefaults.integer(forKey: "testInt")
            label2.text = "coin"
    
            
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
