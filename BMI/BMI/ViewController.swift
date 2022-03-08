//
//  ViewController.swift
//  BMI
//
//  Created by jerry on 2022/3/2.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var w_s: UILabel!
    @IBAction func count(_ sender: Any) {
        let h = Float(height.text!)!/100.0
        let w = Float(weight.text!)!
        let b = w/(h*h)
        bmi.text = String(w/(h*h))
        if (b < 18.5) {
            w_s.text = "Underweight"
        }
        else if(b<24.9){
            w_s.text = "Healthy weight"
        }
        else {
            if(sex.selectedSegmentIndex == 1){
                w_s.text = "it's a secret."
            }
            else{
                if(b<29.9){
                    w_s.text = "Overweight"
                }else{
                    w_s.text = "Obesity"
                }
            }
            
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

