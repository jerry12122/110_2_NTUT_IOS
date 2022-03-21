//
//  ViewController.swift
//  calculator
//
//  Created by jerry on 2022/3/21.
//

import UIKit

class ViewController: UIViewController {

    var inputsOprand: Array<Int> = Array()
    var inputsOprator: Array<Int> = Array()
    
    @IBOutlet weak var currentDisplay: UILabel!
    @IBOutlet weak var functionView: UILabel!
    
    
    @IBOutlet var inputCollection: [UIButton]!
    var inputArray = ["0","1","2","3","4","5","6","7","8","9","÷","×","−","+","="]
    
    @IBOutlet var numberCollection: [UIButton]!
    var numArray = [1,2,3,4,5,6,7,8,9,0]
    
    @IBOutlet var opratorCollection: [UIButton]!
    var opratorArray = ["÷","×","−","+"]

    
    var isNewValue:Bool = false
    
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
        inputsOprand.append(currentNumber)
        if let currentOprator = opratorCollection.firstIndex(of: sender)
        {
            inputsOprator.append(currentOprator)
        }
        isNewValue = true
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        inputsOprand.append(currentNumber)
        while(inputsOprand.count>1){
            for currentOprator in [1,0,2,3]{
                print("currentOprator:\(opratorArray[currentOprator])")
                while(inputsOprator.contains(currentOprator)){
                    print("inputsOprand:\(inputsOprand)")
                    print("inputsOprator:\(inputsOprator)")
                    for inputOpratorIndex in 0...inputsOprator.count-1{
                        if(inputsOprator[inputOpratorIndex] == currentOprator){
                            inputsOprand[inputOpratorIndex] = calc(a: inputsOprand[inputOpratorIndex], b: inputsOprand[inputOpratorIndex+1], o: currentOprator)
                            inputsOprand.remove(at: inputOpratorIndex+1)
                            inputsOprator.remove(at: inputOpratorIndex)
                            print("inputsOprand:\(inputsOprand)")
                            print("inputsOprator:\(inputsOprator)")
                            break
                        }
                    }
                }
            }
        }
        currentNumber = inputsOprand[0]
    }
    func calc(a:Int,b:Int,o:Int) -> Int{
        switch(o){
        case 0:
            return a/b
            
        case 1:
            return a*b
            
        case 2:
            return a-b
            
        case 3:
            return a+b
            
        default:
            return 0
        }
        
    }

    @IBAction func chgFunctionDisplayLabel(_ sender: UIButton) {
        if let inputLabel = inputCollection.firstIndex(of: sender)
        {
            functionString = functionString + inputArray[inputLabel]
        }
    }
    
    
    @IBAction func zero(_ sender: Any) {
        inputsOprator = Array()
        inputsOprand = Array()
        functionString = ""
        currentNumber = 0
    }
    @IBAction func chgDisplayLabel(_ sender: UIButton) {
        if isNewValue == true{
            currentNumber = 0
            isNewValue = false
        }
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

