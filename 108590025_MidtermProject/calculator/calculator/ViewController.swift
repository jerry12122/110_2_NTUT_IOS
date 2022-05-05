//
//  ViewController.swift
//  calculator
//
//  Created by jerry on 2022/3/21.
//

import UIKit

class ViewController: UIViewController {

    var inputsOprand: Array<Double> = Array()
    var inputsOprator: Array<Int> = Array()
    
    @IBOutlet weak var currentDisplay: UILabel!
    @IBOutlet weak var functionView: UILabel!
    
    @IBOutlet var inputCollection: [UIButton]!
    var inputArray = ["0","1","2","3","4","5","6","7","8","9","÷","×","−","+","="]
    
    @IBOutlet weak var CBottonView: UIButton!
    @IBOutlet var numberCollection: [UIButton]!
    var numArray = [1,2,3,4,5,6,7,8,9,0]
    
    @IBOutlet var opratorCollection: [UIButton]!
    var opratorArray = ["÷","×","−","+"]

    var isNewValue:Bool = false
    var isCleaned:Bool = false
    var isEqualed:Bool = false
    var isDot:Bool = false
    var dotTime:Int = 1
    var functionString:String = ""
    {
        didSet{
            functionView.text = functionString
        }
    }
    var currentNumber:Double = 0
    {
        didSet{
            if isDot{
                currentDisplay.text = String(currentNumber)
                //currentDisplay.text = String((round(pow(10,Double(dotTime)) * currentNumber) / pow(10,Double(dotTime))))
            }else{
                currentDisplay.text = String(Int(currentNumber))
            }
            
        }
    }
    
    @IBAction func opratorAction(_ sender: UIButton) {
        inputsOprand.append(currentNumber)
        isDot = false
        dotTime = 1
        currentNumber = 0
        if let currentOprator = opratorCollection.firstIndex(of: sender)
        {
            sender.setTitleColor(.orange, for: .normal)
            sender.backgroundColor = .white
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
        CBottonView.setTitle("AC", for: .normal)
        isCleaned = true
        isEqualed = true
        isDot = false
        dotTime = 1
    }
    func calc(a:Double,b:Double,o:Int) -> Double{
        switch(o){
        case 0:
            if b==0{
                return 0
            }else{
                return a/b
            }
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
    
    
    @IBAction func zero(_ sender: UIButton) {
        if(isCleaned){
            for index in opratorCollection.indices{
                let button = opratorCollection[index]
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .orange
            }
            currentNumber = 0
            inputsOprator = Array()
            inputsOprand = Array()
            functionString = ""
            sender.setTitle("C", for: .normal)
            isCleaned = false
            
        }
        else{
            if !isNewValue{
                functionString = ""
                if(inputsOprator.count>0){
                    for i in 0...inputsOprator.count-1{
                        functionString += String(inputsOprand[i])
                        functionString += opratorArray[inputsOprator[i]]
                    }
                }else{
                    inputsOprator = Array()
                    inputsOprand = Array()
                }
                isNewValue = true
            }
            if let lastIndex = inputsOprator.last {
                opratorCollection[lastIndex].setTitleColor(.orange, for: .normal)
                opratorCollection[lastIndex].backgroundColor = .white

                //lastElement contains the last element
            }

            sender.setTitle("AC", for: .normal)
            currentNumber = 0
            isCleaned = true
        }
        isEqualed = false
        isDot = false
        
        dotTime = 1
    }
   
    @IBAction func dot(_ sender: UIButton) {
        if !isDot{
            functionString += "."
            isDot = true
            dotTime = 1
        }
    }
    @IBAction func chgDisplayLabel(_ sender: UIButton) {
        if isEqualed == true{
            zero(CBottonView)
        }
        if isNewValue == true{
            currentNumber = 0
            isNewValue = false
            for index in opratorCollection.indices{
                let button = opratorCollection[index]
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .orange
            }
        }
        if let inputNum = numberCollection.firstIndex(of: sender)
        {
            if isDot{
                currentNumber = currentNumber + Double(inputNum)*pow(0.1,Double(dotTime))
                dotTime = dotTime + 1
            }else{
                currentNumber = currentNumber*10 + Double(inputNum)
            }
            
        }
        isCleaned = false
        CBottonView.setTitle("C", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

