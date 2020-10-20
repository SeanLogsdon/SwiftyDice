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
    
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    var player3: AVAudioPlayer?
    
   // func yTown { print "WWDC Swift is here" }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "rolldice", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)


            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()
            print("it work")


        } catch {
            print("it dont work")
        }
    }
    
    func playSound2() {
        guard let url = Bundle.main.url(forResource: "fanfare", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)


            player2 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player2 = player2 else { return }

            player2.play()
            print("it work2")


        } catch {
            print("it dont work2")
        }
    }
    
    func playSound3() {
        guard let url = Bundle.main.url(forResource: "failure", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)


            player3 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player3 = player3 else { return }

            player3.play()
            print("it work3")


        } catch {
            print("it dont work3")
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
            playSound3()
        } else if (imageName == "d20") {
            criticalLabel.text = "Epic Bruh Moment"
            playSound2()
        } else {
            criticalLabel.text = ""
            playSound()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    

    
    
}

