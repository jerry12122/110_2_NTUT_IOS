//
//  ViewController.swift
//  card2
//
//  Created by student on 2022/3/9.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game:MatchingGame = MatchingGame()
    
    @IBOutlet weak var filps_view: UILabel!
    var flips:Int = 0
    {
        didSet{
            filps_view.text = "Flips:\(flips)"
        }
    }
    var emoji_choices = ["🤡","💩","🥵","🥴","🥴","🥵","💩","🤡"]
    @IBOutlet var btn_collection: [UIButton]!
    
    @IBAction func flipCard(_ sender: UIButton) {
        if let cardNumber = btn_collection.firstIndex(of: sender){
            print("cardNumber = \(String(describing: cardNumber))")
            if sender.currentTitle == emoji_choices[cardNumber]{
                sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.8505474329, green: 0.8489837646, blue: 0.9567221999, alpha: 1)
            }else{
                sender.setTitle(emoji_choices[cardNumber], for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.9572871327, green: 0.9418804049, blue: 0.8999911547, alpha: 1)
            }
            flips+=1
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

