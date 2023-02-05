//
//  ViewController.swift
//  MusicApp
//
//  Created by Khue on 31/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    private var songs = [Song]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        configSong()
    }

    // MARK: - Helper
    private func configSong(){
        songs.append(Song(name: "Waiting For You", albumName: "Waiting For You", artistName: "MONO, Onionn", imageName: "WaitingForYou", audioName: "WaitingForYou"))
        songs.append(Song(name: "để tôi ôm em bằng giai điệu này", albumName: "123", artistName: "Kai Đinh, MIN, GREY D", imageName: "DeToiOmEmBangGiaiDieuNay", audioName: "DeToiOmEmBangGiaiDieuNay"))
        songs.append(Song(name: "Chuyện Đôi Ta", albumName: "Chuyện Đôi Ta", artistName: "Emcee L, Muộii", imageName: "ChuyenDoiTa", audioName: "ChuyenDoiTa"))
        songs.append(Song(name: "Waiting For You", albumName: "Waiting For You", artistName: "MONO, Onionn", imageName: "WaitingForYou", audioName: "WaitingForYou"))
        songs.append(Song(name: "để tôi ôm em bằng giai điệu này", albumName: "123", artistName: "Kai Đinh, MIN, GREY D", imageName: "DeToiOmEmBangGiaiDieuNay", audioName: "DeToiOmEmBangGiaiDieuNay"))
        songs.append(Song(name: "Chuyện Đôi Ta", albumName: "Chuyện Đôi Ta", artistName: "Emcee L, Muộii", imageName: "ChuyenDoiTa", audioName: "ChuyenDoiTa"))
        songs.append(Song(name: "Waiting For You", albumName: "Waiting For You", artistName: "MONO, Onionn", imageName: "WaitingForYou", audioName: "WaitingForYou"))
        songs.append(Song(name: "để tôi ôm em bằng giai điệu này", albumName: "123", artistName: "Kai Đinh, MIN, GREY D", imageName: "DeToiOmEmBangGiaiDieuNay", audioName: "DeToiOmEmBangGiaiDieuNay"))
        songs.append(Song(name: "Chuyện Đôi Ta", albumName: "Chuyện Đôi Ta", artistName: "Emcee L, Muộii", imageName: "ChuyenDoiTa", audioName: "ChuyenDoiTa"))
        songs.append(Song(name: "Waiting For You", albumName: "Waiting For You", artistName: "MONO, Onionn", imageName: "WaitingForYou", audioName: "WaitingForYou"))
        songs.append(Song(name: "để tôi ôm em bằng giai điệu này", albumName: "123", artistName: "Kai Đinh, MIN, GREY D", imageName: "DeToiOmEmBangGiaiDieuNay", audioName: "DeToiOmEmBangGiaiDieuNay"))
        songs.append(Song(name: "Chuyện Đôi Ta", albumName: "Chuyện Đôi Ta", artistName: "Emcee L, Muộii", imageName: "ChuyenDoiTa", audioName: "ChuyenDoiTa"))
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell") as! MusicTableViewCell
        cell.setData(song: songs[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "playerView") as! PlayerViewController
        vc.songs = songs
        vc.position = indexPath.row
        
        present(vc, animated: true)
    }
}
