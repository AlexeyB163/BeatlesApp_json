//
//  TrackViewController.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

import UIKit
import Alamofire

class TrackViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var tracks:[SearchResponse]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
        fetchDataTrack()
        
        
    }
    
    private func fetchDataTrack() {
        NetworkManager.shared.fetchTrack(urlString: Link.urlTrack.rawValue) { dataResponse in
            switch dataResponse {
                
            case .success(let tracksData):
                print(" ")

            case .failure(let error):
                print(error)
            }
        }
    }
}

//extension TrackViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        tracks?.results.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath) as! TableViewCell
//        if let track = tracks?.results[indexPath.row] {
//            cell.setDataCell(track: track)
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
//}

