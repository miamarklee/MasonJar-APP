//
//  ViewController.swift
//  MasonJar APP
//
//  Created by apple on 2019/4/21.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var dateSlider: UISlider!
    
    @IBOutlet weak var item1numTextField: UITextField!
    @IBOutlet weak var item2numTextField: UITextField!
    @IBOutlet weak var item3numTextField: UITextField!
    @IBOutlet weak var totalNTTextField: UITextField!
    
    var item1:Int=0
    var item2:Int=0
    var item3:Int=0
    
    @IBAction func itme1Stepper(_ sender: UIStepper) {
        item1 = Int(sender.value)
        item1numTextField.text = "\(item1)"
    }
    
    @IBAction func item2Stepper(_ sender: UIStepper) {
        item2 = Int(sender.value)
        item2numTextField.text = "\(item2)"
    }
    
    @IBAction func item3Stepper(_ sender: UIStepper) {
        item3 = Int(sender.value)
        item3numTextField.text = "\(item3)"
    }
    
    @IBAction func checkOutButton(_ sender: UIButton) {
    calculate()    //天阿，我這個沒寫？
    }
    
    
    @IBOutlet weak var item1Stepper: UIStepper!
    @IBOutlet weak var item2Stepper: UIStepper!
    @IBOutlet weak var item3Stepper: UIStepper!
    
    @IBAction func deleteAllButton(_ sender: UIButton) {
        item1numTextField.text = "0"
        item2numTextField.text = "0"
        item3numTextField.text = "0"
        totalNTTextField.text = "0"
        
        item1Stepper.value = 0
        item2Stepper.value = 0
        item3Stepper.value = 0
    }
    
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var timer:Timer?
    var num=0
    var num1=0
    let img=["w0","w1","w2","w3","w4","w5","w6"]
    
    func ticker(){  //每秒換圖跟時間
        if num>=img.count{
            num=0
            switchtime(num2: num)
            pictureView.image=UIImage(named: img[num])
        }else{
            switchtime(num2: num)
            pictureView.image=UIImage(named: img[num])
        }
        num+=1
    }
    
    //點選自動就能自動播放照片
    @IBAction func changeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            time()
            num=num1
            dateSlider.isEnabled=false
        }else{
            dateSlider.isEnabled=true
            timer?.invalidate()
        }
        
    }
    
    @IBAction func dateSlider(_ sender: UISlider) {
        sender.value.round()
        num1=Int(sender.value)
        pictureView.image = UIImage(named: img[num1])//變換照片
        print(num1)  //可以不要理他，那只是我想看值
        switchtime(num2: num1)
    }
    
    func time(){
        timer=Timer.scheduledTimer(withTimeInterval: 2, repeats: true){(timer) in self.ticker()}
    }
    func switchtime(num2:Int) {
        switch num2 {
        case 0:
            dateString = "w0"
        case 1:
            dateString = "w1"
        case 2:
            dateString = "w2"
        case 3:
            dateString = "w3"
        case 4:
            dateString = "w4"
        case 5:
            dateString = "w5"
        default:
            dateString = "w6"
        }
    }
    

func calculate() {       //calculate計算
    let sum = item1 * 1500 + item2 * 1800 + item3 * 2030
    totalNTTextField.text = "\(sum)"
}

override func viewDidDisappear(_ animated: Bool) {
    timer?.invalidate()   //timer要取消，不然會一直在背景執行
}
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   }
    
    
}

