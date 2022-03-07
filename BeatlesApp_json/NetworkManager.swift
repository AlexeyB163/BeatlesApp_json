//
//  NetworkManager.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case urlTrack = "https://itunes.apple.com/search?term=the+beatles&media=music&limit=10"
}

struct NetworkManager {
    
    static var shared = NetworkManager()
    
    func fetchTrack(urlString: String, completion: @escaping (Result<[Track], Error> ) -> Void) {
        var tracks:[Track] = []
        
        AF.request(Link.urlTrack.rawValue)
            .responseJSON { dataResponse in
                guard let statuscode = dataResponse.response?.statusCode else { return }
                
                if (200...300).contains(statuscode) {
                    guard let value = dataResponse.value else { return }
                    tracks = Track.getTracks(from: value)
                    completion(.success(tracks))
                } else {
                    completion(.failure(dataResponse.error?.localizedDescription as! Error))
                }
            }
    }
    private init() {}
}


