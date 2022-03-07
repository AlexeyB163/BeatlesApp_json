//
//  TableViewCell.swift
//  BeatlesApp_json
//
//  Created by User on 28.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var genre: UILabel!
    
//    func setDataCell(track: SearchResponse) {
//        trackName.text = track.trackName
//        collectionName.text = track.collectionName
//        artistName.text = track.artistName
//        genre.text = track.primaryGenreName
//        DispatchQueue.global().async {
//            guard let url = URL(string: track.artworkUrl60 ?? "plug") else { return }
//            guard let dataImage = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self.titleImage.image = UIImage(data: dataImage)
//            }
//        }
//    }
}
