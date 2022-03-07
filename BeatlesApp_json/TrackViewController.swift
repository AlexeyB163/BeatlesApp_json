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
    
    private var tracks:[Track]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchDataTrack()
    }
    
    private func fetchDataTrack() {
        NetworkManager.shared.fetchTrack(urlString: Link.urlTrack.rawValue) { dataResponse in
            switch dataResponse {
            case .success(let tracksData):
                DispatchQueue.main.async {
                    self.tracks = tracksData
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension TrackViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath) as! TableViewCell
        if let track = tracks?[indexPath.row] {
            cell.setDataCell(track: track)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

