//
//  ViewController.swift
//  card2
//
//  Created by student on 2022/3/9.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game:MatchingGame = MatchingGame(numberOfPairsOfCards: (btn_collection.count+1)/2)
    
    @IBOutlet weak var filps_view: UILabel!
    var flips:Int = 0
    {
        didSet{
            filps_view.text = "Flips:\(flips)"
        }
    }
    @IBOutlet var btn_collection: [UIButton]!
    var emoji_choices = ["🤡","💩","🥵","🥴"]

    var emoji = Dictionary<Int,String>()
    
    @IBAction func flipCard(_ sender: UIButton) {
        if let cardNumber =  btn_collection.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }else{
            print("no in the collection")
        }
        flips += 1
    }
    
    func updateViewFromModel(){
        for index in btn_collection.indices{
            let button = btn_collection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.9529411765, alpha: 1)
            }
        }
    }
    
    func emoji(for card:Card)->String{
        
        if emoji[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emoji_choices.count)))
            emoji[card.identifier] = emoji_choices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
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

