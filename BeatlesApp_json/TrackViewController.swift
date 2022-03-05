//
//  TrackViewController.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

import UIKit

class TrackViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var tracks:SearchResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchDataTrack()
        
    }
    
    private func fetchDataTrack() {
        NetworkManager.shared.fetchTrack(urlString: Link.urlTrack.rawValue) { result in
            switch result{
            case .success(let searchResponse):
                DispatchQueue.main.async {
                    self.tracks = searchResponse
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
        tracks?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath) as! TableViewCell
        if let track = tracks?.results[indexPath.row] {
            cell.setDataCell(track: track)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

