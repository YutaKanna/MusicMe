//
//  ViewController.swift
//  MusicMe
//
//  Created by 漢那優太 on 2019/01/13.
//  Copyright © 2019 Yuta Kanna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // シンバルの音源ファイルを指定
    let cymbalPath =
        Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    // シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()
    
    @IBAction func cymbal(_ sender: Any) {
        do {
            // シンバル用のプレイヤーに、音源ファイル名を指定
            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
            
            // シンバルの音源再生
            cymbalPlayer.play()
        }   catch {
            print("シンバルで、エラーが発生しました！")
        }
    }
    
}

