//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Yota Yamashita on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func calculationBMI(height: Double, weight: Double) -> Double { //引数の指定とdoubleで結果を返す
        return weight / (height * height)
    }
    
    func checkIfFat(bmi: Double) {
        if bmi < 18.0 {
            textLabel.text = "すごく痩せていますね"
        } else if bmi > 18.0 && bmi < 25.0 {
            textLabel.text = "健康な体型です"
        } else {
            textLabel.text = "痩せましょうか"
        }
    }

    @IBAction func button_tapped(_ sender: Any) {
        let heightText = heightTextField.text
        let weightText = weightTextField.text
        
        guard let height = heightText, let weight = weightText else {
            return
        }
        
        //Doubleである場合しか実行できない↓
        if let heightDouble = Double(height), let weightDouble = Double(weight) {
            let bmi = calculationBMI(height: heightDouble, weight: weightDouble)
            bmiLabel.text = "BMI：\(Int(bmi))"
            checkIfFat(bmi: bmi)
        }
    }
    
}

