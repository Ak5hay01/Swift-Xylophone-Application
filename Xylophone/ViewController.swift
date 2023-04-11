//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //audio visual foundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func cButtonPressed(_ sender: UIButton) {
        
        playSound(sound: sender.currentTitle!)
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1.0
        }
    }
    
    func playSound(sound: String) {
        
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { return }

        do {
            // play the sound even though the device is on silent
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
           
            // ask player to play this sound
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            //Player plays the sound
            player.play()

        } catch let error {
            //catching the error here
            print(error.localizedDescription)
        }
    }
    

}

