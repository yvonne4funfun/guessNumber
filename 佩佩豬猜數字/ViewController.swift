//
//  ViewController.swift
//  佩佩豬猜數字
//
//  Created by 黃芳致 on 2020/6/11.
//  Copyright © 2020年 黃郁方. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumber: UITextField!  //輸入猜數字框框
    @IBOutlet weak var minNumber: UILabel!        //數字最小範圍
    
    @IBOutlet weak var hintLabel: UILabel!        //提示
    @IBOutlet weak var maxNamber: UILabel!        //數字最大範圍
    @IBOutlet weak var guessTime: UILabel!        //猜數字的次數
    var answerNumber : Int = 0
    var chance = 5

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additionalsetup after loading the view, typically from a nib.
        
        
        //設定遊戲條件
        answerNumber = Int.random(in: 1...100)        //亂數1-100
        minNumber.text = String(1)
        maxNamber.text = String(100)
        chance = 5
        inputNumber.text = String("")
        guessTime.text = String("\(chance)")
        hintLabel.text = ""
        
    }
    
    func running(){                                 //定義遊戲
        if let input = Int(inputNumber.text!){
            if chance > 0{
                if input >= Int(minNumber.text!)! && input <= Int(maxNamber.text!)! {
                    chance -= 1
                    if input == answerNumber{
                        hintLabel.text = String("完全正確！")
                    }else{
                        if chance == 0{
                            hintLabel.text = String("遊戲結束，答案是\(answerNumber)")
                        }else{
                            if input > answerNumber{
                                maxNamber.text = "\(input)"
                                hintLabel.text = String("佩佩豬是邊緣人沒有這麼多朋友")
                            }else if input < answerNumber{
                                minNumber.text = "\(input)"
                                hintLabel.text = String("佩佩豬有很多很多朋友")
                            }
                            inputNumber.text = nil
                        }
                    }
                }else{
                    hintLabel.text = String("請輸入範圍數字！")
                }
            }else{
                hintLabel.text = String("機會都用完了，答案是\(answerNumber)")
            }
            guessTime.text = "\(chance)"
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func goButton(_ sender: UIButton) {
    running()
        
    
    
    
    
    
    
    
    
    }
    
    @IBAction func playAgain(_ sender: UIButton) {viewDidLoad()
    }
    
}

