//
//  ViewController.swift
//  card
//
//  Created by jerry on 2022/3/9.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipView: UILabel!
    var fCount:Int = 0
    {
        didSet{
            flipView.text = "Flips:\(fCount)"
        }
    }
    var emoji = ["🥵","🥴"]
    
    @IBOutlet var cardsView: [UIButton]!
    
    @IBAction func cardChange(_ sender: UIButton) {
        if let cardNumber = cardsView.firstIndex(of: sender){
            print("cardNumber = \(cardNumber)")
            if sender.currentTitle == emoji[cardNumber]{
                sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.9529411765, alpha: 1)
            }else{
                sender.setTitle(emoji[cardNumber], for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9411764706, blue: 0.9019607843, alpha: 1)
            }
            fCount+=1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

