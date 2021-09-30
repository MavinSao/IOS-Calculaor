//
//  ViewController.swift
//  MyApp
//
//  Created by Mavin on 9/7/20.
//  Copyright © 2020 hrd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousValue = ""
    var currentValue = ""
    var sign = ""
    
    @IBOutlet weak var textPrevious: UILabel!
    @IBOutlet weak var textResult: UILabel!
    @IBOutlet weak var textSign: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearPress(_ sender: Any) {
        previousValue = ""
        currentValue = ""
        sign = ""
    }
    
    var isEqualTouch = false
    var isNumPress = true
    
    @IBAction func numberPress(_ sender: UIButton) {
        
        isNumPress = true

        if isEqualTouch {
            textResult.text = "0"
            textPrevious.text = "0"
            currentValue = ""
            previousValue = ""
            isEqualTouch = false
        }
        

        textResult.text = setValue(text: sender.currentTitle!)
    }
    
    func setValue(text:String)->String{
        
       
        if textResult.text?.first == "0"{
            if text == "0"{
              return "0"
            }
        }
        if text == "." {
            if textResult.text == "0"{
                currentValue = "0"
            }
            if textResult.text != "0"{
                currentValue = textResult.text!
            }
            if textResult.text?.contains(".") == true{
               return currentValue
            }
        }
        currentValue += text
        
        return currentValue
    }
    
    func caculateValue(){
        
        var result = ""
        let value1 = Double(previousValue) ?? 0
        let value2 = Double(currentValue) ?? 0
        switch sign {
        case "+":
            result = String(format: "%g", value1 + value2)
        case "-":
            result = String(format: "%g", value1 - value2)
        case "x":
            result = String(format: "%g", value1 * (isNumPress ? value2 : 1))
        case "÷":
            result = String(format: "%g", value1 / (isNumPress ? value2 : 1))
        case "%":
            result = String(format: "%g", value1.truncatingRemainder(dividingBy: value2))
        default:
            result = previousValue
        }
        
//        sign = ""
        previousValue = "\(result)"
    }
    
    @IBAction func mathSignPress(_ sender: UIButton) {
        
        isNumPress = false
        isEqualTouch = false
        
        //Assign to previos value
        if(previousValue != ""){
          caculateValue()
          textResult.text = previousValue
        }else{
          previousValue = currentValue
        }
        currentValue = ""
        //
        textPrevious.text = previousValue
        sign = sender.currentTitle!
        textSign.text = "\(sign)"
        
    }
    
    @IBAction func clearButtonPress(_ sender: Any) {
        textResult.text = "0"
        textPrevious.text = "0"
        sign = ""
        currentValue = ""
        previousValue = ""
        textSign.text = ""
    }
    
    var i = 0
    
    @IBAction func ChangePlusNegative(_ sender: Any) {
        i == 0 ? nagative() : plus()
    }
    
    func plus() {
        let currentVal = Double(textResult.text!)
        currentValue = String(format: "%g", currentVal! * -1)
        i = 0
        textResult.text = currentValue
    }
    
    func nagative() {
        let currentVal = Double(textResult.text!)
        currentValue = String(format: "%g", currentVal! * -1)
        i = 1
        textResult.text = currentValue
    }
    
    @IBAction func showResultPress(_ sender: Any) {
        caculateValue()
        sign = ""
        textSign.text = ""
        textResult.text = previousValue == "" ? "0" : previousValue
        isEqualTouch = true
        isNumPress = false
        
        
        
    }

}

