//
//  ViewController.swift
//  Miku No Shoushitsu
//
//  Created by 吳世馨 on 2020/12/19.
//

import UIKit
import AVFoundation




class ViewController: UIViewController{
    @IBOutlet weak var lyricsTextField: UITextField!
    @IBOutlet weak var voiceSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    let player = AVPlayer()
    


    @IBAction func changeSliders(_ sender: Any) {
        volumeLabel.text = String(format: "%.2f", voiceSlider.value)
        pitchLabel.text = String(format: "%.2f", pitchSlider.value)
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
        

        
      
        
        
@IBAction func sing(_ sender: Any) {
            let speechUtterance = AVSpeechUtterance(string: lyricsTextField.text!)
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            speechUtterance.pitchMultiplier = pitchSlider.value
            speechUtterance.rate = speedSlider.value
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
    }
            
            
        override func viewDidLoad() {
        super.viewDidLoad()
            let pianoMusicUrl = Bundle.main.url(forResource: "pianoMusic", withExtension: "mp4")!
            let playerItem = AVPlayerItem(url: pianoMusicUrl)
            player.replaceCurrentItem(with: playerItem)
            player.volume = 0.3
            player.play()
    }

}

