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
    
    // 載入音效
    let sounds = [try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "C3", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "D", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "E", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "F", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "G", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "A", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "B", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "C4", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "C#", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "D#", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "F#", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "G#", withExtension: "mp3")!),
                  try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "A#", withExtension: "mp3")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Play even in silent mode
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .default, options: [])
        }
        catch {
            print(error)
        }
    }
    
    var currentTouch: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBAction func hoverOnButton(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            let point = sender.location(in: self.view)
            var temp: UIButton?
            for button in buttons {
                if point.x >= button.frame.minX &&
                    point.x <= button.frame.maxX &&
                    point.y >= button.frame.minY &&
                    point.y <= button.frame.maxY &&
                    temp?.tag ?? 0 <= button.tag {
                    temp = button
                }
            }
            if currentTouch != temp && temp != nil {
                if currentTouch.subviews.count > 1 {
                    currentTouch.subviews.last?.removeFromSuperview()
                }
                currentTouch = temp
                let view = UIView(frame: CGRect(x: 0, y: 0, width: currentTouch.frame.width, height: currentTouch.frame.height))
                view.backgroundColor = #colorLiteral(red: 1, green: 0.6597909764, blue: 1, alpha: 0.5)
                currentTouch.addSubview(view)
                currentTouch?.sendActions(for: .touchDown)
                
            }
        }
        if sender.state == .ended {
            if currentTouch.subviews.count > 1 {
                currentTouch.subviews.last?.removeFromSuperview()
            }
        }
    }
    
    
    // 播放音效
    @IBAction func playSound(_ sender: UIButton) {
        currentTouch = sender
        
        // 選擇要播放哪個音效
        let player = sounds[sender.tag]!
    
        // 將播放時間歸 0
        player.currentTime = 0
        player.play()
    }
    
}

extension UIButton {
    open override var isHighlighted: Bool {
        didSet {
            if isHighlighted && isHighlighted != oldValue {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
                view.backgroundColor = #colorLiteral(red: 1, green: 0.6597909764, blue: 1, alpha: 0.5)
                self.addSubview(view)
            }

            if !isHighlighted && self.subviews.count > 1 {
                self.subviews.last?.removeFromSuperview()
            }
        }
    }
}
