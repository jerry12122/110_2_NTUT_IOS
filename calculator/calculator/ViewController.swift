//
//  ViewController.swift
//  calculator
//
//  Created by jerry on 2022/3/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var currentDisplay: UILabel!
    @IBOutlet weak var functionView: UILabel!
    
    @IBOutlet var inputCollection: [UIButton]!
    @IBOutlet var numberCollection: [UIButton]!
    @IBOutlet var opratorCollection: [UIButton]!
    
    var numArray = [1,2,3,4,5,6,7,8,9,0]
    var inputArray = ["0","1","2","3","4","5","6","7","8","9","÷","×","−","+","="]
    var opratorArray = ["÷","×","−","+"]
    var previousNumber:Int = 0
    var previousOprator:Int = 0
    var functionString:String = ""
    {
        didSet{
            functionView.text = functionString
        }
    }
    var currentNumber:Int = 0
    {
        didSet{
            currentDisplay.text = String(currentNumber)
        }
    }
    
    @IBAction func opratorAction(_ sender: UIButton) {
        previousNumber = currentNumber
        currentNumber = 0
        if let inputOprator = opratorCollection.firstIndex(of: sender)
        {
            previousOprator = inputOprator
        }
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        switch(previousOprator){
        case 0:
            currentNumber = previousNumber / currentNumber
            break;
        case 1:
            currentNumber = previousNumber * currentNumber
            break;
        case 2:
            currentNumber = previousNumber - currentNumber
            break;
        case 3:
            currentNumber = previousNumber + currentNumber
            break;
        default:
            break;
        }
    }
    

    @IBAction func chgFunctionDisplayLabel(_ sender: UIButton) {
        if let inputLabel = inputCollection.firstIndex(of: sender)
        {
            functionString = functionString + inputArray[inputLabel]
        }
    }
    
    
    @IBAction func zero(_ sender: Any) {
        functionString = ""
        currentNumber = 0
    }
    @IBAction func chgDisplayLabel(_ sender: UIButton) {
        if let inputNum = numberCollection.firstIndex(of: sender)
        {
            
            currentNumber = currentNumber*10 + inputNum
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

