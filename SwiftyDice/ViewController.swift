//
//  ViewController.swift
//  SwiftyDice
//
//  Created by Sean Logsdon on 10/13/20.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        // we need to do cool stuff here hehe
    }
    @IBAction func buttonGotPressed() {
        rollDice()
    }
    
    func rollDice() {
        // do cool stuff
        print("we rollin but in a car")
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if (imageName == "d1") {
            criticalLabel.text = "Noob"
        } else if (imageName == "d20") {
            criticalLabel.text = "Epic Bruh Moment"
        } else {
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
   // func yTown { print "WWDC Swift is here" }
}

