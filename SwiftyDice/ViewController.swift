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
    
    var audioPlayer: AVAudioPlayer?
    
   // func yTown { print "WWDC Swift is here" }
    func playSound(sound: String, type: String ) {
            if let path = Bundle.main.path(forResource: sound, ofType: type) {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    audioPlayer?.play()

                } catch {
                    print{ "ERROR: Could not find and play the sound file!"}
                }
            }
        }
    
    
    func rollDice() {
        // do cool stuff
        
        print("we rollin but in a car")
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if (imageName == "d1") {
            criticalLabel.text = "Noob"
            playSound(sound: "failure",type: ".mp3")
        } else if (imageName == "d20") {
            criticalLabel.text = "Epic Bruh Moment"
            playSound(sound: "fanfare",type: ".wav")
        } else {
            criticalLabel.text = ""
            playSound(sound: "rolldice",type: ".mp3")
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    

    
    
}

