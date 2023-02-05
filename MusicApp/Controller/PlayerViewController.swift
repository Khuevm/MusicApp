//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by Khue on 31/01/2023.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Variable
    var songs: [Song] = []
    var position: Int = 0
    
    private var player = AVAudioPlayer()
    private var currentVolume: Float = 0.5
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        player.stop()
    }
    
    // MARK: - IBAction
    @IBAction func volumeSliderDidChange(_ sender: UISlider) {
        player.volume = sender.value
        currentVolume = player.volume
    }
    
    @IBAction func pauseButtonDidTap(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            pauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            pauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        if position < songs.count - 1 {
            position = position + 1
            config()
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        if position > 0 {
            position = position - 1
            config()
        }
    }
    // MARK: - Helper
    private func config(){
        let currentSong = songs[position]
        nameLabel.text = currentSong.name
        artistLabel.text = currentSong.artistName
        coverImage.image = UIImage(named: currentSong.imageName)
        coverImage.layer.cornerRadius = 15
        
        //Player Control
        backButton.layer.opacity = position == 0 ? 0.2 : 1
        nextButton.layer.opacity = position == songs.count - 1 ? 0.2 : 1
        pauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        playSong(songName: currentSong.audioName)
    }
    
    private func playSong(songName: String) {
        let url = Bundle.main.url(forResource: songName, withExtension: "mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.volume = currentVolume
            player.play()
        } catch {
            print("Cannot find \(songName)")
        }
        
    }

}
