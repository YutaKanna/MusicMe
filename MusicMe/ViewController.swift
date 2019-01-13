//
//  ViewController.swift
//  MusicMe
//
//  Created by 漢那優太 on 2019/01/13.
//  Copyright © 2019 Yuta Kanna. All rights reserved.
//

//import UIKit
//import AVFoundation
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    // シンバルの音源ファイルを指定
//    let cymbalPath =
//        Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
//
//    // シンバル用のプレイヤーインスタンスを作成
//    var cymbalPlayer = AVAudioPlayer()
//
//    @IBAction func cymbal(_ sender: Any) {
//        do {
//            // シンバル用のプレイヤーに、音源ファイル名を指定
//            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
//
//            // シンバルの音源再生
//            cymbalPlayer.play()
//        }   catch {
//            print("シンバルで、エラーが発生しました！")
//        }
//    }
//
//    // ギターの音源ファイルを指定
//    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
//
//    // ギター用のプレイヤーインスタンスを作成
//    var guitarPlayer = AVAudioPlayer()
//
//    // ギターがタップされた時の処理
//    @IBAction func guitar(_ sender: Any) {
//        do {
//            // ギター用のプレイヤーに、音源ファイル名を指定
//            guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
//            guitarPlayer.play()
//        } catch {
//            print("ギターで、エラーが発生しました")
//        }
//    }
//
//    // バックミュージックの音源ファイルを指定
//    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
//
//    // バックミュージック用のプレイヤーインスタンスを作成
//    var backmusicPlayer = AVAudioPlayer()
//
//    // Playボタンがタップされた時の処理
//    @IBAction func play(_ sender: Any) {
//        do {
//            // バックミュージック用のプレイヤーに、音源ファイル名を指定
//            backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
//            //リピート設定
//            backmusicPlayer.numberOfLoops = -1
//            backmusicPlayer.play()
//        } catch {
//            print("エラーが発生しました！")
//        }
//    }
//
//    // Stopボタンがタップされた時の処理
//    @IBAction func stop(_ sender: Any) {
//        // バックミュージック停止
//        backmusicPlayer.stop()
//    }
//
//}

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    // シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()
    
    // シンバルがタップされた時の処理
    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    // ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    
    // ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
    // ギターがタップされた時の処理
    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    // バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    // バックミュージック用のプレイヤーインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()
    
    // Playボタンがタップされた時の処理
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }
    
    // Stopボタンがタップされた時の処理
    @IBAction func stop(_ sender: Any) {
        // バックミュージック停止
        backmusicPlayer.stop()
    }
    
    // 共通のプレイヤー再生処理
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path:URL, count:Int) {
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました!")
        }
    }
    
}
