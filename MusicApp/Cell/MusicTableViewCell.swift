//
//  MusicTableViewCell.swift
//  MusicApp
//
//  Created by Khue on 31/01/2023.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.accessoryType = .disclosureIndicator
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(song: Song) {
        nameLabel.text = song.name
        artistLabel.text = song.artistName
        
        coverImage.image = UIImage(named: song.imageName)
        coverImage.layer.cornerRadius = 15
    }
    
}
