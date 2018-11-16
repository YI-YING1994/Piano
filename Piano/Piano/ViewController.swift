//
//  ViewController.swift
//  Piano
//
//  Created by MCUCSIE on 10/23/18.
//  Copyright © 2018 MCUCSIE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var sounds: [String: AVAudioPlayer?]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 載入音效
        sounds = ["A": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "A", withExtension: "mp3")!),
                  "C3": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "C3", withExtension: "mp3")!),
                  "B": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "B", withExtension: "mp3")!),
                  "C#": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "C#", withExtension: "mp3")!),
                  "C4": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "C4", withExtension: "mp3")!),
                  "G": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "G", withExtension: "mp3")!),
                  "F": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "F", withExtension: "mp3")!),
                  "D": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "D", withExtension: "mp3")!),
                  "E": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "E", withExtension: "mp3")!),
                  "D#": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "D#", withExtension: "mp3")!),
                  "F#": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "F#", withExtension: "mp3")!),
                  "G#": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "G#", withExtension: "mp3")!),
                  "A#": try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "A#", withExtension: "mp3")!)]
    }

    // 播放音效
    @IBAction func playSound(_ sender: UIButton) {
        // 選擇要播放哪個音效
        let player = sounds[sender.currentTitle!]!

        // 將播放時間歸 0
        player?.currentTime = 0
        player?.play()
    }

}

