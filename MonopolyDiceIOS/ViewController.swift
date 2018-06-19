//
//  ViewController.swift
//  MonopolyDiceIOS
//
//  Created by Administrator on 6/19/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lblBet: UILabel!
    @IBOutlet weak var myLbl: UILabel!
    var betAmount:Double = 0.00
    var totalAmount = 1000.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddMoney(_ sender: Any) {
        betAmount += 20.00
        lblBet.text = "$\(betAmount)"
    }
    
    @IBAction func GOaction(_ sender: Any) {
        let rightDiceNumber = Int(arc4random_uniform(5)) + 1
        let leftDiceNumber = Int(arc4random_uniform(5)) + 1
        imageSetter(rightDiceNumber:rightDiceNumber, leftDiceNumber:leftDiceNumber )
        
            if (rightDiceNumber == leftDiceNumber){
                totalAmount += betAmount * 2
                lblNumber.textColor = UIColor.red
                lblResult.text = "You won! Your total amount is now \(totalAmount)"
            } else {
                totalAmount -= betAmount
                lblResult.text = "You Lost! Your total amount is now \(totalAmount)"
        }
        
            lblNumber.text = String(rightDiceNumber+leftDiceNumber)
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageSetter(rightDiceNumber:Int, leftDiceNumber:Int){
        switch (rightDiceNumber) {
        case 1 : rightImage.image = UIImage (named: "dice1.jpg")
        case 2 : rightImage.image = UIImage (named: "dice2.jpg")
        case 3 : rightImage.image = UIImage (named: "dice3.jpg")
        case 4 : rightImage.image = UIImage (named: "dice4.jpg")
        case 5 : rightImage.image = UIImage (named: "dice5.jpg")
        default : rightImage.image = UIImage (named: "dice6.jpg")
        }
        
        switch (leftDiceNumber) {
        case 1 : leftImage.image = UIImage (named: "dice1.jpg")
        case 2 : leftImage.image = UIImage (named: "dice2.jpg")
        case 3 : leftImage.image = UIImage (named: "dice3.jpg")
        case 4 : leftImage.image = UIImage (named: "dice4.jpg")
        case 5 : leftImage.image = UIImage (named: "dice5.jpg")
        default: leftImage.image = UIImage (named: "dice6.jpg")
        }
    }
}

